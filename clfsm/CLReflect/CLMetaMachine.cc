#include "CLMetaMachine.h"

using namespace std;
using namespace CLReflect;

shared_ptr<CLMetaProperty> CLMetaMachine::getProperty(std::string propertyName)
{
    if (_properties.count(propertyName) == 1)
        return _properties[propertyName];
    else
        return shared_ptr<CLMetaProperty>(NULL);
}

void CLMetaMachine::addState(std::shared_ptr<CLMetaState> newState)
{
    _states[newState->getName()] = newState;
}
