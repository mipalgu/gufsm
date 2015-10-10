#include <unistd.h>
#include <stdio.h>
#include "CPingPongKripke.h"

void ping_OnEntry(CPingPongKripke* machine)
{
    printf("C-Ping: %c\n", machine->b);
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
