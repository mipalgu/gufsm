#ifndef IMACHINESTORAGE_H
#define IMACHINESTORAGE_H

#include <memory>
#include <string>

#include "CLMachine.h"

namespace FSM
{
    namespace CLReflect
    {
        //! An interface for retrieving machine instances.
        class IMachineStorage
        {
            public:
                virtual CLMachine* getMachineByName(const std::string name) = 0;

            protected:
                virtual ~IMachineStorage() {}

        };
    }

}

#endif
