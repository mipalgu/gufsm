#ifndef CLMETAREGISTER_H
#define CLMETAREGISTER_H

#include "IMetaMachineRegister.h"
#include "IMetaMachineStorage.h"

namespace CLReflect
{
    //! A class to store and retrieve meta machines
    class CLMetaRegister : IMetaMachineRegister, IMetaMachineStorage
    {
    public:
        CLMetaRegister() {}

        virtual ~CLMetaRegister() {}

        CLMetaMachine getMetaMachineWithName(std::string name);

        CLMetaMachine getMetaMachineOfType(std::string type);

        void registerMachine(std::shared_ptr<CLMetaMachine> machine);

    };
}


#endif
