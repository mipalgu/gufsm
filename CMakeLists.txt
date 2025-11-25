cmake_minimum_required(VERSION 3.21)

project(gufsm CXX C)

# Require the C++ standard to be C++17,
# but allow extensions.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

# Require C99
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Set the default build type to Debug.
if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

# Define FSM_SUPPORT_SUSPEND for suspensible machines
add_definitions(-DFSM_SUPPORT_SUSPEND)

# Check for whiteboard and conditionally enable it
find_package(gusimplewhiteboard QUIET)
if(gusimplewhiteboard_FOUND)
    add_compile_definitions(WITH_WHITEBOARD)
    message(STATUS "Building with whiteboard support")
else()
    message(STATUS "Building without whiteboard support")
endif()

# Include project configuration
include(project.cmake)

# Build subprojects
if(BUILD_LIBCLFSM)
    add_subdirectory(libclfsm)
endif()

if(BUILD_CLFSM)
    add_subdirectory(clfsm)
endif()
