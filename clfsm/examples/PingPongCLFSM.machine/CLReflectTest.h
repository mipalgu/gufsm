#include "CLMetaMachine.h"

class PingPongCLFSM_Reflect : public CLReflect::CLMetaMachine
{
    public:
        PingPongCLFSM_Reflect() { _name = "PingPongCLFSM"; }
};

extern "C"
{
    PingPongCLFSM_Reflect* Create();
}
