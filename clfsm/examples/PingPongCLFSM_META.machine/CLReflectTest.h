#include "CLMetaMachine.h"

class PingPongCLFSM_META_Reflect : public CLReflect::CLMetaMachine
{
    public:
        PingPongCLFSM_META_Reflect();
};

extern "C"
{
    PingPongCLFSM_META_Reflect* Create();
}
