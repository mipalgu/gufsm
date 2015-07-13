#ifndef CLREFLECT_API_H
#define CLREFLECT_API_H

#include "CLMetaMachine.h"
#include "IMachineStorage.h"

#include <memory>
#include <string>
#include <vector>

namespace CLReflect
{
    namespace API
    {
        // --------------------- Setup --------------------------//

        //! Initialises the reflection subsystem.
        void initialise(std::shared_ptr<IMachineStorage> machineStore);

        //! Registers a metamachine with the reflection system.
        void registerMachine(std::shared_ptr<CLMetaMachine> machine);

        // -------------------- MetaMachine --------------------//

        //! Gets a meta-machine with a given name
        std::shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name);

        //! Gets the states for the
        std::vector< std::shared_ptr<CLMetaState> > getStatesForMetaMachine(std::string name);

        //! Gets the required state from the given machine.
        std::shared_ptr<CLMetaState> getStateFromMachine(std::string stateName, std::string machineName);
        // --------------------- Execution ---------------------//

        //! Gets the currently executing state of the given machine
        std::shared_ptr<CLMetaState> getCurrentStateDefinition(std::string machineName);

    }
}

#endif
