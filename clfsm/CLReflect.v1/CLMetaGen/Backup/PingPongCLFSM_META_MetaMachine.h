#include "CLMetaMachine.h"

namespace FSM
{
    namespace PingPongCLFSM_META_namespace
    {
        extern "C"
        {
            CLReflect::CLMetaMachine* Create();
        }
    }
}
