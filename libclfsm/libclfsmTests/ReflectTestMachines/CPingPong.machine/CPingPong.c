#include <unistd.h>
#include <stdio.h>
#include "CPingPong.h"

void initial_OnEntry(CPingPong* machine)
{
    machine->counter = 0;
}

void ping_OnEntry(CPingPong* machine)
{
    printf("C-Ping: %d\n", machine->counter++);
}

void pong_OnEntry(CPingPong* machine)
{
    printf("C-Pong: %d\n",  machine->counter++);
}

unsigned char ping_transition0(CPingPong* machine)
{
    return machine->counter < 5;
}

unsigned char ping_transition1(CPingPong* machine)
{
    return machine->counter >= 5;
}

unsigned char pong_transition0(CPingPong* machine)
{
    return 1;
}
