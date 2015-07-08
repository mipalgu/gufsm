#ifndef IMETAMACHINEREGISTER_H
#define IMETAMACHINEREGISTER_H

#include "CLMetaMachine.h"
#include <string>

namespace FSM
{
    namespace CLReflect
    {
        //! An interface that registers a meta machine with CLReflect
        class IMetaMachineRegister
        {
            public:
                virtual void register(CLMetaMachine *machine) = 0;

                virtual ~IMetaMachineRegister() {}
        };
    }
}

#endif
