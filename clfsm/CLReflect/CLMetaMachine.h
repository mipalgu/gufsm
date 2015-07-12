#ifndef CLMETAMACHINE_H
#define CLMETAMACHINE_H

#include "CLMetaState.h"
#include "CLMetaProperty.h"

#include <string>
#include <map>
#include <memory>

namespace CLReflect
{
    class CLMetaMachine
    {
    protected:
        std::string _name;
        std::string _type;

        std::map<std::string, std::shared_ptr<CLMetaProperty> > _properties;
        std::map<std::string, std::shared_ptr<CLMetaState> > _states;

    public:
        CLMetaMachine() = default;

        std::string getType() const { return _type; }

        std::string getName() const { return _name; }

        void setName(std::string newName) { _name = newName; }

        std::shared_ptr<CLMetaProperty> getProperty(std::string propertyName);

    };
}



#endif
