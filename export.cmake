# Export script to create a minimal self-contained gufsm snapshot
# Only includes files needed to build libclfsm and clfsm

if(NOT EXPORT_DIR)
    set(EXPORT_DIR "${CMAKE_BINARY_DIR}/export")
endif()

message(STATUS "Creating minimal self-contained gufsm export to: ${EXPORT_DIR}")

# Clean and create export directory
file(REMOVE_RECURSE "${EXPORT_DIR}")
file(MAKE_DIRECTORY "${EXPORT_DIR}")
file(MAKE_DIRECTORY "${EXPORT_DIR}/libclfsm")
file(MAKE_DIRECTORY "${EXPORT_DIR}/clfsm")

# Helper function to copy a file and report errors
# Resolves symlinks to ensure no symlinks in export
function(copy_file_safe SRC DST)
    if(EXISTS "${SRC}")
        # Resolve symlinks to get the real file
        get_filename_component(REAL_SRC "${SRC}" REALPATH)
        get_filename_component(DST_DIR "${DST}" DIRECTORY)
        file(MAKE_DIRECTORY "${DST_DIR}")
        # Use configure_file to copy the actual file content (not symlink)
        configure_file("${REAL_SRC}" "${DST}" COPYONLY)
    else()
        message(WARNING "Source file not found: ${SRC}")
    endif()
endfunction()

# ==============================================================================
# LIBCLFSM FILES
# ==============================================================================
message(STATUS "  Collecting libclfsm files...")

# libclfsm source files from ../gufsm/
set(LIBCLFSM_GUFSM_SOURCES
    stringConstants.c
    FSMAction.cc
    FSMActivity.cc
    FSMExpression.cc
    FSMFactory.cc
    FSMState.cc
    FSMSuspensibleMachine.cc
    FSMTransition.cc
    FSMAsynchronousSuspensibleMachine.cc
    FSMachine.cc
    FSMachineVector.cc
)

foreach(FILE ${LIBCLFSM_GUFSM_SOURCES})
    copy_file_safe("${CMAKE_SOURCE_DIR}/gufsm/${FILE}" "${EXPORT_DIR}/libclfsm/${FILE}")
endforeach()

# libclfsm source files from ../clfsm/
set(LIBCLFSM_CLFSM_SOURCES
    CLActionAction.cc
    CLTransitionExpression.cc
    clfsm_factory.cc
    clfsm_vector_factory.cc
)

foreach(FILE ${LIBCLFSM_CLFSM_SOURCES})
    copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/${FILE}" "${EXPORT_DIR}/libclfsm/${FILE}")
endforeach()

# libclfsm headers from clfsm/ (resolve symlinks - these originate in clfsm but are used by libclfsm)
set(LIBCLFSM_FROM_CLFSM_HEADERS
    CLAction.h
    CLActionAction.h
    CLMachine.h
    CLMacros.h
    CLState.h
    CLTransition.h
    CLTransitionExpression.h
    clfsm_factory.h
    clfsm_vector_factory.h
    clfsm_wb_vector_factory.h
)

foreach(FILE ${LIBCLFSM_FROM_CLFSM_HEADERS})
    copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/${FILE}" "${EXPORT_DIR}/libclfsm/${FILE}")
endforeach()

# libclfsm headers from gufsm/
set(LIBCLFSM_FROM_GUFSM_HEADERS
    FSMachine.h
    FSMachineVector.h
    FSMAction.h
    FSMActivity.h
    FSMAsynchronousSuspensibleMachine.h
    FSMExpression.h
    FSMFactory.h
    FSMState.h
    FSMSuspensibleMachine.h
    FSMTransition.h
    stringConstants.h
)

foreach(FILE ${LIBCLFSM_FROM_GUFSM_HEADERS})
    copy_file_safe("${CMAKE_SOURCE_DIR}/gufsm/${FILE}" "${EXPORT_DIR}/libclfsm/${FILE}")
endforeach()

