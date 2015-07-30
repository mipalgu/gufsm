#ifndef DUMMYMACHINES_H
#define DUMMYMACHINES_H

#include "CLMachine.h"

class TestMachine: public FSM::CLMachine
{
    virtual FSM::CLState * const *states() const { return NULL; }
    virtual int numberOfStates() const { return 0; }
};

#endif /* end of include guard: DUMMYMACHINES_H */
