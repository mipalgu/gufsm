#ifndef TYPE_H
#define TYPE_H

#include <string>

namespace FSM
{
    class Type
    {
        private:
            const std::string _name;

        public:
            Type(const std::string typeName) : _name(typeName) {};

            virtual ~Type() {};

            const std::string name() { return _name ;};
    };
}


#endif