# libclfsm source files that come from clfsm (resolve symlinks)
copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/clfsm_wb_vector_factory.cc" "${EXPORT_DIR}/libclfsm/clfsm_wb_vector_factory.cc")

# Copy gu_util files
set(GU_UTIL_SOURCE_DIR "${CMAKE_SOURCE_DIR}/../gu_util")
get_filename_component(GU_UTIL_REAL_DIR "${GU_UTIL_SOURCE_DIR}" REALPATH)

if(EXISTS "${GU_UTIL_REAL_DIR}/gu_util.cpp" AND EXISTS "${GU_UTIL_REAL_DIR}/gu_util.h")
    copy_file_safe("${GU_UTIL_REAL_DIR}/gu_util.cpp" "${EXPORT_DIR}/libclfsm/gu_util.cpp")
    copy_file_safe("${GU_UTIL_REAL_DIR}/gu_util.h" "${EXPORT_DIR}/libclfsm/gu_util.h")
else()
    message(FATAL_ERROR "Could not find gu_util source files")
endif()

# Copy libclfsm CMake files
copy_file_safe("${CMAKE_SOURCE_DIR}/libclfsm/clfsmConfig.cmake.in" "${EXPORT_DIR}/libclfsm/clfsmConfig.cmake.in")

# ==============================================================================
# CLFSM FILES
# ==============================================================================
message(STATUS "  Collecting clfsm files...")

# clfsm source files
set(CLFSM_SOURCES
    clfsm_main.cc
    clfsm_machine.cc
    clfsm_cc.cc
    clfsm_machine_loader.cc
    clfsm_visitors.cc
    clfsm_visitorsupport.cc
    FileParser.cc
    Schedule.cc
    TTCLFSMVectorFactory.cc
)

foreach(FILE ${CLFSM_SOURCES})
    copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/${FILE}" "${EXPORT_DIR}/clfsm/${FILE}")
endforeach()

# clfsm header files (only those clfsm actually needs - per project.cmake + additional sources)
# Note: clfsm_vector_factory.h and clfsm_wb_vector_factory.h are NOT needed by clfsm itself,
# only by libclfsm, so they're excluded here and only exist in libclfsm/
set(CLFSM_HEADERS_LIST
    clfsm_cc.h
    clfsm_cc_delegate.h
    clfsm_machine.h
    clfsm_machine_loader.h
    clfsm_visitors.h
    clfsm_visitorsupport.h
    FileParser.h
    Schedule.h
    TTCLFSMVectorFactory.h
)

foreach(FILE ${CLFSM_HEADERS_LIST})
    copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/${FILE}" "${EXPORT_DIR}/clfsm/${FILE}")
endforeach()

# Copy clfsm man page if it exists
copy_file_safe("${CMAKE_SOURCE_DIR}/clfsm/clfsm.1" "${EXPORT_DIR}/clfsm/clfsm.1")

# ==============================================================================
# CREATE NEW PROJECT.CMAKE FILES FOR EXPORT
# ==============================================================================
message(STATUS "  Creating export CMake files...")

