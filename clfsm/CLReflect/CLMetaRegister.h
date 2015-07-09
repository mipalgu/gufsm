#ifndef CLMETAREGISTER_H
#define CLMETAREGISTER_H

#include "IMetaMachineRegister.h"
#include "IMetaMachineStorage.h"

namespace FSM
{
    namespace CLReflect
    {
        //! A class to store and retrieve meta machines
        class CLMetaRegister : IMetaMachineRegister, IMetaMachineStorage
        {
        public:
            shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name);

            shared_ptr<CLMetaMachine> getMetaMachineOfType(std::string type);

            void register(shared_ptr<CLMetaMachine> machine);

        };
    }
}

#endif
