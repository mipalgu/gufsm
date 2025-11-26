Compiled Finite State Machine Scheduler
=======================================

`clfsm` is a powerful scheduler for arrangements of compiled C++ (or Objective-C++)
logic-labelled finite state machines (LLFSMs). It schedules`.machine` FSM bundles
for deterministic low-latency execution.

**libclfsm** is the runtime library that provides the FSM execution engine, state management, transitions, and scheduling infrastructure.

## Components

- **libclfsm** - C++ LLFSM runtime library
  - Static library: `libclfsm.a`
  - Shared library: `libclfsm.dylib` (macOS) / `libclfsm.so` (Linux)
  - Headers for embedding FSMs in your applications
- **clfsm** - FSM scheduler
  - Compiles `.machine` directories into executable code
  - Executes and schedules finite state machines
  - Man page: `clfsm(1)`
<!-- BEGIN:TESTS -->
- **Unit tests** - Test suite for libclfsm
  - Uses Google Test (GTest) framework
  - Tests FSM functionality and machine management
<!-- END:TESTS -->

<!-- BEGIN:DEVEL -->
## Prerequisites

You need a POSIX system, a C/C++ compiler, [cmake](https://cmake.org),
and a build system supported by [cmake](https://cmake.org), such as
[Ninja](https://ninja-build.org) or
[gmake](https://www.gnu.org/software/make/).
<!-- BEGIN:WHITEBOARD -->

You will also need to build and install the following packages:

 * [gu_util](https://github.com/mipalgu/gu_util.git)
 * [guunits](https://github.com/mipalgu/guunits.git)
 * [gucoordinates](https://github.com/mipalgu/gucoordinates)
 * [gusimplewhiteboard](https://github.com/mipalgu/gusimplewhiteboard)
<!-- END:WHITEBOARD -->

Follow the links to the above packages for building instructions.
<!-- END:DEVEL -->

## Building

To build, you simply create a build directory (e.g. `build`)
using [cmake](https://cmake.org), then use your build system to
build and install. Here is an example using
[Ninja](https://ninja-build.org):

```sh
mkdir build
cd build
cmake -G Ninja ..
ninja
ninja install
```

If you require root permissions, run `ninja install` as root,
e.g. by using [sudo](https://www.sudo.ws):

```sh
sudo ninja install
```

<!-- BEGIN:DEVEL -->
## Build Options

### CMake Configuration

```sh
# Build only the library (skip clfsm executable)
cmake .. -DBUILD_CLFSM=OFF

# Build only the compiler (skip libclfsm)
cmake .. -DBUILD_LIBCLFSM=OFF
```

<!-- BEGIN:WHITEBOARD -->
### Whiteboard Support

The whiteboard (gusimplewhiteboard) is automatically detected at build time using `find_package(gusimplewhiteboard QUIET)`:
- **Found**: Builds with `WITH_WHITEBOARD` defined, enabling whiteboard integration for inter-process communication
- **Not Found**: Builds without whiteboard support using the standard FSM vector factory

Both modes are fully functional and the code uses conditional compilation (`#ifdef WITH_WHITEBOARD`) to support either configuration.
<!-- END:WHITEBOARD -->

<!-- BEGIN:REFLECTION -->
### Reflection API

By default, the CLReflect API is disabled. To enable it:

```sh
cmake .. -DLIBCLFSM_WITH_REFLECT=ON
```

This requires the CLReflect source files to be present in the repository and enables runtime introspection of state machines, including querying machine structure, states, transitions, and variables.
<!-- END:REFLECTION -->

<!-- BEGIN:TESTS -->
### Unit Tests

Unit tests are disabled by default. To build and run tests:

```sh
cmake .. -DBUILD_TESTS=ON
ninja
ctest --output-on-failure
```

**Requirements**: Tests use Google Test (GTest). If GTest is not found on the system, it will be automatically downloaded via FetchContent from GitHub.

**Test Coverage**: The test suite includes:
- FSM vector factory tests
- Machine creation and management tests

Tests properly handle optional features using conditional compilation, skipping whiteboard and reflection tests when those features are disabled.
<!-- END:TESTS -->

<!-- BEGIN:COMPILE_MACHINES -->
### Machine Compilation Support

Runtime machine compilation is enabled by default. This allows clfsm to automatically compile `.machine` directories at runtime when the compiled `.so` file is not found.

To disable machine compilation (for environments where runtime compilation is not needed or desired):

```sh
cmake .. -DCOMPILE_MACHINES=OFF
ninja
```

**With COMPILE_MACHINES=ON** (default):
- clfsm can compile `.machine` directories on-the-fly
- Supports `-c`, `-f`, `-I`, `-L`, `-l` compiler/linker flags
- Automatically compiles missing `.so` files

**With COMPILE_MACHINES=OFF**:
- clfsm can only load precompiled `.so` files
- Compilation flags are not available
- Smaller binary with fewer dependencies
- Suitable for deployment environments with precompiled machines
<!-- END:COMPILE_MACHINES -->
<!-- END:DEVEL -->

## Installation

```sh
ninja install
```

By default, this installs to `/usr/local`:
- Libraries → `/usr/local/lib/`
- Headers → `/usr/local/include/gufsm/`
- Executable → `/usr/local/bin/clfsm`
- Man page → `/usr/local/share/man/man1/clfsm.1`
- CMake config → `/usr/local/lib/cmake/clfsm/`

To install to a different location:

```sh
cmake .. -DCMAKE_INSTALL_PREFIX=/path/to/install
ninja install
```

<!-- BEGIN:EXPORTING -->
## Creating a Self-Contained Export

To create a self-contained snapshot that includes all dependencies (gu_util) and can be built independently of the GUNao infrastructure:

```sh
cd build
ninja export
```

This creates `build/export/` containing:
- **libclfsm/** - FSM runtime library (source files, headers, including resolved gu_util.cpp/h)
- **clfsm/** - FSM compiler (source files, headers, man page)
- **CMakeLists.txt** - Top-level build configuration
- **README.md** - Build instructions for the export (conditionally generated)
- **LICENSE** - Licence file

The export is **truly minimal** with:
- NO symlinks (all resolved to actual files)
- NO gufsm/, Common/, or other GUNao infrastructure directories
- NO examples or unnecessary files
- Only files required to build and run libclfsm and clfsm
- All dependencies embedded in their target directories

The exported directory can be built completely independently of the GUNao repository.

### Export Options

The export can be customised using CMake options:

**Include unit tests in export:**
```sh
cmake .. -DBUILD_TESTS=ON
ninja export
```

**Include development sections in README** (Prerequisites, Build Options, ROS, bmake):
```sh
cmake .. -DEXPORT_DEVEL=ON
ninja export
```

**Create end-user export** (minimal README without development information):
```sh
cmake .. -DEXPORT_DEVEL=OFF
ninja export
```

**Control machine compilation support:**
```sh
# Enable runtime compilation (default)
cmake .. -DCOMPILE_MACHINES=ON
ninja export

# Disable runtime compilation (precompiled machines only)
cmake .. -DCOMPILE_MACHINES=OFF
ninja export
```

**Combine options:**
```sh
# End-user export with tests, no compilation support, no dev sections
cmake .. -DBUILD_TESTS=ON -DCOMPILE_MACHINES=OFF -DEXPORT_DEVEL=OFF
ninja export
```

The exported README.md is automatically generated with only the relevant sections based on these build options.
<!-- END:EXPORTING -->

## Build Configuration and Defaults

<!-- BEGIN:WHITEBOARD -->
### Whiteboard Support: **ENABLED**

This build includes whiteboard integration for inter-process communication via gusimplewhiteboard.

The whiteboard provides a publish-subscribe blackboard architecture for communication between FSMs and other system components.
<!-- END:WHITEBOARD -->
<!-- BEGIN:NO_WHITEBOARD -->
### Whiteboard Support: **DISABLED**

This build does not include whiteboard integration. FSMs run standalone without inter-process communication via whiteboard.
<!-- END:NO_WHITEBOARD -->

<!-- BEGIN:REFLECTION -->
### Reflection API: **ENABLED**

This build includes the CLReflect API for runtime introspection of state machines.

The reflection API allows querying machine structure, states, transitions, and variables at runtime.
<!-- END:REFLECTION -->
<!-- BEGIN:NO_REFLECTION -->
### Reflection API: **DISABLED**

This build does not include the reflection API. Runtime introspection is not available.
<!-- END:NO_REFLECTION -->

<!-- BEGIN:COMPILE_MACHINES -->
### Machine Compilation: **ENABLED**

This build supports runtime compilation of `.machine` directories.

clfsm can automatically compile `.machine` source directories into shared libraries at runtime when the compiled `.so` file is not found.
<!-- END:COMPILE_MACHINES -->
<!-- BEGIN:NO_COMPILE_MACHINES -->
### Machine Compilation: **DISABLED**

This build does **not** support runtime compilation of `.machine` directories.

clfsm can only load precompiled `.so` files. You must compile your machines separately before running them.
<!-- END:NO_COMPILE_MACHINES -->

# Usage #

<!-- BEGIN:COMPILE_MACHINES -->
```
clfsm [-c][-d][-fPIC]{-I includedir}{-L linkdir}{-l lib}[-n][-P <machine>][-s][-S <machine>][-v] {machines}

-c
 – compile only flag, don't execute machine.

-fPIC
 – specify to generate Position Independent Code, required by some machines.

-I includedir
 – include directory to add to the search path during compilation.

-L linkdir
 – library directory to add to the search path during linking.

-l lib
 – library to link against

-n
 – restart CLFSM after SIGABRT or SIGIOT signals.

-P
 - Preload a machine. Load a machine and place it in memory, but do not add it to the schedule. This flag speeds up loading machines that are dynamically loaded and unloaded using the dynamic loading function in CLMacros (loadAndAddMachine, scheduleMachine, unscheduleMachineAtIndex, unloadMachineAtIndex). This is also advantageous when using parameterised machines that are dynamically loaded (when using call_machine_at_path for example).

-s
 – turn on debugging output on suspend, resume, and restart of machines.

-S
 - Loads a machine suspended. This flag effectively sets the current state of the machine to the machine's suspend state. All machines scheduled with -S are placed at the end of the schedule in the order that they are in when invoking clfsm. Note, that the entire ringlet of the suspend state executes the first time the machine runs, including the OnEntry action. This flag is necessary when using parameterised machines that are not dynamically loaded and which should exist in the schedule waiting to be called (when using call_static_machine_at for example).

-v
 – Verbose: output MachineID, State, and name of machine for every state change

-d
 – print additional debug information (requires -v switch to be set as well).

machines
 – list of finite state machine bundles (with or without the .machine extension) to compile and run.
```
<!-- END:COMPILE_MACHINES -->
<!-- BEGIN:NO_COMPILE_MACHINES -->
```
clfsm [-d][-i idlesleep][-n][-P <machine>][-s][-S <machine>][-t][-v] {machines}

-n
 – restart CLFSM after SIGABRT or SIGIOT signals.

-P
 - Preload a machine. Load a machine and place it in memory, but do not add it to the schedule. This flag speeds up loading machines that are dynamically loaded and unloaded using the dynamic loading function in CLMacros (loadAndAddMachine, scheduleMachine, unscheduleMachineAtIndex, unloadMachineAtIndex). This is also advantageous when using parameterised machines that are dynamically loaded (when using call_machine_at_path for example).

-s
 – turn on debugging output on suspend, resume, and restart of machines.

-S
 - Loads a machine suspended. This flag effectively sets the current state of the machine to the machine's suspend state. All machines scheduled with -S are placed at the end of the schedule in the order that they are in when invoking clfsm. Note, that the entire ringlet of the suspend state executes the first time the machine runs, including the OnEntry action. This flag is necessary when using parameterised machines that are not dynamically loaded and which should exist in the schedule waiting to be called (when using call_static_machine_at for example).

-v
 – Verbose: output MachineID, State, and name of machine for every state change

-d
 – print additional debug information (requires -v switch to be set as well).

machines
 – list of finite state machine bundles (with or without the .machine extension) to compile and run.
```
<!-- END:NO_COMPILE_MACHINES -->

For complete usage information, see the man page:

```sh
man clfsm
```

### Machine Structure

A `.machine` is a directory bundle containing:
- `States` - List of state names (one per line)
- `State_*_OnEntry.mm` - Code executed when entering a state
- `State_*_OnExit.mm` - Code executed when leaving a state
- `State_*_Internal.mm` - Code executed while in a state
- `State_*_Transition_N.expr` - Guard conditions for transitions
- `*_Variables.h` - State and machine variable declarations
- `*.h` / `*.mm` - Machine class implementation
- `Layout.plist` - Visual layout metadata (optional)

## Examples ##

<!-- BEGIN:COMPILE_MACHINES -->
The following example shows how to run `clfsm`, its output, and the backtrace produced when aborting the program by pressing `^C` (Control-C):

```
$ cd examples
$ clfsm -I.. PingPongCLFSM
Ping 62
Pong 63
Ping 63
^CCaught signal 2: aborting ...
000: 0   clfsm                               0x000000010ec11b39	_ZL15print_backtracei + 73
001: 1   clfsm                               0x000000010ec115f3 _ZL24backtrace_signal_handleri + 19
002: 2   libsystem_platform.dylib            0x00007fff8c949f1a _sigtramp + 26
003: 3   ???                                 0x00007fff50ff9120 0x0 + 140734552314144
004: 4   libsystem_c.dylib                   0x00007fff91b1eb53 abort + 129
005: 5   clfsm                               0x000000010ec11a6a _ZL23aborting_signal_handleri + 794
006: 6   libsystem_platform.dylib            0x00007fff8c949f1a _sigtramp + 26
007: 7   ???                                 0x00007fff50ff98a0 0x0 + 140734552316064
008: 8   libsystem_c.dylib                   0x00007fff91b3fe50 usleep + 54
009: 9   clfsm                               0x000000010ec06697 protected_usleep + 87
010: 10  libclfsm.dylib                      0x000000010ec2a56d _ZN3FSM18CLFSMVectorFactory7executeEPFbPvPNS_18SuspensibleMachineEiES1_ + 61
011: 11  clfsm                               0x000000010ec11009 main + 6249
012: 12  libdyld.dylib                       0x00007fff8d2115c9 start + 1
Log file written to '/tmp/clfsm-tJD.log'
Abort
Exit 134
$
```

In the above backtrace, the interesting line is `008:`
this shows that the scheduler was currently in the sleep state between states
(`protected_usleep` in trace line `009:` called from the state machine vector factory's `execute()` function).
<!-- END:COMPILE_MACHINES -->
<!-- BEGIN:NO_COMPILE_MACHINES -->
**Important**: This build requires precompiled machines.

The following example shows how to run `clfsm` with a precompiled machine:

```
$ cd examples
$ ls PingPongCLFSM.machine/Darwin-x86_64/PingPongCLFSM.so
PingPongCLFSM.machine/Darwin-x86_64/PingPongCLFSM.so
$ clfsm PingPongCLFSM
Ping 62
Pong 63
Ping 63
^CCaught signal 2: aborting ...
...
```

The platform-specific compiled `.so` file must exist before running clfsm. The platform directory is determined by `uname -s` and `uname -m` (e.g., `Darwin-x86_64`, `Linux-arm64`).
<!-- END:NO_COMPILE_MACHINES -->

### Common Usage Patterns

**Running a single machine:**
```sh
clfsm MyMachine.machine
```

**Running multiple machines:**
```sh
clfsm Machine1.machine Machine2 Machine3.machine
```

**Preloading machines for dynamic loading:**
```sh
# Preload machines into memory without scheduling
clfsm -P DynamicMachine1 -P DynamicMachine2 MainMachine
```

**Loading machines in suspended state:**
```sh
# Machine starts in suspend state, waiting to be called
clfsm -S ParameterisedMachine MainMachine
```

**Verbose output with debugging:**
```sh
# Show state changes and debug information
clfsm -v -d MyMachine.machine
```

<!-- BEGIN:COMPILE_MACHINES -->
### Compilation Options

**Compile only (don't execute):**
```sh
clfsm -c MyMachine.machine
```

**Add include directories:**
```sh
clfsm -I/path/to/headers -I/another/path MyMachine.machine
```

**Add library search paths:**
```sh
clfsm -L/path/to/libs -lmylib MyMachine.machine
```

**Generate position-independent code:**
```sh
clfsm -fPIC MyMachine.machine
```

**Combine options:**
```sh
clfsm -c -fPIC -I/usr/local/include -L/usr/local/lib -lmylib MyMachine.machine
```
<!-- END:COMPILE_MACHINES -->

<!-- BEGIN:TESTS -->
## Running Tests

To run the unit tests:

```sh
cd build
ctest --output-on-failure
```

To run tests with verbose output:
```sh
ctest --output-on-failure --verbose
```

To run a specific test:
```sh
./libclfsm/libclfsmTests/libclfsm_tests
```
<!-- END:TESTS -->

## Using libclfsm in Your Projects

### With CMake

After installation:

```cmake
find_package(clfsm REQUIRED)
target_link_libraries(your_target PRIVATE clfsm::clfsm)
```

This automatically adds the necessary include paths and links the library.

### Manual Compilation

If not using CMake:

```sh
# Compile with headers
clang++ -std=c++11 -I/usr/local/include/gufsm your_code.cc -c

# Link with libclfsm
clang++ your_code.o -L/usr/local/lib -lclfsm -o your_program
```

### Runtime Library Path

Ensure the shared library can be found at runtime:

```sh
# macOS
export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH

# Linux
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```

Or link with rpath:
```sh
clang++ -L/usr/local/lib -Wl,-rpath,/usr/local/lib -lclfsm your_code.cc
```

<!-- BEGIN:WHITEBOARD -->
## Using the Whiteboard

This build includes whiteboard support for inter-process communication.

### Reading from Whiteboard

```cpp
#include "guwhiteboardgetter.h"

// Get a value from the whiteboard
int value = get_wb_value(kMyType);
```

### Writing to Whiteboard

```cpp
#include "guwhiteboardposter.h"

// Post a value to the whiteboard
post_wb_value(kMyType, myValue);
```

Machines can read and write whiteboard variables for communication with other processes and FSMs.
<!-- END:WHITEBOARD -->

<!-- BEGIN:REFLECTION -->
## Using the Reflection API

This build includes the reflection API for runtime introspection.

### Accessing Machine Metadata

```cpp
#include "CLReflectAPI.h"

// Get meta machine from a CLMachine instance
refl_metaMachine meta = Create_MetaMachine();
refl_setMachine(meta, machine_instance, nullptr);

// Query machine properties
const char* machine_name = refl_getMachineName(meta);
int num_states = refl_getNumberOfStates(meta);

// Iterate over states
for (int i = 0; i < num_states; i++) {
    refl_metaState state = refl_getStateAtIndex(meta, i);
    const char* state_name = refl_getStateName(state);
    // ... query state properties
}
```

The reflection API enables:
- Runtime machine introspection
- Dynamic state queries
- Transition analysis
- Variable access
- Model checking and verification
<!-- END:REFLECTION -->

## Architecture

### FSM Execution Model

The clfsm scheduler provides deterministic, low-latency execution:

1. **State-based execution**: Each machine is in exactly one state at a time
2. **Transition evaluation**: Guard conditions determine state changes
3. **Action execution**: OnEntry, Internal, and OnExit actions execute at appropriate times
4. **Suspendable machines**: Machines can suspend and resume execution
5. **Deterministic scheduling**: Multiple machines execute in a coordinated schedule

### Key Classes

**Core FSM Classes:**
- `FSMachine` - Base finite state machine class
- `FSMState` - Individual state with entry/exit/internal actions
- `FSMTransition` - Transition with guard conditions
- `FSMSuspensibleMachine` - Machines that can suspend/resume

**C-Like Wrapper Layer:**
- `CLMachine`, `CLState`, `CLTransition` - Simplified interface
- `CLFSMVectorFactory` - Factory for creating and managing machines
<!-- BEGIN:WHITEBOARD -->
- `CLFSMWBVectorFactory` - Whiteboard-enabled factory
<!-- END:WHITEBOARD -->

## Troubleshooting

### Library Not Found at Runtime

If you see `dyld: Library not loaded: @rpath/libclfsm.dylib` or similar:

**Solution 1:** Set library path environment variable
```sh
# macOS
export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH

# Linux
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
```

**Solution 2:** Reinstall with proper rpath
```sh
cmake .. -DCMAKE_INSTALL_RPATH=/usr/local/lib
ninja install
```

<!-- BEGIN:COMPILE_MACHINES -->
### Compilation Errors

**Machine compilation failed:**

Check that:
1. The `.machine` directory contains all required source files
2. Include paths are correct (use `-I` flag)
3. Required libraries are available (use `-L` and `-l` flags)
4. You have write permissions to the `.machine` directory (for creating the platform-specific output directory)

**Common fixes:**
```sh
# Add include paths
clfsm -I/usr/local/include/gufsm -I/path/to/headers MyMachine.machine

# Add library paths
clfsm -L/usr/local/lib -lmylib MyMachine.machine
```
<!-- END:COMPILE_MACHINES -->
<!-- BEGIN:NO_COMPILE_MACHINES -->
### Machine Loading Errors

**Machine not found or failed to load:**

This build requires precompiled `.so` files. Check that:
1. The platform-specific directory exists (e.g., `MyMachine.machine/Darwin-x86_64/`)
2. The `.so` file exists in that directory
3. The `.so` file was compiled for the correct platform
4. Required libraries are available at runtime

**Common fixes:**
```sh
# Check for compiled output
ls MyMachine.machine/*/MyMachine.so

# Verify platform
uname -sm

# Check library dependencies (macOS)
otool -L MyMachine.machine/Darwin-x86_64/MyMachine.so

# Check library dependencies (Linux)
ldd MyMachine.machine/Linux-x86_64/MyMachine.so
```
<!-- END:NO_COMPILE_MACHINES -->

### Header Files Not Found

Verify headers are installed:
```sh
ls /usr/local/include/gufsm/
```

If missing, reinstall:
```sh
cd build
ninja install
```

## Platform Support

Supported platforms:
- **macOS** (Darwin) - x86_64, arm64
- **Linux** - x86_64, arm64

## Directory Structure

<!-- BEGIN:TESTS -->
```
.
├── CMakeLists.txt          # Top-level build configuration
├── project.cmake           # Build options
├── README.md               # This file
├── LICENSE                 # Licence information
├── libclfsm/              # Runtime library
│   ├── CMakeLists.txt
│   ├── project.cmake
│   ├── clfsmConfig.cmake.in
│   ├── *.cc / *.h
│   └── libclfsmTests/     # Unit tests
└── clfsm/                # Compiler and scheduler
    ├── CMakeLists.txt
    ├── project.cmake
    ├── clfsm.1            # Man page
    └── *.cc / *.h
```
<!-- END:TESTS -->
<!-- BEGIN:NO_TESTS -->
```
.
├── CMakeLists.txt          # Top-level build configuration
├── project.cmake           # Build options
├── README.md               # This file
├── LICENSE                 # Licence information
├── libclfsm/              # Runtime library
│   ├── CMakeLists.txt
│   ├── project.cmake
│   ├── clfsmConfig.cmake.in
│   └── *.cc / *.h
└── clfsm/                # Compiler and scheduler
    ├── CMakeLists.txt
    ├── project.cmake
    ├── clfsm.1            # Man page
    └── *.cc / *.h
```
<!-- END:NO_TESTS -->

# Bugs #

All finite state machines currently need to be in the same directory as the current working directory `clfsm` is run from. A workaround is to use a symbolic link that points to the actual location of the corresponding `.machine` bundle directory.

<!-- BEGIN:DEVEL -->
# Compiling #

### Building for the Host ###
The `clfsm` tool requires `libclfsm` to be compiled and installed in `$PREFIX`
(typically `/usr/local`) first.
Then, to build the `clfsm` tool for the host use `bmake host`.
To install under `$PREFIX`, use `sudo bmake install`

### Building for a Target ###
To build the tool for the default cross-compilation target, simply use
`bmake robot`.
Alternatively, to build the tool for a different target, use
`bmake target TARGET=`*targetname*.

### Creating the ROS Makefile ###

In order to compile for ROS, you first need to
export the sources into `catkin_ws` for ROS using `bmake catkin`.
Again, make sure that you have exported the `libclfsm` catkin sources first!

## ROS ##

To build the tool for ROS, make sure you have copied the
sources into `catkin_ws` as described above, then simply use
`catkin_make`.
To permanently install the tool, use `catkin_make install`.
<!-- END:DEVEL -->

## Licence

See LICENSE file for licensing information.

## Additional Resources

- **Man page**: `man clfsm`
- **CMake integration**: `/usr/local/lib/cmake/clfsm/clfsmConfig.cmake`
- **Header files**: `/usr/local/include/gufsm/`
