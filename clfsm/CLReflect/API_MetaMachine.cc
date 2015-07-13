#include "CLReflect_API.h"

#include "CLReflectionSystem.h"

using namespace CLReflect;
using namespace std;

shared_ptr<CLMetaMachine> API::getMetaMachineWithName(string name)
{
    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    shared_ptr<CLMetaRegister> metaRegister = system->getMetaStore();
    return metaRegister->getMetaMachineWithName(name);
}

vector< shared_ptr<CLMetaState> > API::getStatesForMetaMachine(string name)
{
    vector<shared_ptr<CLMetaState>> states;

    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    shared_ptr<CLMetaRegister> metaRegister = system->getMetaStore();
    shared_ptr<CLMetaMachine> machine = metaRegister->getMetaMachineWithName(name);
    if (machine)
        states = machine->getStates();
    return states;
}
