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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.22.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/edant/glinceutils/config

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/edant/glinceutils/config

# Include any dependencies generated for this target.
include CMakeFiles/glinceutils.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/glinceutils.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/glinceutils.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/glinceutils.dir/flags.make

CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o: CMakeFiles/glinceutils.dir/flags.make
CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o: /Users/edant/glinceutils/src/main.cpp
CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o: CMakeFiles/glinceutils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/edant/glinceutils/config/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o -MF CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o.d -o CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o -c /Users/edant/glinceutils/src/main.cpp

CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/edant/glinceutils/src/main.cpp > CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.i

CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/edant/glinceutils/src/main.cpp -o CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.s

# Object files for target glinceutils
glinceutils_OBJECTS = \
"CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o"

# External object files for target glinceutils
glinceutils_EXTERNAL_OBJECTS =

/Users/edant/glinceutils/build/glinceutils: CMakeFiles/glinceutils.dir/Users/edant/glinceutils/src/main.cpp.o
/Users/edant/glinceutils/build/glinceutils: CMakeFiles/glinceutils.dir/build.make
/Users/edant/glinceutils/build/glinceutils: CMakeFiles/glinceutils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/edant/glinceutils/config/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /Users/edant/glinceutils/build/glinceutils"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glinceutils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/glinceutils.dir/build: /Users/edant/glinceutils/build/glinceutils
.PHONY : CMakeFiles/glinceutils.dir/build

CMakeFiles/glinceutils.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/glinceutils.dir/cmake_clean.cmake
.PHONY : CMakeFiles/glinceutils.dir/clean

CMakeFiles/glinceutils.dir/depend:
	cd /Users/edant/glinceutils/config && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/edant/glinceutils/config /Users/edant/glinceutils/config /Users/edant/glinceutils/config /Users/edant/glinceutils/config /Users/edant/glinceutils/config/CMakeFiles/glinceutils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/glinceutils.dir/depend

