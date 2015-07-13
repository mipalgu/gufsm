#include "PingPongCLFSM_META_MetaMachine.h"

#include "CLMetaState.h"

using namespace std;
using namespace CLReflect;

extern "C"
{
    CLMetaMachine* Create()
    {
        CLMetaMachine* meta = new CLMetaMachine("PingPongCLFSM_META", "PingPongCLFSM_META");

        //State creation
        std::shared_ptr<CLMetaState> state_1(new CLMetaState("Ping"));
        meta->addState(state_1);

        std::shared_ptr<CLMetaState> state_2(new CLMetaState("Pong"));
        meta->addState(state_2);


        return meta;
    }
}
