#ifndef CLMACHINERETRIEVER_H
#define CLMACHINERETRIEVER_H

#include "CLReflectIncludes.h"
#include "clfsm_vector_factory.h"

//! Static class used to get a machine from the vector given its name.
//! Used for the reflection library.
namespace CLMachineRetriever
{
    void* getMachineWithName(const char* name);
}

#endif /* end of include guard: CLMACHINERETRIEVER_H */
