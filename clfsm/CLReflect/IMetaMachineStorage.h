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
        virtual std::shared_ptr<CLMetaMachine> getMetaMachineWithName(std::string name) = 0;

        virtual std::shared_ptr<CLMetaMachine> getMetaMachineOfType(std::string type) = 0;

        IMetaMachineStorage() = default;
        IMetaMachineStorage(IMetaMachineStorage const &) = default;

    protected:
        virtual ~IMetaMachineStorage() {}
    };
}



#endif