# libclfsm/project.cmake for export
file(WRITE "${EXPORT_DIR}/libclfsm/project.cmake" "# Sources for the libclfsm library.

set(LIBCLFSM_SOURCES
    \${CMAKE_CURRENT_SOURCE_DIR}/stringConstants.c
    \${CMAKE_CURRENT_SOURCE_DIR}/CLActionAction.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/CLTransitionExpression.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMAction.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMActivity.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMExpression.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMFactory.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMState.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMSuspensibleMachine.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMTransition.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMAsynchronousSuspensibleMachine.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMachine.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/FSMachineVector.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/clfsm_factory.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/clfsm_vector_factory.cc
    \${CMAKE_CURRENT_SOURCE_DIR}/gu_util.cpp
)

# Headers to install
set(LIBCLFSM_HEADERS
    CLAction.h
    CLActionAction.h
    CLMachine.h
    CLMacros.h
    CLState.h
    CLTransition.h
    CLTransitionExpression.h
    FSMachine.h
    FSMachineVector.h
    FSMAction.h
    FSMActivity.h
    FSMAsynchronousSuspensibleMachine.h
    FSMExpression.h
    FSMFactory.h
    FSMState.h
    FSMSuspensibleMachine.h
    FSMTransition.h
    clfsm_factory.h
    clfsm_vector_factory.h
    stringConstants.h
)
")

# clfsm/project.cmake for export
file(WRITE "${EXPORT_DIR}/clfsm/project.cmake" "# Sources for the clfsm compiler executable.

set(CLFSM_SOURCES
    clfsm_main.cc
    clfsm_machine.cc
    clfsm_cc.cc
    clfsm_machine_loader.cc
)

# Headers for the clfsm compiler (only clfsm-specific ones)
# Note: Shared headers (clfsm_vector_factory.h, etc.) are in libclfsm/
set(CLFSM_HEADERS
    clfsm_visitors.h
    clfsm_visitorsupport.h
    FileParser.h
)

# Additional sources needed for standalone build
set(CLFSM_ADDITIONAL_SOURCES
    clfsm_visitors.cc
    clfsm_visitorsupport.cc
    FileParser.cc
    Schedule.cc
    TTCLFSMVectorFactory.cc
)
")

# Create updated libclfsm/CMakeLists.txt
file(WRITE "${EXPORT_DIR}/libclfsm/CMakeLists.txt" "cmake_minimum_required(VERSION 3.21)

project(libclfsm C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

add_definitions(-DFSM_SUPPORT_SUSPEND)

# Inherit compile definitions from parent scope if building as subdirectory
get_directory_property(PARENT_COMPILE_DEFINITIONS PARENT_DIRECTORY COMPILE_DEFINITIONS)
foreach(DEF \${PARENT_COMPILE_DEFINITIONS})
    if(DEF MATCHES \"^(WITHOUT_LIBDISPATCH|COMPILE_MACHINES|__BLOCKS__)$\")
        add_compile_definitions(\${DEF})
    endif()
endforeach()

include(project.cmake)

# Build both static and shared libraries
add_library(libclfsm_static STATIC \${LIBCLFSM_SOURCES})
add_library(libclfsm SHARED \${LIBCLFSM_SOURCES})

set_target_properties(libclfsm_static PROPERTIES OUTPUT_NAME clfsm)
set_target_properties(libclfsm PROPERTIES OUTPUT_NAME clfsm)

add_library(libclfsm_default ALIAS libclfsm)

# Include directories
foreach(target libclfsm_static libclfsm)
  target_include_directories(\${target} PUBLIC
    \$<BUILD_INTERFACE:\${CMAKE_CURRENT_SOURCE_DIR}>
    \$<INSTALL_INTERFACE:include/gufsm>
  )
endforeach()

# Installation rules
install(TARGETS libclfsm_static libclfsm
    EXPORT clfsmTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include/gufsm
)

install(FILES \${LIBCLFSM_HEADERS}
    DESTINATION include/gufsm
)

# Export targets
install(EXPORT clfsmTargets
    FILE clfsmTargets.cmake
    NAMESPACE clfsm::
    DESTINATION lib/cmake/clfsm
)

# Create package config file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    \"\${CMAKE_CURRENT_BINARY_DIR}/clfsmConfigVersion.cmake\"
    VERSION 1.0.0
    COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(
    \"\${CMAKE_CURRENT_SOURCE_DIR}/clfsmConfig.cmake.in\"
    \"\${CMAKE_CURRENT_BINARY_DIR}/clfsmConfig.cmake\"
    INSTALL_DESTINATION lib/cmake/clfsm
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

install(FILES
    \"\${CMAKE_CURRENT_BINARY_DIR}/clfsmConfig.cmake\"
    \"\${CMAKE_CURRENT_BINARY_DIR}/clfsmConfigVersion.cmake\"
    DESTINATION lib/cmake/clfsm
)

# Add tests subdirectory if BUILD_TESTS is enabled
if(BUILD_TESTS)
    add_subdirectory(libclfsmTests)
endif()
")

# Create updated clfsm/CMakeLists.txt
file(WRITE "${EXPORT_DIR}/clfsm/CMakeLists.txt" "cmake_minimum_required(VERSION 3.21)

project(clfsm CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

add_definitions(-DFSM_SUPPORT_SUSPEND)

# Inherit compile definitions from parent scope if building as subdirectory
get_directory_property(PARENT_COMPILE_DEFINITIONS PARENT_DIRECTORY COMPILE_DEFINITIONS)
foreach(DEF \${PARENT_COMPILE_DEFINITIONS})
    if(DEF MATCHES \"^(WITHOUT_LIBDISPATCH|COMPILE_MACHINES|__BLOCKS__)$\")
        add_compile_definitions(\${DEF})
    endif()
endforeach()

include(project.cmake)

# Try to find libclfsm
if(NOT TARGET libclfsm)
    find_package(clfsm QUIET)
    if(NOT clfsm_FOUND)
        if(EXISTS \"\${CMAKE_CURRENT_SOURCE_DIR}/../libclfsm/CMakeLists.txt\")
            message(STATUS \"Building libclfsm from source\")
            add_subdirectory(../libclfsm \${CMAKE_CURRENT_BINARY_DIR}/libclfsm)
        else()
            message(FATAL_ERROR \"libclfsm not found\")
        endif()
    endif()
endif()

# Build the clfsm compiler executable
add_executable(clfsm
    \${CLFSM_SOURCES}
    \${CLFSM_ADDITIONAL_SOURCES}
)

# Include directories
target_include_directories(clfsm PRIVATE
  \${CMAKE_CURRENT_SOURCE_DIR}
  \${CMAKE_CURRENT_SOURCE_DIR}/../libclfsm
)

# Link with libclfsm (shared library by default)
if(TARGET libclfsm)
    target_link_libraries(clfsm PRIVATE libclfsm)
elseif(TARGET libclfsm_static)
    target_link_libraries(clfsm PRIVATE libclfsm_static)
else()
    target_link_libraries(clfsm PRIVATE clfsm::clfsm)
endif()

# Link with dl library
target_link_libraries(clfsm PRIVATE \${CMAKE_DL_LIBS})

# Set RPATH for installed executable
set_target_properties(clfsm PROPERTIES
    INSTALL_RPATH \"\${CMAKE_INSTALL_PREFIX}/lib\"
    BUILD_WITH_INSTALL_RPATH FALSE
    INSTALL_RPATH_USE_LINK_PATH TRUE
)

# Installation rules
install(TARGETS clfsm RUNTIME DESTINATION bin)

if(EXISTS \"\${CMAKE_CURRENT_SOURCE_DIR}/clfsm.1\")
    install(FILES clfsm.1 DESTINATION share/man/man1)
endif()
")

# Create top-level CMakeLists.txt
file(WRITE "${EXPORT_DIR}/CMakeLists.txt" "cmake_minimum_required(VERSION 3.21)

project(gufsm CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

add_definitions(-DFSM_SUPPORT_SUSPEND)

# libdispatch support option
option(WITH_LIBDISPATCH \"Enable libdispatch support for time-triggered operations and parallel processing\" ON)

# Check for libdispatch if enabled
if(WITH_LIBDISPATCH)
    # Try to find libdispatch
    find_path(LIBDISPATCH_INCLUDE_DIR dispatch/dispatch.h)
    if(APPLE)
        # On macOS, libdispatch is part of the system
        set(LIBDISPATCH_LIBRARIES \"\")
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
        message(STATUS \"Building with libdispatch support\")
        # Check for blocks support
        include(CheckCCompilerFlag)
        check_c_compiler_flag(\"-fblocks\" COMPILER_SUPPORTS_BLOCKS)
        if(COMPILER_SUPPORTS_BLOCKS)
            add_compile_options(-fblocks)
            add_compile_definitions(__BLOCKS__)
            message(STATUS \"Enabling blocks support for libdispatch\")
        endif()
    else()
        set(WITH_LIBDISPATCH OFF)
        add_compile_definitions(WITHOUT_LIBDISPATCH)
        message(STATUS \"libdispatch not found, building without libdispatch support\")
    endif()
else()
    add_compile_definitions(WITHOUT_LIBDISPATCH)
    message(STATUS \"Building without libdispatch support (disabled by option)\")
endif()

# Enable machine compilation support
option(COMPILE_MACHINES \"Enable machine compilation support\" ON)
if(COMPILE_MACHINES)
    add_compile_definitions(COMPILE_MACHINES)
    message(STATUS \"Building with machine compilation support\")
else()
    message(STATUS \"Building without machine compilation support\")
endif()

# Check for whiteboard and conditionally enable it
find_package(gusimplewhiteboard QUIET)
if(gusimplewhiteboard_FOUND)
    add_compile_definitions(WITH_WHITEBOARD)
    message(STATUS \"Building with whiteboard support\")
else()
    message(STATUS \"Building without whiteboard support\")
endif()

# Enable testing if requested
if(BUILD_TESTS)
    enable_testing()
endif()

# Build subprojects
add_subdirectory(libclfsm)
add_subdirectory(clfsm)
")

# Create README
file(WRITE "${EXPORT_DIR}/README.md" "# Self-Contained gufsm Export

Minimal self-contained snapshot of the gufsm library and compiler.

## What's Included

- **libclfsm/** - FSM runtime library (source + headers)
- **clfsm/** - FSM compiler (source + headers)

All dependencies have been resolved and included. No external dependencies required.

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

# Copy LICENSE if it exists
copy_file_safe("${CMAKE_SOURCE_DIR}/LICENSE" "${EXPORT_DIR}/LICENSE")

# ==============================================================================
# README.md generation from conditional sections
# ==============================================================================
message(STATUS "  Generating README.md with conditional sections...")

# Determine build configuration from passed parameters (with defaults)
if(NOT DEFINED EXPORT_WITH_WHITEBOARD)
    set(EXPORT_WITH_WHITEBOARD OFF)
endif()

if(NOT DEFINED EXPORT_WITH_REFLECTION)
    set(EXPORT_WITH_REFLECTION OFF)
endif()

if(NOT DEFINED EXPORT_COMPILE_MACHINES)
    set(EXPORT_COMPILE_MACHINES ON)
endif()

if(NOT DEFINED EXPORT_DEVEL)
    set(EXPORT_DEVEL ON)  # Default to ON (include dev sections unless explicitly disabled)
endif()

if(NOT DEFINED EXPORT_EXPORTING)
    set(EXPORT_EXPORTING OFF)  # Default to OFF (export instructions only for developers)
endif()

# Build sed command to strip conditional sections
set(SED_COMMANDS "")

# Remove DEVEL sections if not exporting for developers
if(NOT EXPORT_DEVEL)
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:DEVEL -->/,/<!-- END:DEVEL -->/d'")
else()
    # Keep DEVEL sections, just remove markers
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:DEVEL -->/d' -e '/<!-- END:DEVEL -->/d'")
endif()

# Handle test sections
if(EXPORT_TESTS)
    # Keep TESTS sections, remove NO_TESTS sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_TESTS -->/,/<!-- END:NO_TESTS -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:TESTS -->/d' -e '/<!-- END:TESTS -->/d'")
else()
    # Keep NO_TESTS sections, remove TESTS sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:TESTS -->/,/<!-- END:TESTS -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_TESTS -->/d' -e '/<!-- END:NO_TESTS -->/d'")
endif()

# Handle exporting sections
if(NOT EXPORT_EXPORTING)
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:EXPORTING -->/,/<!-- END:EXPORTING -->/d'")
else()
    # Keep EXPORTING sections, remove markers
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:EXPORTING -->/d' -e '/<!-- END:EXPORTING -->/d'")
endif()

# Handle whiteboard sections
if(EXPORT_WITH_WHITEBOARD)
    # Keep WHITEBOARD sections, remove NO_WHITEBOARD sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_WHITEBOARD -->/,/<!-- END:NO_WHITEBOARD -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:WHITEBOARD -->/d' -e '/<!-- END:WHITEBOARD -->/d'")
else()
    # Keep NO_WHITEBOARD sections, remove WHITEBOARD sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:WHITEBOARD -->/,/<!-- END:WHITEBOARD -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_WHITEBOARD -->/d' -e '/<!-- END:NO_WHITEBOARD -->/d'")
endif()

# Handle reflection sections
if(EXPORT_WITH_REFLECTION)
    # Keep REFLECTION sections, remove NO_REFLECTION sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_REFLECTION -->/,/<!-- END:NO_REFLECTION -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:REFLECTION -->/d' -e '/<!-- END:REFLECTION -->/d'")
else()
    # Keep NO_REFLECTION sections, remove REFLECTION sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:REFLECTION -->/,/<!-- END:REFLECTION -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_REFLECTION -->/d' -e '/<!-- END:NO_REFLECTION -->/d'")
endif()

# Handle compilation sections
if(EXPORT_COMPILE_MACHINES)
    # Keep COMPILE_MACHINES sections, remove NO_COMPILE_MACHINES sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_COMPILE_MACHINES -->/,/<!-- END:NO_COMPILE_MACHINES -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:COMPILE_MACHINES -->/d' -e '/<!-- END:COMPILE_MACHINES -->/d'")
else()
    # Keep NO_COMPILE_MACHINES sections, remove COMPILE_MACHINES sections
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:COMPILE_MACHINES -->/,/<!-- END:COMPILE_MACHINES -->/d'")
    set(SED_COMMANDS "${SED_COMMANDS} -e '/<!-- BEGIN:NO_COMPILE_MACHINES -->/d' -e '/<!-- END:NO_COMPILE_MACHINES -->/d'")
endif()

# Apply sed to generate README.md
execute_process(
    COMMAND sh -c "sed ${SED_COMMANDS} '${CMAKE_SOURCE_DIR}/README.md' > '${EXPORT_DIR}/README.md'"
    RESULT_VARIABLE SED_RESULT
)

if(NOT SED_RESULT EQUAL 0)
    message(WARNING "Failed to generate README.md with sed, copying as-is")
    copy_file_safe("${CMAKE_SOURCE_DIR}/README.md" "${EXPORT_DIR}/README.md")
endif()

# ==============================================================================
# TESTS (optional)
# ==============================================================================
if(EXPORT_TESTS)
    message(STATUS "  Collecting test files...")
    file(MAKE_DIRECTORY "${EXPORT_DIR}/libclfsm/libclfsmTests")

    # Copy test files
    copy_file_safe("${CMAKE_SOURCE_DIR}/libclfsm/libclfsmTests/VectorFactory_tests.cc" "${EXPORT_DIR}/libclfsm/libclfsmTests/VectorFactory_tests.cc")
    copy_file_safe("${CMAKE_SOURCE_DIR}/libclfsm/libclfsmTests/DummyMachines.h" "${EXPORT_DIR}/libclfsm/libclfsmTests/DummyMachines.h")
    copy_file_safe("${CMAKE_SOURCE_DIR}/libclfsm/libclfsmTests/CMakeLists.txt" "${EXPORT_DIR}/libclfsm/libclfsmTests/CMakeLists.txt")
endif()

message(STATUS "Export complete!")
message(STATUS "")
message(STATUS "Minimal self-contained gufsm exported to: ${EXPORT_DIR}")
message(STATUS "")
message(STATUS "To build:")
message(STATUS "  cd ${EXPORT_DIR}")
message(STATUS "  mkdir build && cd build")
message(STATUS "  cmake -G Ninja ..")
message(STATUS "  ninja")
if(EXPORT_TESTS)
    message(STATUS "")
    message(STATUS "To run tests:")
    message(STATUS "  ctest --output-on-failure")
endif()
