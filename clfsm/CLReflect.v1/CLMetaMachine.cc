#include "CLMetaMachine.h"

using namespace std;
using namespace CLReflect;

void CLMetaMachine::addProperty(std::shared_ptr<CLMetaProperty> newProperty)
{
    string name = newProperty->getName();
    _properties[name] = newProperty;
}

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

std::shared_ptr<CLMetaState> CLMetaMachine::getState(std::string stateName)
{
    if (_states.count(stateName) == 1)
        return _states[stateName];
    else
        return shared_ptr<CLMetaState>(NULL);
}

vector< shared_ptr<CLMetaState> > CLMetaMachine::getStates()
{
    vector<std::shared_ptr<CLMetaState> > allStates;
    for (map<string, shared_ptr<CLMetaState> >::iterator it = _states.begin();
            it != _states.end(); it++)
    {
        allStates.push_back(it->second);
    }
    return allStates;
}
