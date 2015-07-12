#ifndef CLREFLECTIONSYSTEM_H
#define CLREFLECTIONSYSTEM_H

#include "IMachineStorage.h"
#include "IMetaMachineRegister.h"
#include "CLMetaRegister.h"

#include <memory>

namespace CLReflect
{
    //! The C++ API for CLReflect
    /*!
        Implemented as a singleton since it needs to hold references
        to the CLFSM machine storage and meta machine register
    */
    class CLReflectionSystem
    {
    private:
        //! Private constructor for the singleton pattern
        CLReflectionSystem();

        std::shared_ptr<IMachineStorage> _machineStore;

        CLMetaRegister _metaStore;

    public:
        virtual ~CLReflectionSystem() {}

        //! Singleton getter
        static CLReflectionSystem* getInstance();

        void registerMachine(std::shared_ptr<CLMetaMachine> machine);

        void setMachineStorage(std::shared_ptr<IMachineStorage> store) { _machineStore = store; }

        std::shared_ptr<IMachineStorage> getMachineStore() { return _machineStore; }

        CLMetaRegister getMetaStore() { return _metaStore; }

        std::shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name);

        std::shared_ptr<CLMetaMachine> getMetaMachineOfType(std::string type);

    };
}


#endif
