#ifndef IMETAMACHINEREGISTER_H
#define IMETAMACHINEREGISTER_H

#include "CLMetaMachine.h"

#include <memory>

namespace CLReflect
{
    //! An interface that registers a meta machine with CLReflect
    class IMetaMachineRegister
    {
        public:
            virtual void registerMachine(std::shared_ptr<CLMetaMachine> m) = 0;

            IMetaMachineRegister() = default;
            IMetaMachineRegister(IMetaMachineRegister const &) = default;

        protected:
            virtual ~IMetaMachineRegister() {}
    };
}


#endif
