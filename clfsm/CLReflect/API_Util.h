/*!
    @file API_Util.h
*/

#ifndef API_UTIL_H
#define API_UTIL_H

#include <stdlib.h>

#include "API_Result.h"

/*!
    Copies a string, including the null terminating character.
    @param dest The destination string.
    @param src The source string
    @param size The length of the /p dest buffer.
    @return REFL_SUCCESS if all goes well.
            REFL_BUFFER_OVERFLOW if dest is too small.
*/
CLReflectResult refl_strcpy(char* dest, char const * src, size_t size);

#endif /* end of include guard: API_UTIL_H */
