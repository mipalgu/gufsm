#include "CLReflect_API.h"

#include "CLReflectionSystem.h"


using namespace CLReflect;
using namespace std;

void API::initialise(shared_ptr<IMachineStorage> machineStore)
{
    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    system->setMachineStorage(machineStore);

}

void API::registerMachine(shared_ptr<CLMetaMachine> machine)
{
    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    shared_ptr<CLMetaRegister> metaRegister = system->getMetaStore();
    metaRegister->registerMachine(machine);
}
