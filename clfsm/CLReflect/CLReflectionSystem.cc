#include "CLReflectionSystem.h"

using namespace CLReflect;

static CLReflectionSystem* _instance;

CLReflectionSystem::CLReflectionSystem() {}

CLReflectionSystem* CLReflectionSystem::getInstance()
{
    if (_instance == NULL)
        _instance = new CLReflectionSystem();
    return _instance;
}

void CLReflectionSystem::registerMachine(std::shared_ptr<CLMetaMachine> machine)
{
    _metaStore.registerMachine(machine);
}

std::shared_ptr<CLMetaMachine> CLReflectionSystem::getMetaMachineWithName(std::string name)
{
    return _metaStore.getMetaMachineWithName(name);
}

std::shared_ptr<CLMetaMachine> CLReflectionSystem::getMetaMachineOfType(std::string type)
{
    return _metaStore.getMetaMachineOfType(type);
}
