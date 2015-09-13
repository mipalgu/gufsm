#include "CPingPong.h"
#include "CLReflectAPI.h"


refl_metaMachine Create_MetaMachine();

refl_metaMachine Create_MetaMachine()
{
    refl_metaMachine m = refl_initMetaMachine(NULL);
    return m;
}
