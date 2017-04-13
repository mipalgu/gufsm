#ifndef IMACHINESTORAGE_H
#define IMACHINESTORAGE_H

#include <memory>
#include <string>

#include "CLMachine.h"

namespace CLReflect
{
    //! An interface for retrieving machine instances.
    class IMachineStorage
    {
        public:
            virtual FSM::CLMachine* getMachineByName(const std::string name) = 0;

            virtual std::string getCurrentStateName(const std::string machineName) = 0;

        protected:
            virtual ~IMachineStorage() {}

    };
}

#endif
