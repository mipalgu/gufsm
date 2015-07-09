#ifndef CLMETAMACHINE_H
#define CLMETAMACHINE_H

#include <string>

namespace FSM
{
    namespace CLReflect
    {
        class CLMetaMachine
        {
            private:
                std::string _name;

            public:
                CLMetaMachine() {}

                std::string getName() const { return _name; }



        };
    }
}


#endif
