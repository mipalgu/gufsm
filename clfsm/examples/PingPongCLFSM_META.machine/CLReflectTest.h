#include "CLMetaMachine.h"

class PingPongCLFSM_META_Reflect : public CLReflect::CLMetaMachine
{
    public:
        PingPongCLFSM_META_Reflect() { _name = "PingPongCLFSM_META"; }
};

extern "C"
{
    PingPongCLFSM_META_Reflect* Create();
}
