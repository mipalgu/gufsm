#ifndef CLMACHINERETRIEVER_H
#define CLMACHINERETRIEVER_H

#include "IMachineStorage.h"

namespace FSM
{
    namespace CLReflect
    {
        class CLMachineRetriever : public IMachineStorage
        {
            CLMachine* getMachineByName(const std::string name);
        };
    }
}

#endif
