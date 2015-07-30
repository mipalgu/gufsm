#ifndef CLREFLECTIONSYSTEM_H
#define CLREFLECTIONSYSTEM_H

#include "IMachineStorage.h"
#include "IMetaMachineRegister.h"
#include "CLMetaRegister.h"

#include <memory>

namespace CLReflect
{
    //! The CLReflect system.
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

        std::shared_ptr<CLMetaRegister> _metaStore;

    public:
        //! Singleton getter
        static CLReflectionSystem* getInstance();

        void setMachineStorage(std::shared_ptr<IMachineStorage> store) { _machineStore = store; }

        std::shared_ptr<IMachineStorage> getMachineStore() { return _machineStore; }

        std::shared_ptr<CLMetaRegister> getMetaStore() { return _metaStore; }

    };
}


#endif
