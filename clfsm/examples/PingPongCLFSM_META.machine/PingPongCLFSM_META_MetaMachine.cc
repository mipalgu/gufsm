#include "PingPongCLFSM_META_MetaMachine.h"
#include "PingPongCLFSM_META_Properties.h"
#include "CLMetaState.h"

using namespace std;
using namespace FSM;
using namespace PingPongCLFSM_META_namespace;
using namespace CLReflect;


extern "C"
{

    CLMetaMachine* FSM::PingPongCLFSM_META_namespace::Create()
    {
        CLMetaMachine* meta = new CLMetaMachine("PingPongCLFSM_META", "PingPongCLFSM_META");

        //State creation
        shared_ptr<CLMetaState> state_1(new CLMetaState("Ping"));
        shared_ptr<CLMetaState> state_2(new CLMetaState("Pong"));

        //Property creation
        shared_ptr<Meta_Machine_currentState> property_0(new Meta_Machine_currentState());

        //Add machine properties
        meta->addProperty(property_0);

        //Add state properties

        //Add states to machine
        meta->addState(state_1);
        meta->addState(state_2);


        return meta;
    }
}
