#ifndef CLMETAMACHINE_H
#define CLMETAMACHINE_H

#include "CLMetaState.h"
#include "CLMetaProperty.h"

#include <string>
#include <map>
#include <memory>
#include <vector>

namespace CLReflect
{
    class CLMetaMachine
    {
    private:
        std::string _name;
        std::string _type;

        std::map<std::string, std::shared_ptr<CLMetaProperty> > _properties;
        std::map<std::string, std::shared_ptr<CLMetaState> > _states;

    public:
        CLMetaMachine() {}

        CLMetaMachine(std::string name, std::string type) :
            _name(name), _type(type) {}

        std::string getType() const { return _type; }

        std::string getName() const { return _name; }

        void setName(std::string newName) { _name = newName; }

        std::shared_ptr<CLMetaProperty> getProperty(std::string propertyName);

        void addState(std::shared_ptr<CLMetaState> newState);

        std::shared_ptr<CLMetaState> getState(std::string stateName);

        std::vector< std::shared_ptr<CLMetaState> > getStates();

    };
}



#endif
