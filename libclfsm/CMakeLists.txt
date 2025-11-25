cmake_minimum_required(VERSION 3.21)

project(libclfsm C CXX)

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

# Include project sources
include(project.cmake)

# Build both static and shared libraries
add_library(libclfsm_static STATIC ${LIBCLFSM_SOURCES})
add_library(libclfsm SHARED ${LIBCLFSM_SOURCES})

# Set output names (both produce libclfsm.a and libclfsm.dylib/so)
set_target_properties(libclfsm_static PROPERTIES OUTPUT_NAME clfsm)
set_target_properties(libclfsm PROPERTIES OUTPUT_NAME clfsm)

# Create an alias for the shared library as the default target
add_library(libclfsm_default ALIAS libclfsm)

# Include directories (apply to both static and shared)
foreach(target libclfsm_static libclfsm)
  target_include_directories(${target} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../gufsm>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../Common>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../gu_util>
    $<INSTALL_INTERFACE:include/gufsm>
    $<INSTALL_INTERFACE:include>
  )
endforeach()

# Optionally build with reflection API
option(LIBCLFSM_WITH_REFLECT "Build with CLReflect API support" OFF)

if(LIBCLFSM_WITH_REFLECT)
    target_sources(libclfsm_static PRIVATE ${LIBCLFSM_REFLECT_SOURCES})
    target_sources(libclfsm PRIVATE ${LIBCLFSM_REFLECT_SOURCES})
    target_compile_definitions(libclfsm_static PUBLIC LIBCLFSM_WITH_REFLECT)
    target_compile_definitions(libclfsm PUBLIC LIBCLFSM_WITH_REFLECT)
endif()

# Installation rules
install(TARGETS libclfsm_static libclfsm
    EXPORT clfsmTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include/gufsm
)

install(FILES ${LIBCLFSM_HEADERS}
    DESTINATION include/gufsm
)

if(LIBCLFSM_WITH_REFLECT)
    install(FILES ${LIBCLFSM_REFLECT_HEADERS}
        DESTINATION include/gufsm/CLReflect
    )
endif()

# Export targets
install(EXPORT clfsmTargets
    FILE clfsmTargets.cmake
    NAMESPACE clfsm::
    DESTINATION lib/cmake/clfsm
)

# Create package config file
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/clfsmConfigVersion.cmake"
    VERSION 1.0.0
    COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/clfsmConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/clfsmConfig.cmake"
    INSTALL_DESTINATION lib/cmake/clfsm
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/clfsmConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/clfsmConfigVersion.cmake"
    DESTINATION lib/cmake/clfsm
)
