#include "CLMetaRegister.h"

using namespace CLReflect;

CLMetaMachine CLMetaRegister::getMetaMachineWithName(std::string name)
{
    name = name; //XXX: stub
    CLMetaMachine machine = CLMetaMachine();
    return machine;
}

CLMetaMachine CLMetaRegister::getMetaMachineOfType(std::string type)
{
    type = type; //XXX: stub method
    CLMetaMachine machine = CLMetaMachine();
    return machine;
}

void CLMetaRegister::registerMachine(std::shared_ptr<CLMetaMachine> machine)
{
    machine = machine;
}
