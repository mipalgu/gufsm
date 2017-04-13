/*!
    @file API_TypeConversion_Vector.h
*/

#ifndef API_TYPECONVERSION_VECTOR_H
#define API_TYPECONVERSION_VECTOR_H

extern "C"
{
    #include "API_MetaMachine.h"
    #include "API_MetaProperty_Access.h"
    #include "CLReflectFunctionPointerTypes.h"
}
#include <vector>

template<class T>
std::vector<T> refl_getAsVectorOf(refl_metaProperty p, refl_machine_t mach, CLReflectResult *result)
{
    void * value = _refl_getPropertyAsVoid(p, mach, result);
    return *static_cast<std::vector<T>*>(value);
}

#endif /* end of include guard: API_TYPECONVERSION_VECTOR_H */
