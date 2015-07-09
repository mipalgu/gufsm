#ifndef IMETAMACHINESTORAGE_H
#define IMETAMACHINESTORAGE_H

#include <string>
#include <memory>

#include "CLMetaMachine.h"


namespace CLReflect
{
    //! An Interface for the retrieval of meta machines
    class IMetaMachineStorage
    {
    public:
        virtual CLMetaMachine getMetaMachineWithName(std::string name) = 0;

        virtual CLMetaMachine getMetaMachineOfType(std::string type) = 0;

        virtual ~IMetaMachineStorage() {}
    };
}



#endif
