# linearquic

Linearquic is a simple implementation that removes recursive resolver, and queries the DNS linearly.

# Install

## Install Requirements

git submodule init && git submodule update

cd picotls

git submodule init && git submodule update

cmake . && make

cd ../picoquic

cmake . && make

cd ../quicdog

cmake . && make

cd ../linearquic

cmake . && make

