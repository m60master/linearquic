# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/jungyoon/.miniconda3/bin/cmake

# The command to remove a file.
RM = /home/jungyoon/.miniconda3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jungyoon/workspace/quic/quicdoq

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jungyoon/quicdog

# Include any dependencies generated for this target.
include CMakeFiles/quicdoq-core.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/quicdoq-core.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/quicdoq-core.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/quicdoq-core.dir/flags.make

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o: CMakeFiles/quicdoq-core.dir/flags.make
CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o: quicdoq/quicdoq.c
CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o: CMakeFiles/quicdoq-core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o -MF CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o.d -o CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o -c /home/jungyoon/quicdog/quicdoq/quicdoq.c

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jungyoon/quicdog/quicdoq/quicdoq.c > CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.i

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jungyoon/quicdog/quicdoq/quicdoq.c -o CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.s

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o: CMakeFiles/quicdoq-core.dir/flags.make
CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o: quicdoq/quicdoq_util.c
CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o: CMakeFiles/quicdoq-core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o -MF CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o.d -o CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o -c /home/jungyoon/quicdog/quicdoq/quicdoq_util.c

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jungyoon/quicdog/quicdoq/quicdoq_util.c > CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.i

CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jungyoon/quicdog/quicdoq/quicdoq_util.c -o CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.s

CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o: CMakeFiles/quicdoq-core.dir/flags.make
CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o: quicdoq/udp_relay.c
CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o: CMakeFiles/quicdoq-core.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o -MF CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o.d -o CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o -c /home/jungyoon/quicdog/quicdoq/udp_relay.c

CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jungyoon/quicdog/quicdoq/udp_relay.c > CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.i

CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jungyoon/quicdog/quicdoq/udp_relay.c -o CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.s

# Object files for target quicdoq-core
quicdoq__core_OBJECTS = \
"CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o" \
"CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o" \
"CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o"

# External object files for target quicdoq-core
quicdoq__core_EXTERNAL_OBJECTS =

libquicdoq-core.a: CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq.c.o
libquicdoq-core.a: CMakeFiles/quicdoq-core.dir/quicdoq/quicdoq_util.c.o
libquicdoq-core.a: CMakeFiles/quicdoq-core.dir/quicdoq/udp_relay.c.o
libquicdoq-core.a: CMakeFiles/quicdoq-core.dir/build.make
libquicdoq-core.a: CMakeFiles/quicdoq-core.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C static library libquicdoq-core.a"
	$(CMAKE_COMMAND) -P CMakeFiles/quicdoq-core.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/quicdoq-core.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/quicdoq-core.dir/build: libquicdoq-core.a
.PHONY : CMakeFiles/quicdoq-core.dir/build

CMakeFiles/quicdoq-core.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/quicdoq-core.dir/cmake_clean.cmake
.PHONY : CMakeFiles/quicdoq-core.dir/clean

CMakeFiles/quicdoq-core.dir/depend:
	cd /home/jungyoon/quicdog && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jungyoon/workspace/quic/quicdoq /home/jungyoon/quicdog /home/jungyoon/quicdog /home/jungyoon/quicdog /home/jungyoon/quicdog/CMakeFiles/quicdoq-core.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/quicdoq-core.dir/depend
