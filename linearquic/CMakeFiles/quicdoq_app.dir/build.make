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
include CMakeFiles/quicdoq_app.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/quicdoq_app.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/quicdoq_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/quicdoq_app.dir/flags.make

CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o: CMakeFiles/quicdoq_app.dir/flags.make
CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o: quicdoq_cli_app/quicdoq_app.c
CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o: CMakeFiles/quicdoq_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o -MF CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o.d -o CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o -c /home/jungyoon/quicdog/quicdoq_cli_app/quicdoq_app.c

CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jungyoon/quicdog/quicdoq_cli_app/quicdoq_app.c > CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.i

CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jungyoon/quicdog/quicdoq_cli_app/quicdoq_app.c -o CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.s

# Object files for target quicdoq_app
quicdoq_app_OBJECTS = \
"CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o"

# External object files for target quicdoq_app
quicdoq_app_EXTERNAL_OBJECTS =

quicdoq_app: CMakeFiles/quicdoq_app.dir/quicdoq_cli_app/quicdoq_app.c.o
quicdoq_app: CMakeFiles/quicdoq_app.dir/build.make
quicdoq_app: libquicdoq-core.a
quicdoq_app: /home/jungyoon/workspace/quic/picoquic/libpicoquic-core.a
quicdoq_app: /home/jungyoon/workspace/quic/picoquic/libpicoquic-log.a
quicdoq_app: /home/jungyoon/workspace/quic/picotls/libpicotls-core.a
quicdoq_app: /home/jungyoon/workspace/quic/picotls/libpicotls-minicrypto.a
quicdoq_app: /home/jungyoon/workspace/quic/picotls/libpicotls-openssl.a
quicdoq_app: /home/jungyoon/workspace/quic/picotls/libpicotls-fusion.a
quicdoq_app: /home/jungyoon/.miniconda3/lib/libssl.so
quicdoq_app: /home/jungyoon/.miniconda3/lib/libcrypto.so
quicdoq_app: CMakeFiles/quicdoq_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jungyoon/quicdog/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable quicdoq_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/quicdoq_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/quicdoq_app.dir/build: quicdoq_app
.PHONY : CMakeFiles/quicdoq_app.dir/build

CMakeFiles/quicdoq_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/quicdoq_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/quicdoq_app.dir/clean

CMakeFiles/quicdoq_app.dir/depend:
	cd /home/jungyoon/quicdog && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jungyoon/workspace/quic/quicdoq /home/jungyoon/quicdog /home/jungyoon/quicdog /home/jungyoon/quicdog /home/jungyoon/quicdog/CMakeFiles/quicdoq_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/quicdoq_app.dir/depend

