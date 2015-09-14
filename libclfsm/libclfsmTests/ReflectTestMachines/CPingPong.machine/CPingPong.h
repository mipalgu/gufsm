#ifndef CPINGPONG_H
#define CPINGPONG_H

// FSM variables
unsigned int counter;

// On Entry action for initial state
void initial_OnEntry();

// On Entry actions for Ping and Pong State
void ping_OnEntry();

void pong_OnEntry();

// Transition eval functions
unsigned char ping_transition0();

unsigned char ping_transition1();

unsigned char pong_transition0();

#endif /* end of include guard: CPINGPONG_H */
