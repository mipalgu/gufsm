#include "CLReflect_API.h"

#include "CLReflectionSystem.h"


using namespace CLReflect;

void API::initialise(std::shared_ptr<IMachineStorage> machineStore)
{
    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    system->setMachineStorage(machineStore);

}

void API::registerMachine(std::shared_ptr<CLMetaMachine> machine)
{
    CLReflectionSystem *system = CLReflectionSystem::getInstance();
    CLMetaRegister _metaRegister = system->getMetaStore();
    _metaRegister.registerMachine(machine);
}
