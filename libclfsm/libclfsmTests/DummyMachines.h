#ifndef DUMMYMACHINES_H
#define DUMMYMACHINES_H

#include "CLMachine.h"
#include "CLReflectAPI.h"
#include <iostream>

class TestMachine: public FSM::CLMachine
{
    virtual FSM::CLState * const *states() const { return NULL; }
    virtual int numberOfStates() const { return 0; }
};

//! Function to create dummy meta-machine for PingPong
refl_metaMachine createPingPong();

inline refl_metaMachine createPingPong()
{
    refl_metaMachine m = refl_initMetaMachine(NULL);
    refl_metaState ping = refl_initMetaState(NULL);
    refl_metaState pong = refl_initMetaState(NULL);

    // Machine
    char machineName[] = "PingPongCLFSM";
    refl_setMetaMachineName(m, machineName, NULL);

    //States
    refl_setMetaStateName(ping, "Ping");

    refl_setMetaStateName(pong, "Pong");


    refl_metaState states[] = { ping, pong };

    refl_setMetaStates(m, states, 2, NULL);


    return m;

}

#endif /* end of include guard: DUMMYMACHINES_H */
