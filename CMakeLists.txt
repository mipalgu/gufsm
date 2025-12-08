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

# libdispatch support option
option(WITH_LIBDISPATCH "Enable libdispatch support for time-triggered operations and parallel processing" ON)

# Check for libdispatch if enabled
if(WITH_LIBDISPATCH)
    # Try to find libdispatch
    find_path(LIBDISPATCH_INCLUDE_DIR dispatch/dispatch.h)
    if(APPLE)
        # On macOS, libdispatch is part of the system
        set(LIBDISPATCH_LIBRARIES "")
        set(LIBDISPATCH_FOUND TRUE)
    else()
        # On other platforms, try to find the library
        find_library(LIBDISPATCH_LIBRARIES dispatch)
        if(LIBDISPATCH_LIBRARIES AND LIBDISPATCH_INCLUDE_DIR)
            set(LIBDISPATCH_FOUND TRUE)
        else()
            set(LIBDISPATCH_FOUND FALSE)
        endif()
    endif()

    if(LIBDISPATCH_FOUND)
        message(STATUS "Building with libdispatch support")
        # Check for blocks support
        include(CheckCCompilerFlag)
        check_c_compiler_flag("-fblocks" COMPILER_SUPPORTS_BLOCKS)
        if(COMPILER_SUPPORTS_BLOCKS)
            add_compile_options(-fblocks)
            add_compile_definitions(__BLOCKS__)
            message(STATUS "Enabling blocks support for libdispatch")
        endif()
    else()
        set(WITH_LIBDISPATCH OFF)
        add_compile_definitions(WITHOUT_LIBDISPATCH)
        message(STATUS "libdispatch not found, building without libdispatch support")
    endif()
else()
    add_compile_definitions(WITHOUT_LIBDISPATCH)
    message(STATUS "Building without libdispatch support (disabled by option)")
endif()

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

# Enable machine compilation support if requested
if(COMPILE_MACHINES)
    add_compile_definitions(COMPILE_MACHINES)
    message(STATUS "Building with machine compilation support")
else()
    message(STATUS "Building without machine compilation support")
endif()

# Enable testing if requested
if(BUILD_TESTS)
    enable_testing()
endif()

# Build subprojects
if(BUILD_LIBCLFSM)
    add_subdirectory(libclfsm)
endif()

if(BUILD_CLFSM)
    add_subdirectory(clfsm)
endif()

# Export target - creates a self-contained snapshot
string(TIMESTAMP EXPORT_TIMESTAMP "%Y-%m-%d %H:%M:%S")
add_custom_target(export
    COMMAND ${CMAKE_COMMAND}
        -DEXPORT_DIR=${CMAKE_BINARY_DIR}/export
        -DEXPORT_TIMESTAMP="${EXPORT_TIMESTAMP}"
        -DEXPORT_TESTS=${BUILD_TESTS}
        -DEXPORT_COMPILE_MACHINES=${COMPILE_MACHINES}
        -DEXPORT_WITH_WHITEBOARD=${gusimplewhiteboard_FOUND}
        -DEXPORT_WITH_REFLECTION=${LIBCLFSM_WITH_REFLECT}
        -DEXPORT_DEVEL=${EXPORT_DEVEL}
        -DEXPORT_EXPORTING=${EXPORT_EXPORTING}
        -P ${CMAKE_SOURCE_DIR}/export.cmake
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    COMMENT "Creating self-contained gufsm export"
    VERBATIM
)
