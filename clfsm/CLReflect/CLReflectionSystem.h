#ifndef CLREFLECTIONSYSTEM_H
#define CLREFLECTIONSYSTEM_H

#include "IMachineStorage.h"
#include "IMetaMachineRegister.h"
#include "IMetaRegister.h"

#include <memory>

namespace FSM
{
    namespace CLReflect
    {
        //! The C++ API for CLReflect
        /*!
            Implemented as a singleton since it needs to hold references
            to the CLFSM machine storage and meta machine register
        */
        class CLReflectionSystem : public IMetaMachineRegister
        {
        private:
            //! Private constructor for the singleton pattern
            CLReflectionSystem();

            IMachineStorage _machineStore;

            IMetaRegister _metaStore;

        public:
            //! Singleton getter
            CLReflectionSystem* getInstance();

            //! IMetaMachineRegister interface method
            virtual void register(shared_ptr<CLMetaMachine> machine);

            void setMachineStorage(IMachineStorage store) { _machineStore = store }



        };
    }
}

#endif
