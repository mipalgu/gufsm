#ifndef CLREFLECT_API_H
#define CLREFLECT_API_H

#include "CLMetaMachine.h"
#include "IMachineStorage.h"

#include <memory>
#include <string>

namespace CLReflect
{
    namespace API
    {
        //! Initialises the reflection subsystem.
        void initialise(std::shared_ptr<IMachineStorage> machineStore);

        //! Registers a metamachine with the reflection system.
        void registerMachine(std::shared_ptr<CLMetaMachine> machine);
    }
}

#endif
