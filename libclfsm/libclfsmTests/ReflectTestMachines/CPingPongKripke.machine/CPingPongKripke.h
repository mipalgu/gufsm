#ifndef CPINGPONG_H
#define CPINGPONG_H

typedef struct
{
    unsigned char b;
} CPingPongKripke;


// On Entry actions for Ping and Pong State
void ping_OnEntry(CPingPongKripke* machine);

void pong_OnEntry(CPingPongKripke* machine);

//Internal action for Ping
void ping_Internal(CPingPongKripke* machine);

// Transition eval functions
unsigned char ping_transition0(CPingPongKripke* machine);

unsigned char pong_transition0(CPingPongKripke* machine);

#endif /* end of include guard: CPINGPONG_H */
