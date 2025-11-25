# Sources for the clfsm compiler executable.
# This tool compiles .machine directories into executable code.

set(CLFSM_SOURCES
    clfsm_main.cc
    clfsm_machine.cc
    clfsm_cc.cc
    clfsm_machine_loader.cc
)

# Headers for the clfsm compiler
set(CLFSM_HEADERS
    clfsm_cc.h
    clfsm_cc_delegate.h
    clfsm_machine.h
    clfsm_machine_loader.h
    clfsm_visitors.h
    clfsm_visitorsupport.h
)

# Additional sources needed for standalone build
set(CLFSM_ADDITIONAL_SOURCES
    clfsm_visitors.cc
    clfsm_visitorsupport.cc
    FileParser.cc
    Schedule.cc
    TTCLFSMVectorFactory.cc
)
