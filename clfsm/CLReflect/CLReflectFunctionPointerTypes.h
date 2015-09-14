#ifndef CLREFLECTFUNCTIONPOINTERTYPES_H
#define CLREFLECTFUNCTIONPOINTERTYPES_H

#include <stdint.h>
#include <stdlib.h>

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
typedef refl_stateAction_f refl_destuctor_f;

//! Evaluation transition function type
typedef refl_bool (*refl_transitionEval_f)(refl_machine_t, refl_userData_t);

//! Get current state function type
typedef int (*refl_getCurrentState_f)(refl_machine_t, refl_userData_t);

//! Get property as void *
typedef void* (*refl_getValueAsVoid_f)(refl_machine_t, refl_userData_t);

//! Get property as string
typedef char * (*refl_getValueAsString_f) (refl_machine_t, refl_userData_t, char *, unsigned int);

//! Set property as void*
typedef void (*refl_setValueAsVoid_f) (refl_machine_t, refl_userData_t, void*, size_t);

typedef void (*refl_setValueAsString_f) (refl_machine_t, refl_userData_t,  char *);

#endif /* end of include guard: CLREFLECTFUNCTIONPOINTERTYPES_H */
