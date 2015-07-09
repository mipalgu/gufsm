#ifndef CLREFLECTIONSYSTEM_H
#define CLREFLECTIONSYSTEM_H

#include "IMachineStorage.h"
#include "IMetaMachineRegister.h"
#include "CLMetaRegister.h"

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

            std::shared_ptr<IMachineStorage> _machineStore;

            CLMetaRegister _metaStore;

        public:
            virtual ~CLReflectionSystem();

            //! Singleton getter
            CLReflectionSystem* getInstance();

            //! IMetaMachineRegister interface method
            virtual void registerMachine(std::shared_ptr<CLMetaMachine> machine);

            void setMachineStorage(std::shared_ptr<IMachineStorage> store) { _machineStore = store; }



        };
    }
}

#endif
