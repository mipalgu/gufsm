#include "CLReflectAPI.h"

extern "C"
{
    refl_metaMachine Create_MetaMachine();
}

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m;
    refl_initMetaMachine(&m);
    return m;
}
