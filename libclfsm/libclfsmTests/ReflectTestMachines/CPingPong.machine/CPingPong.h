#ifndef CPINGPONG_H
#define CPINGPONG_H

typedef struct
{
    unsigned int counter;
} CPingPong;


// On Entry action for initial state
void initial_OnEntry(CPingPong* machine);

// On Entry actions for Ping and Pong State
void ping_OnEntry(CPingPong* machine);

void pong_OnEntry(CPingPong* machine);

// Transition eval functions
unsigned char ping_transition0(CPingPong* machine);

unsigned char ping_transition1(CPingPong* machine);

unsigned char pong_transition0(CPingPong* machine);

#endif /* end of include guard: CPINGPONG_H */
