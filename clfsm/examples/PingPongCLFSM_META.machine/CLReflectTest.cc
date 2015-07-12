#include "CLReflectTest.h"

extern "C"
{
    PingPongCLFSM_META_Reflect* Create()
    {
        return new PingPongCLFSM_META_Reflect();
    }
}
