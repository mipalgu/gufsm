/*!
    @file API_Util.c
*/

#include "API_Util.h"

#include <stdlib.h>
#include <string.h>

CLReflectResult refl_strcpy(char* dest, char const * src, size_t size)
{
    if (!dest || !src)
    {
        return REFL_INVALID_ARGS;
    }
    unsigned int srclength = (unsigned int)strlen(src) + 1;

    if (srclength > size)
    {
        return REFL_BUFFER_OVERFLOW;
    }
    else
    {
        memcpy(dest, src, srclength);
        return REFL_SUCCESS;
    }
}
