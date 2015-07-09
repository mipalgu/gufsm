#ifndef IMETAMACHINEREGISTER_H
#define IMETAMACHINEREGISTER_H

#include "CLMetaMachine.h"
#include <string>
#include <memory>

namespace FSM
{
    namespace CLReflect
    {
        //! An interface that registers a meta machine with CLReflect
        class IMetaMachineRegister
        {
            public:
                virtual void register(shared_ptr<CLMetaMachine> machine) = 0;

                virtual ~IMetaMachineRegister() {}
        };
    }
}

#endif
