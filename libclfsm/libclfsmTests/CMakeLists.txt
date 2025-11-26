cmake_minimum_required(VERSION 3.21)

project(libclfsmTests CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug)
endif()

add_definitions(-DFSM_SUPPORT_SUSPEND)

# Find GTest
find_package(GTest QUIET)

if(NOT GTest_FOUND)
    message(STATUS "GTest not found locally, fetching from GitHub...")
    include(FetchContent)
    FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG v1.14.0
    )
    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(googletest)
    message(STATUS "GTest fetched successfully")
endif()

message(STATUS "Building libclfsm tests with GTest")

# Test executable
add_executable(libclfsm_tests
    VectorFactory_tests.cc
)

# Include directories
target_include_directories(libclfsm_tests PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}/../../gufsm
    ${CMAKE_CURRENT_SOURCE_DIR}/../../clfsm
)

# Link with libclfsm and GTest
if(TARGET libclfsm_static)
    target_link_libraries(libclfsm_tests PRIVATE libclfsm_static)
elseif(TARGET libclfsm)
    target_link_libraries(libclfsm_tests PRIVATE libclfsm)
else()
    message(FATAL_ERROR "libclfsm not found")
endif()

# Link with GTest (handle both system-installed and FetchContent cases)
if(TARGET GTest::gtest)
    target_link_libraries(libclfsm_tests PRIVATE GTest::gtest GTest::gtest_main)
else()
    target_link_libraries(libclfsm_tests PRIVATE gtest gtest_main)
endif()

# Add test (enable_testing is called at top level)
add_test(NAME libclfsm_tests COMMAND libclfsm_tests)
