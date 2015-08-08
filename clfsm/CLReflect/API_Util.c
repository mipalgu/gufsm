#include "API_Util.h"

#include <stdlib.h>
#include <string.h>

CLReflectResult refl_strcpy(char* dest, char* src, size_t size)
{
    if (!dest || !src)
    {
        return REFL_INVALID_ARGS;
    }
    unsigned int srclength = strlen(src) + 1;
    if (srclength > size)
    {
        return REFL_BUFFER_OVERFLOW;
    }
    memcpy(dest, src, size);
    return REFL_SUCCESS;
}
