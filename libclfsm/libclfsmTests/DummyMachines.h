#ifndef DUMMYMACHINES_H
#define DUMMYMACHINES_H

#include "CLMachine.h"
#include "CLReflectAPI.h"
#include <iostream>

class TestMachine: public FSM::CLMachine
{
    virtual FSM::CLState * const *states() const { return NULLPTR; }
    virtual int numberOfStates() const { return 0; }
};

//! Function to create dummy meta-machine for PingPong
refl_metaMachine createPingPong();

inline refl_metaMachine createPingPong()
{
    refl_metaMachine m = refl_initMetaMachine(NULLPTR);
    refl_metaState ping = refl_initMetaState(NULLPTR);
    refl_metaState pong = refl_initMetaState(NULLPTR);

    // Machine
    char machineName[] = "PingPongCLFSM";
    refl_setMetaMachineName(m, machineName, NULLPTR);

    //States
    refl_setMetaStateName(ping, "Ping", NULLPTR);

    refl_setMetaStateName(pong, "Pong", NULLPTR);


    refl_metaState states[] = { ping, pong };

    refl_setMetaStates(m, states, 2, NULLPTR);


    return m;

}

#endif /* end of include guard: DUMMYMACHINES_H */
