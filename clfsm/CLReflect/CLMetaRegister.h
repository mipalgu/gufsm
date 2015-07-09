#ifndef CLMETAREGISTER_H
#define CLMETAREGISTER_H

#include "IMetaMachineRegister.h"
#include "IMetaMachineStorage.h"

#include <string>
#include <map>

namespace CLReflect
{
    //! A class to store and retrieve meta machines
    class CLMetaRegister : IMetaMachineRegister, IMetaMachineStorage
    {
    public:
        CLMetaRegister() {}

        virtual ~CLMetaRegister() {}

        std::shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name);

        std::shared_ptr<CLMetaMachine> getMetaMachineOfType(std::string type);

        void registerMachine(std::shared_ptr<CLMetaMachine> machine);

    private:
        std::map<std::string, std::shared_ptr<CLMetaMachine>> _metaRegistry;

    };
}


#endif
