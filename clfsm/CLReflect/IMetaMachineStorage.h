#ifndef IMETAMACHINESTORAGE_H
#define IMETAMACHINESTORAGE_H

#include <string>

#include "CLMetaMachine.h"

namespace FSM
{
    namespace CLReflect
    {
        //! An Interface for the retrieval of meta machines
        class IMetaMachineStorage
        {
            virtual CLMetaMachine* getMetaMachineNamed(std::string name) = 0;

            virtual ~IMetaMachineStorage() {}
        };
    }
}


#endif
