#include "PingPongCLFSM_META_MetaMachine.h"

#include "CLMetaState.h"

using namespace std;
using namespace FSM;
using namespace CLReflect;


extern "C"
{

    CLReflect::CLMetaMachine* FSM::PingPongCLFSM_META_namespace::Create()
    {
        CLMetaMachine* meta = new CLMetaMachine("PingPongCLFSM_META", "PingPongCLFSM_META");

        //State creation
        std::shared_ptr<CLMetaState> state_1(new CLMetaState("Ping"));
        std::shared_ptr<CLMetaState> state_2(new CLMetaState("Pong"));

        //Property creation


        //Add properties to states

        //Add states to machine
        meta->addState(state_1);
        meta->addState(state_2);


        return meta;
    }
}
