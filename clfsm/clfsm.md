Compiled Finite State Machine Scheduler {#mainpage}
===================================================
\tableofcontents

`clfsm` is a powerful scheduler for arrangements of compiled Objective-C++ finite state machines.  It compiles (using clang) and schedules `.machine` FSM bundles for deterministic low-latency execution.

# Usage #

`clfsm [-c][-d][-fPIC]{-I includedir}{-L linkdir}{-l lib}[-n][-s][-v] {machines}`

`-c`
 – compile only flag, don't execute machine.

`-fPIC`
 – specify to generate Position Independent Code, required by some machines.

`-I` *includedir*
 – include directory to add to the search path during compilation.

`-L` *linkdir*
 – library directory to add to the search path during linking.

`-l lib`
 – library to link against

`-n`
 – restart CLFSM after SIGABRT or SIGIOT signals.
 
`-s`
 – turn on debugging output on suspend, resume, and restart of machines.

`-v`
 – Verbose: output MachineID, State, and name of machine for every state change
 
`-d`
 – print additional debug information (requires `-v` switch to be set as well).

*machines*
 – list of finite state machine bundles (with our without the `.machine` extension) to compile and run.

## Examples ##

The following example shows how to run `clfsm`, its output, and the backtrace produced when aborting the program by pressing `^C` (Control-C):

    $ cd $GUNAO_DIR/posix/gufsm/clfsm/examples
    $ ../build.host/clfsm -I.. PingPongCLFSM
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

In the above backtrace, the interesting line is `008:`
this shows that the scheduler was currently in the sleep state between states
(`protected_usleep` in trace line `009:` called from the state machine vector factory's `execute()` function).

# Bugs #

All finite state machines currently need to be in the same directory as the current working directory `clfsm` is run from.  A workaround is to use a symbolic link that points to the actual locations of the corresponding `.machine` bundle directory.


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

