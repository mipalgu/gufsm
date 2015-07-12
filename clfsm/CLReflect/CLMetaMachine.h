#ifndef CLMETAMACHINE_H
#define CLMETAMACHINE_H

#include <string>


namespace CLReflect
{
    class CLMetaMachine
    {
        protected:
            std::string _name;
            std::string _type;

        public:
            CLMetaMachine() {}

            std::string getType() const { return _type; }

            std::string getName() const { return _name; }

            void setName(std::string newName) { _name = newName; }



    };
}



#endif
