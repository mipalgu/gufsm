#include <unistd.h>
#include <stdio.h>
#include "CPingPong.h"

void initial_OnEntry()
{
    counter = 0;
}

void ping_OnEntry()
{
    printf("C-Ping: %d\n", counter++);
}

void pong_OnEntry()
{
    printf("C-Pong: %d\n", counter++);
}

unsigned char ping_transition0()
{
    return counter < 5;
}

unsigned char ping_transition1()
{
    return counter >= 5;
}

unsigned char pong_transition0()
{
    return 1;
}
