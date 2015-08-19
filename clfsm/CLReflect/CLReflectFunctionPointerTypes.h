#ifndef CLREFLECTFUNCTIONPOINTERTYPES_H
#define CLREFLECTFUNCTIONPOINTERTYPES_H

#include <stdint.h>

// Typedefs

typedef void* refl_machine_t;
typedef void* refl_userData_t;
typedef unsigned char refl_bool;

#define refl_TRUE 1
#define refl_FALSE 0

// Function pointers

//! Gets a machine as a void pointer given its name
typedef void* (*getMachine_f)(const char*);

//! Typedef for a state action (internal, onExit etc)
typedef void (*refl_stateAction_f)(refl_machine_t, refl_userData_t);

typedef refl_bool (*refl_transitionEval_f)(refl_machine_t, refl_userData_t);


#endif /* end of include guard: CLREFLECTFUNCTIONPOINTERTYPES_H */
