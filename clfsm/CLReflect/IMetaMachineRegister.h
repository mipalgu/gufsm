#ifndef IMETAMACHINEREGISTER_H
#define IMETAMACHINEREGISTER_H

#include "CLMetaMachine.h"

#include <memory>

namespace FSM
{
    namespace CLReflect
    {
        //! An interface that registers a meta machine with CLReflect
        class IMetaMachineRegister
        {
            public:
                virtual void registerMachine(std::shared_ptr<CLMetaMachine> m) = 0;

                virtual ~IMetaMachineRegister() {}
        };
    }
}

#endif
