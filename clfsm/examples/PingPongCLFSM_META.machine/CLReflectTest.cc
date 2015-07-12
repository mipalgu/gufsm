#include "CLReflectTest.h"

PingPongCLFSM_META_Reflect::PingPongCLFSM_META_Reflect()
{
    _name = _type = "PingPongCLFSM_META";
}


extern "C"
{
    PingPongCLFSM_META_Reflect* Create()
    {
        return new PingPongCLFSM_META_Reflect();
    }
}
