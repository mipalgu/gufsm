#include "CLReflectTest.h"

extern "C"
{
    PingPongCLFSM_Reflect* Create()
    {
        return new PingPongCLFSM_Reflect();
    }
}
