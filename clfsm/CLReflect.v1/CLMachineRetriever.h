#ifndef CLMACHINERETRIEVER_H
#define CLMACHINERETRIEVER_H

#include "IMachineStorage.h"

namespace CLReflect
{
    //! Mediates between between CLReflect and CLFSM
    class CLMachineRetriever : public IMachineStorage
    {
    public:
        CLMachineRetriever() {}

        virtual ~CLMachineRetriever() {}

        // ----- INTERFACE METHODS -------//

        FSM::CLMachine* getMachineByName(const std::string name);

        std::string getCurrentStateName(const std::string machineName);
    };
}


#endif
