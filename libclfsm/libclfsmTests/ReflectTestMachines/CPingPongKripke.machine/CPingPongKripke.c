#include <unistd.h>
#include <stdio.h>
#include "CPingPongKripke.h"

void ping_OnEntry(CPingPongKripke* machine)
{
    machine->b = 0;
    printf("C-Ping: %d\n", machine->b);
}

void ping_Internal(CPingPongKripke* machine)
{
    machine->b = !machine->b;
}

void pong_OnEntry(CPingPongKripke* machine)
{
    printf("C-Pong: %d\n",  machine->b);
}

unsigned char ping_transition0(CPingPongKripke* machine)
{
    return machine->b;
}

unsigned char pong_transition0(CPingPongKripke* machine)
{
    (void)machine;
    return 1;
}
