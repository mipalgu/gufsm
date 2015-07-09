#ifndef CLMETASTATE_H
#define CLMETASTATE_H

#include "CLMetaMachine.h"

namespace CLReflect
{
    class CLMetaState
    {
        private:
            std::string _name;

        public:
            std::string getName() const { return _name };
    };
}


#endif
