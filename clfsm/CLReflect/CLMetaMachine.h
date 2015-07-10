#ifndef CLMETAMACHINE_H
#define CLMETAMACHINE_H

#include <string>


namespace CLReflect
{
    class CLMetaMachine
    {
        protected:
            std::string _name;

        public:
            CLMetaMachine() {}

            std::string getName() const { return _name; }



    };
}



#endif
