#include "CLReflect_API.h"

#include "CLReflectionSystem.h"
#include "CLMachine.h"
#include "CLState.h"
#include "FSMachine.h"

using namespace std;
using namespace CLReflect;

shared_ptr<CLMetaState> API::getCurrentStateDefinition(string machineName)
{
    CLReflectionSystem *sys = CLReflectionSystem::getInstance();
    shared_ptr<IMachineStorage> machineStore = sys->getMachineStore();
    FSM::CLMachine* machine = machineStore->getMachineByName(machineName);
    if (!machine) return shared_ptr<CLMetaState>(nullptr);

    FSM::Machine* context = machine->machineContext();
    const char* currState_c = machine->state(context->currentStateID())->name();
    string currentStateName(currState_c);
    shared_ptr<CLMetaState> currentState = API::getStateFromMachine(currentStateName, machineName);
    return currentState;
}
