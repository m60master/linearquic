/*
* Author: Christian Huitema
* Copyright (c) 2019, Private Octopus, Inc.
* All rights reserved.
*
* Permission to use, copy, modify, and distribute this software for any
* purpose with or without fee is hereby granted, provided that the above
* copyright notice and this permission notice appear in all copies.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Private Octopus, Inc. BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#ifndef quicdoq_H
#define quicdoq_H

/* DoQ client.
 *
 * The DoQ client assumes that Quic is managed in a background thread. That thread
 * owns the Quic context. The application will post DNS requests that specify the
 * name and address of the requested server, at which point the DoQ client will
 * check whether a connection to the server is available. If it is,
 * the client opens a stream and posts the request. If it is not, the DoQ client
 * attempts to start a new connection, and posts the query to that connection.
 *
 * Once the server replies, the DoQ client reads the response, and issues a callback
 * to the application. The DoQ client will also post a negative response if the
 * connection to the server is terminated before receiving the response, or if the
 * server terminates the stream using a RESET message. The application can
 * dispose of the query context once a response has been received.
 *
 * Applications may attempt to cancel queries before the server replies. They
 * do that by posting a cancel. This will cause the DoQ client to issue a
 * stream reset message to cancel the original query, and a stop sending
 * message to ask the server to discard its response, and possibly cancel
 * transactions associated with it. The application that issued a cancellation
 * request has to wait the callback from the DoQ client before disposing
 * of the query context.
 *
 * The queries posted by the application include:
 * - the server name
 * - the IP or IPv6 address of the server
 * - a code indicating whether this is a query or a cancellation attempt
 * - the memory buffer containing a copy of the query
 * - the memory buffer that will receive the response
 * - the pointer to the callback function
 * - the callback argument.
 * - a unique identifier used by the DoQ client to manage cancellation.
 *
 * The callback arguments include a code indicating whether the query was
 * completed or not.
 *
 * The application has to start the DoQ service before launching any query.
 * It can at any point request to stop the DoQ service.
 */

/* DoQ server
 *
 * The DoQ server is expected to run in the background, handle connection
 * requests from clients, and receive queries. Once an entire query
 * has been received, the server issues a callback to the application,
 * providing the content of the query.
 *
 * The application is expected to process the query outside the server
 * thread, so as to not block the Quic processing thread. Once the
 * response is available, the application will post a response to
 * the DoQ server, which will forward it to the query's origin.
 *
 * Queries can get cancelled before the application provides the response.
 * In that case, the DoQ server will call back the application to signal
 * that the local processing can be cancelled. The application
 * acknowledges the callback by posting a response to the DoQ server,
 * but that response will indicate that the query processing was
 * cancelled.
 *
 * Server queries are associated with a query context that is maintained
 * by the server. That query context uses the same data structure as
 * for client queries described above, but with slightly different
 * meanings:
 *
 * - the server name is the SNI specified by the remote client,
 * - the IP address is that of the remote client
 * - the code indicates whether this is an incoming query or a cancellation
 * - the DoQ server allocates the memory for holding queries and
 *   responses
 * - the DoQ server creates the unique identifier of the query
 *
 * The memory will be available to the application from the moment
 * it receives the server callback to the point at which the application
 * posts the response, or to the point at which the application
 * decides to terminate the server.
 */

/* Combined DoQ client and server
 *
 * The server and client may be combined in a single service. This is
 * useful for example when implementing recursive resolvers who may
 * receive queries using DoQ server functions, and forward these
 * queries to authoritative resolvers using DoQ client functions.
 *
 * 
 */

