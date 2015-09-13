#include <unistd.h>
#include <stdio.h>
#include "CPingPong.h"

void initial_OnEntry()
{
    counter = 0;
}

void ping_OnEntry()
{
    printf("Ping: %d\n", counter++);
    sleep(1);
}

void pong_OnEntry()
{
    printf("Pong: %d\n", counter++);
    sleep(1);
}

unsigned char ping_transition0()
{
    if (counter < 5)
        return 1;
    else
        return 0;
}

unsigned char pong_transition0()
{
    if (counter < 5)
        return 1;
    else
        return 0;
}
