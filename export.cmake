# Export script to create a self-contained gufsm snapshot
# This resolves all external dependencies (Common/gu_util) into the export

if(NOT EXPORT_DIR)
    set(EXPORT_DIR "${CMAKE_BINARY_DIR}/export")
endif()

message(STATUS "Exporting self-contained gufsm to: ${EXPORT_DIR}")

# Clean and create export directory
file(REMOVE_RECURSE "${EXPORT_DIR}")
file(MAKE_DIRECTORY "${EXPORT_DIR}")
file(MAKE_DIRECTORY "${EXPORT_DIR}/Common")

# List of required directories to copy
set(REQUIRED_DIRS
    "clfsm"
    "libclfsm"
    "gufsm"
)

# Function to copy a directory tree with filters
function(copy_directory SOURCE DEST)
    file(GLOB_RECURSE ALL_FILES
        RELATIVE "${SOURCE}"
        "${SOURCE}/*"
    )

    foreach(FILE ${ALL_FILES})
        # Skip certain directories and files
        if(FILE MATCHES "^\\." OR                          # Hidden files/dirs
           FILE MATCHES "build/" OR                         # Build directories
           FILE MATCHES "\\.xcodeproj/" OR                 # Xcode projects
           FILE MATCHES "catkin_ws/" OR                    # Catkin workspace
           FILE MATCHES "examples/" OR                     # Examples
           FILE MATCHES "test/" OR                         # Tests
           FILE MATCHES "test-suspend/" OR                 # Test directories
           FILE MATCHES "\\.git/" OR                       # Git directories
           FILE MATCHES "\\.o$" OR                         # Object files
           FILE MATCHES "\\.a$" OR                         # Archives
           FILE MATCHES "\\.dylib$" OR                     # Dynamic libraries
           FILE MATCHES "\\.so$")                          # Shared objects
            continue()
        endif()

        # Get source and destination paths
        set(SRC "${SOURCE}/${FILE}")
        set(DST "${DEST}/${FILE}")

        # Create destination directory if needed
        get_filename_component(DST_DIR "${DST}" DIRECTORY)
        file(MAKE_DIRECTORY "${DST_DIR}")

        # Copy file (skip symlinks - they'll be handled separately or excluded)
        if(NOT IS_DIRECTORY "${SRC}" AND NOT IS_SYMLINK "${SRC}")
            execute_process(
                COMMAND ${CMAKE_COMMAND} -E copy "${SRC}" "${DST}"
                RESULT_VARIABLE RESULT
            )
            if(NOT RESULT EQUAL 0)
                message(WARNING "Failed to copy ${FILE}")
            endif()
        endif()
    endforeach()
endfunction()

# Copy required directories to top level of export
message(STATUS "  Copying required directories...")
foreach(DIR ${REQUIRED_DIRS})
    if(EXISTS "${CMAKE_SOURCE_DIR}/${DIR}")
        message(STATUS "    - ${DIR}/")
        copy_directory("${CMAKE_SOURCE_DIR}/${DIR}" "${EXPORT_DIR}/${DIR}")
    endif()
endforeach()

# Copy top-level files
message(STATUS "  Copying top-level files...")
set(TOP_LEVEL_FILES
    "CMakeLists.txt"
    "project.cmake"
    "export.cmake"
    "LICENSE"
    "README.md"
    "Makefile"
)

foreach(FILE ${TOP_LEVEL_FILES})
    if(EXISTS "${CMAKE_SOURCE_DIR}/${FILE}")
        file(COPY "${CMAKE_SOURCE_DIR}/${FILE}" DESTINATION "${EXPORT_DIR}")
    endif()
endforeach()

# Resolve and copy gu_util files from the actual source
# The path is: Submodules/gufsm -> ../gu_util (symlink) -> ../../gu_util (actual)
set(GU_UTIL_SOURCE_DIR "${CMAKE_SOURCE_DIR}/../gu_util")

# Resolve the real path in case it's a symlink
get_filename_component(GU_UTIL_REAL_DIR "${GU_UTIL_SOURCE_DIR}" REALPATH)

if(EXISTS "${GU_UTIL_REAL_DIR}/gu_util.cpp" AND
   EXISTS "${GU_UTIL_REAL_DIR}/gu_util.h")
    message(STATUS "  Copying gu_util files from: ${GU_UTIL_REAL_DIR}")
    file(COPY
        "${GU_UTIL_REAL_DIR}/gu_util.cpp"
        "${GU_UTIL_REAL_DIR}/gu_util.h"
        DESTINATION "${EXPORT_DIR}/Common/"
    )
else()
    message(FATAL_ERROR "Could not find gu_util source files at ${GU_UTIL_REAL_DIR}")
endif()

# Update project.cmake to use ./Common instead of ../../Common
file(READ "${EXPORT_DIR}/libclfsm/project.cmake" PROJECT_CMAKE_CONTENT)
string(REPLACE "../../Common/gu_util.cpp" "../Common/gu_util.cpp" PROJECT_CMAKE_CONTENT "${PROJECT_CMAKE_CONTENT}")
file(WRITE "${EXPORT_DIR}/libclfsm/project.cmake" "${PROJECT_CMAKE_CONTENT}")

# Update CMakeLists.txt to use ../Common instead of ../../Common
file(READ "${EXPORT_DIR}/libclfsm/CMakeLists.txt" CMAKE_LISTS_CONTENT)
string(REPLACE "../../Common" "../Common" CMAKE_LISTS_CONTENT "${CMAKE_LISTS_CONTENT}")
file(WRITE "${EXPORT_DIR}/libclfsm/CMakeLists.txt" "${CMAKE_LISTS_CONTENT}")

# Create a README for the export
file(WRITE "${EXPORT_DIR}/README_EXPORT.md" "# Self-Contained gufsm Export

This directory contains a self-contained snapshot of the gufsm (Griffith University Finite State Machine) library and compiler.

## What's Included

- **clfsm/** - FSM compiler source
- **libclfsm/** - FSM runtime library source
- **gufsm/** - Core FSM engine source
- **Common/** - Required utility files (gu_util.cpp, gu_util.h)
- Build system files (CMakeLists.txt, project.cmake)

All external dependencies have been resolved and copied into this export.

## Building

\`\`\`bash
mkdir build && cd build
cmake -G Ninja ..
ninja
\`\`\`

## Installation

\`\`\`bash
ninja install
\`\`\`

This installs:
- libclfsm.a and libclfsm.dylib/so → lib/
- clfsm executable → bin/
- Headers → include/gufsm/
- CMake package config → lib/cmake/clfsm/

## Export Information

Exported from: ${CMAKE_SOURCE_DIR}
Export date: ${EXPORT_TIMESTAMP}
CMake version: ${CMAKE_VERSION}
")

message(STATUS "Export complete!")
message(STATUS "")
message(STATUS "Self-contained gufsm exported to: ${EXPORT_DIR}")
message(STATUS "")
message(STATUS "To build the exported version:")
message(STATUS "  cd ${EXPORT_DIR}")
message(STATUS "  mkdir build && cd build")
message(STATUS "  cmake -G Ninja ..")
message(STATUS "  ninja")
