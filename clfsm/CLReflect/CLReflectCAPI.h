#ifndef CLREFLECTCAPI_H
#define CLREFLECTCAPI_H

#include "CLReflectCTypes.h"

namespace FSM
{
    namespace CLReflect
    {
        extern "C"
        {
            int getPropertiesForMachine(const char *machineName,
                                clproperty_t* propertyBuffer, int bufferLen);
        }
    }
}

#endif
