# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kali/Desktop/_LHPSC_Map-generator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kali/Desktop/_LHPSC_Map-generator/build

# Include any dependencies generated for this target.
include CMakeFiles/module_name.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/module_name.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/module_name.dir/flags.make

CMakeFiles/module_name.dir/map.cpp.o: CMakeFiles/module_name.dir/flags.make
CMakeFiles/module_name.dir/map.cpp.o: ../map.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kali/Desktop/_LHPSC_Map-generator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/module_name.dir/map.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/module_name.dir/map.cpp.o -c /home/kali/Desktop/_LHPSC_Map-generator/map.cpp

CMakeFiles/module_name.dir/map.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/module_name.dir/map.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kali/Desktop/_LHPSC_Map-generator/map.cpp > CMakeFiles/module_name.dir/map.cpp.i

CMakeFiles/module_name.dir/map.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/module_name.dir/map.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kali/Desktop/_LHPSC_Map-generator/map.cpp -o CMakeFiles/module_name.dir/map.cpp.s

# Object files for target module_name
module_name_OBJECTS = \
"CMakeFiles/module_name.dir/map.cpp.o"

# External object files for target module_name
module_name_EXTERNAL_OBJECTS =

module_name.cpython-39-x86_64-linux-gnu.so: CMakeFiles/module_name.dir/map.cpp.o
module_name.cpython-39-x86_64-linux-gnu.so: CMakeFiles/module_name.dir/build.make
module_name.cpython-39-x86_64-linux-gnu.so: CMakeFiles/module_name.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kali/Desktop/_LHPSC_Map-generator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module module_name.cpython-39-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/module_name.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/strip /home/kali/Desktop/_LHPSC_Map-generator/build/module_name.cpython-39-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/module_name.dir/build: module_name.cpython-39-x86_64-linux-gnu.so

.PHONY : CMakeFiles/module_name.dir/build

CMakeFiles/module_name.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/module_name.dir/cmake_clean.cmake
.PHONY : CMakeFiles/module_name.dir/clean

CMakeFiles/module_name.dir/depend:
	cd /home/kali/Desktop/_LHPSC_Map-generator/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kali/Desktop/_LHPSC_Map-generator /home/kali/Desktop/_LHPSC_Map-generator /home/kali/Desktop/_LHPSC_Map-generator/build /home/kali/Desktop/_LHPSC_Map-generator/build /home/kali/Desktop/_LHPSC_Map-generator/build/CMakeFiles/module_name.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/module_name.dir/depend

