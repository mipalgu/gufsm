# Build configuration for gufsm project

# By default, build both libclfsm and clfsm
option(BUILD_LIBCLFSM "Build the libclfsm library" ON)
option(BUILD_CLFSM "Build the clfsm compiler executable" ON)
option(BUILD_TESTS "Build and run unit tests (requires GTest)" OFF)
option(COMPILE_MACHINES "Enable runtime machine compilation support" ON)
