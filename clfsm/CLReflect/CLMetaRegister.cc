#include "CLMetaRegister.h"

using namespace CLReflect;

std::shared_ptr<CLMetaMachine> CLMetaRegister::getMetaMachineWithName(std::string name)
{
    if (_metaRegistry.count(name) == 1)
        return _metaRegistry[name];
    else
        return std::shared_ptr<CLMetaMachine>(NULL);
}

std::shared_ptr<CLMetaMachine> CLMetaRegister::getMetaMachineOfType(std::string type)
{
    type = type; //XXX: stub method
    std::shared_ptr<CLMetaMachine> machine(new CLMetaMachine);
    return machine;
}

void CLMetaRegister::registerMachine(std::shared_ptr<CLMetaMachine> machine)
{
    std::string machName = machine->getName();
    _metaRegistry[machName] = machine;
}
