#ifndef CLREFLECTFUNCTIONPOINTERTYPES_H
#define CLREFLECTFUNCTIONPOINTERTYPES_H

// Function pointers

//! Gets a machine as a void pointer given its name
typedef void* (*getMachine_f)(const char*);

//! Typedef for a state action (internal, onExit etc)
typedef void (*refl_stateAction_f)(void*, void*);

// Typedefs

typedef void* machine_t;
typedef void* userData_t;

#endif /* end of include guard: CLREFLECTFUNCTIONPOINTERTYPES_H */
