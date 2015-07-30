#include "CLMachineRetriever.h"
#include "clfsm_vector_factory.h"

using namespace FSM;

void* CLMachineRetriever::getMachineWithName(const char *name)
{
    CLMachine* machine = NULL;
    int index = FSM::index_of_machine_named(name);
    if (index != -1)
        machine = FSM::machine_at_index(index);
    return static_cast<void*>(machine);
}