#ifdef __cplusplus
extern "C" {
#endif

#define QUICDOQ_VERSION "1.0.0.0"

/* DoQ ALPN and DoQ port -- as defined in RFC 9250 */
#define QUICDOQ_ALPN "doq"
#define QUICDOQ_PORT 853

/* DoQ error codes */
#define QUICDOQ_ERROR_NO_ERROR 0x00
#define QUICDOQ_ERROR_INTERNAL 0x01
#define QUICDOQ_ERROR_PROTOCOL 0x02
#define QUICDOQ_ERROR_REQUEST_CANCELLED 0x03
#define QUICDOQ_ERROR_EXCESSIVE_LOAD 0x04
#define QUICDOQ_ERROR_UNSPECIFIED_ERROR 0x05
#define QUICDOQ_ERROR_RESERVED 0xd098ea5e     

#define QUICDOQ_ERROR_RESPONSE_TOO_LONG 0x202
#define QUICDOQ_ERROR_RESPONSE_TIME_OUT 0x203
#define QUICDOQ_ERROR_QUERY_TOO_LONG 0x204

/* Max stream size, per RFC */
#define QUICDOQ_MAX_STREAM_DATA 0xffff

/* Doq client return codes
 */
    typedef enum {
        quicdoq_incoming_query = 0, /* Incoming callback query */
        quicdoq_query_cancelled, /* Query cancelled before response provided */
        quicdoq_response_complete, /* The last response to the current query arrived. */
        quicdoq_response_partial, /* One of the first responses to a query has arrived */
        quicdoq_response_cancelled, /* The response to the current query was cancelled by the peer. */
        quicdoq_query_failed  /* Query failed for reasons other than cancelled. */
    } quicdoq_query_return_enum;

    /* Definition of the callback function
     */
    typedef struct st_quicdoq_query_ctx_t quicdoq_query_ctx_t;
    typedef struct st_quicdoq_cnx_ctx_t quicdoq_cnx_ctx_t;

    typedef int (*quicdoq_app_cb_fn)(
        quicdoq_query_return_enum callback_code,
        void* callback_ctx,
        quicdoq_query_ctx_t* query_ctx,
        uint64_t current_time);

    /* Definition of the query context */
    /* TODO: add a flag to indicate whether the query requires multiple responses?
     * TODO: manage sending the length of the query, and the length of each response.
     * if the query requires multiple responses, there will be chain of responses. */
    typedef struct st_quicdoq_query_ctx_t {
        char const* server_name; /* Server SNI in outgoing query, client SNI in incoming query */
        struct sockaddr* server_addr; /* Address of the target server */
        struct sockaddr* client_addr; /* Address of the client if known connection */
        picoquic_quic_t* quic; /* Quic context for logging */
        picoquic_connection_id_t cid; /* ID of the connection over which the query was sent. */
        uint64_t stream_id; /* ID of the stream on which the query is mapped. */
        uint64_t query_id; /* Unique ID of the query, assigned by the client */
        uint8_t* query; /* buffer holding the query */
        uint16_t query_max_size; /* length of the query */
        uint16_t query_length; /* length of the query */
        uint8_t* response; /* buffer holding the response */
        uint16_t response_max_size; /* size of the response buffer */
        size_t response_length; /* size of the actual response */
        quicdoq_app_cb_fn client_cb; /* Callback function for this query */
        void* client_cb_ctx; /* callback context for this query */
        quicdoq_query_return_enum return_code;
    } quicdoq_query_ctx_t;

    /* Connection context management functions.
     * The type quicdoq_ctx_t is treated here as an opaque pointer, to
     * provide isolation between the app and the stack.
     */
    typedef struct st_quicdoq_ctx_t quicdoq_ctx_t;
    quicdoq_ctx_t* quicdoq_create(char const * alpn,
        char const* cert_file_name, char const* key_file_name, char const* cert_root_file_name,
        char const* ticket_store_file_name, char const* token_store_file_name,
        quicdoq_app_cb_fn app_cb_fn, void * app_cb_ctx,
        uint64_t* simulated_time);
    void quicdoq_delete(quicdoq_ctx_t* ctx);
    void quicdoq_set_callback(quicdoq_ctx_t* ctx, quicdoq_app_cb_fn app_cb_fn, void* app_cb_ctx);
    picoquic_quic_t* quicdoq_get_quic_ctx(quicdoq_ctx_t* ctx);

    /* Query context management functions
     * TODO: if the query requires several response, there will be callbacks on the
     * client side for each response. There will also be several calls on the
     * server side for posting responses, and a flag to signal whether this is
     * the last one.
     *
     * Client side:
     *  - quicdoq_post_query(): Post a new query
     *  - quicdoq_cancel_query(): Abandon a previously posted query
     *  - The response will come in a call to (*quicdoq_app_cb_fn)()
     * Server side:
     *  - the incoming query will come in a call to (*quicdoq_app_cb_fn)()
     *  - quicdoq_post_response(): provide the response
     *  - quicdoq_cancel_response(): terminate an incoming query without a response.
     */

    quicdoq_query_ctx_t* quicdoq_create_query_ctx(uint16_t query_length, uint16_t response_max_size);

    void  quicdoq_delete_query_ctx(quicdoq_query_ctx_t* query_ctx);

    int quicdoq_post_query(quicdoq_ctx_t* quicdoq_ctx, quicdoq_query_ctx_t* query_ctx);

    int quicdoq_cancel_query(quicdoq_ctx_t* quicdoq_ctx, quicdoq_query_ctx_t* query_ctx);

    int quicdoq_post_response(quicdoq_query_ctx_t* query_ctx);

    int quicdoq_format_refuse_response(
        uint8_t* query, size_t query_length,
        uint8_t* response, size_t response_max_size, size_t* response_length,
        uint16_t extended_dns_error);

    int quicdoq_refuse_response(quicdoq_ctx_t* quicdoq_ctx, quicdoq_query_ctx_t* query_ctx, uint16_t extended_dns_error);

    int quicdoq_cancel_response(quicdoq_ctx_t* quicdoq_ctx, quicdoq_query_ctx_t* query_ctx, uint16_t error_code);

    int quicdoq_is_closed(quicdoq_ctx_t* quicdoq_ctx);

    /* Utility functions for formatting DNS messages */
    typedef struct st_quicdoq_rr_entry_t {
        char const* rr_name;
        uint16_t rr_type;
    } quicdoq_rr_entry_t;

    uint8_t* quicdog_format_dns_name(uint8_t* data, uint8_t* data_max, char const* name);
    uint8_t* quicdog_format_dns_query(uint8_t* data, uint8_t* data_max, char const* qname,
        uint16_t id, uint16_t qclass, uint16_t qtype, uint16_t l_max);
    size_t quicdoq_parse_dns_name(const uint8_t* packet, size_t length, size_t start,
        uint8_t** text_start, uint8_t* text_max);
    size_t quicdoq_skip_dns_name(const uint8_t* packet, size_t length, size_t start);
    size_t quicdoq_parse_dns_query(const uint8_t* packet, size_t length, size_t start,
        uint8_t** text_start, uint8_t* text_max);

    uint16_t quicdoq_get_rr_type(char const* rr_name);

    /* Handling of UDP callbacks */
    typedef struct st_quicdoq_udp_ctx_t quicdoq_udp_ctx_t;

    quicdoq_udp_ctx_t* quicdoq_create_udp_ctx(quicdoq_ctx_t* quicdoq_ctx, struct sockaddr* addr);
    void quicdoq_delete_udp_ctx(quicdoq_udp_ctx_t* udp_ctx);
    int quicdoq_udp_callback(quicdoq_query_return_enum callback_code, void* callback_ctx,
        quicdoq_query_ctx_t* query_ctx, uint64_t current_time);
	void* hookup();
    void quicdoq_udp_prepare_next_packet(quicdoq_udp_ctx_t* udp_ctx,
        uint64_t current_time, uint8_t* send_buffer, size_t send_buffer_max, size_t* send_length,
        struct sockaddr_storage* p_addr_to, struct sockaddr_storage* p_addr_from, int* if_index);
    void quicdoq_udp_incoming_packet(quicdoq_udp_ctx_t* udp_ctx, uint8_t* bytes, size_t length, 
        struct sockaddr* addr_to, int if_index_to, uint64_t current_time);
    uint64_t quicdoq_next_udp_time(quicdoq_udp_ctx_t* udp_ctx);

#ifdef __cplusplus
}
#endif

#endif /* quicdoq_H */
