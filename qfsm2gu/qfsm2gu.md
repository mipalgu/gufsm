QFSM Finite State Machine Converter {#mainpage}
===================================================
\tableofcontents

`qfsm2gu` is a converter for files created by the `qfsm` graphical state machine editor
to pairs of `action` and `transition` files suitable for interpretation by the `gufsm`
finite state machine scheduler.  


# Usage #

`qfsm2gu {machines}`

*machines* - list of `qfsm` finite state machine XML files (including the `.fsm` extension) to convert

## Examples ##

The following example shows how to run `qfsm2gu` to compile `SMPlayer.fsm` into `SMPlayer.acsl` and `SMPlayer.tcsl`:

    $ qfsm2gu SMPlayer.fsm



# Compiling #

### Building for the Host ###
The `qfsm2gu` tool requires `libclfsm` to be compiled and installed in `$PREFIX`
(typically `/usr/local`) first.
Then, to build the `qfsm2gu` tool for the host use `bmake host`.
To install under `$PREFIX`, use `sudo bmake install`

### Building for a Target ###
To build the tool for the default cross-compilation target, simply use
`bmake robot`.
Alternatively, to build the tool for a different target, use
`bmake target TARGET=`*targetname*.
