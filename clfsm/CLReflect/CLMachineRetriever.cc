#include "CLMachineRetriever.h"
#include "clfsm_wb_vector_factory.h"

using namespace std;
using namespace FSM;

namespace CLReflect
{
    CLMachine* CLMachineRetriever::getMachineByName(const string name)
    {
        CLMachine* machine = NULL;
        int index = FSM::index_of_machine_named(name.c_str());
        if (index != -1)
            machine = FSM::machine_at_index(index);
        return machine;
    }
}
