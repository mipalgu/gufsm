cmake_minimum_required(VERSION 3.21)

project(clfsm CXX)

# Require the C++ standard to be C++17,
# but allow extensions.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

# Set the default build type to Debug.
if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

# Define FSM_SUPPORT_SUSPEND for suspensible machines
add_definitions(-DFSM_SUPPORT_SUSPEND)

# Include project sources
include(project.cmake)

# Try to find libclfsm (if building standalone)
if(NOT TARGET libclfsm)
    find_package(clfsm QUIET)

    if(NOT clfsm_FOUND)
        # If libclfsm is not installed, build it as a subdirectory
        if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../libclfsm/CMakeLists.txt")
            message(STATUS "Building libclfsm from source")
            add_subdirectory(../libclfsm ${CMAKE_CURRENT_BINARY_DIR}/libclfsm)
        else()
            message(FATAL_ERROR "libclfsm not found. Please install it or ensure ../libclfsm exists.")
        endif()
    endif()
endif()

# Build the clfsm compiler executable
add_executable(clfsm
    ${CLFSM_SOURCES}
    ${CLFSM_ADDITIONAL_SOURCES}
)

# Include directories
target_include_directories(clfsm PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/..
  ${CMAKE_CURRENT_SOURCE_DIR}/../libclfsm
  ${CMAKE_CURRENT_SOURCE_DIR}/../gufsm
  ${CMAKE_CURRENT_SOURCE_DIR}/../..
  ${CMAKE_CURRENT_SOURCE_DIR}/../../gusimplewhiteboard
  ${CMAKE_CURRENT_SOURCE_DIR}/../../Common
  ${CMAKE_CURRENT_SOURCE_DIR}/../gu_util
)

# Link with libclfsm (shared library by default)
if(TARGET libclfsm)
    target_link_libraries(clfsm PRIVATE libclfsm)
elseif(TARGET libclfsm_static)
    target_link_libraries(clfsm PRIVATE libclfsm_static)
else()
    target_link_libraries(clfsm PRIVATE clfsm::clfsm)
endif()

# Link with dl library (for dynamic loading)
target_link_libraries(clfsm PRIVATE ${CMAKE_DL_LIBS})

# Set RPATH for installed executable to find libclfsm
set_target_properties(clfsm PROPERTIES
    INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib"
    BUILD_WITH_INSTALL_RPATH FALSE
    INSTALL_RPATH_USE_LINK_PATH TRUE
)

# Installation rules
install(TARGETS clfsm
    RUNTIME DESTINATION bin
)

# Install man page if it exists
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/clfsm.1")
    install(FILES clfsm.1
        DESTINATION share/man/man1
        RENAME clfsm.1
    )
endif()
