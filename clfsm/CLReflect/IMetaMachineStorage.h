#ifndef IMETAMACHINESTORAGE_H
#define IMETAMACHINESTORAGE_H

#include <string>
#include <memory>

#include "CLMetaMachine.h"

namespace FSM
{
    namespace CLReflect
    {
        //! An Interface for the retrieval of meta machines
        class IMetaMachineStorage
        {
            virtual shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name) = 0;

            virtual shared_ptr<CLMetaMachine> getMetaMachineOfType(std::string type) = 0;

            virtual ~IMetaMachineStorage() {}
        };
    }
}


#endif
