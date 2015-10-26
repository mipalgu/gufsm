/*!
    @file API_MetaProperty.h
*/

#ifndef API_METAPROPERTY_H
#define API_METAPROPERTY_H

#include <stdlib.h>

#include "API_Result.h"
#include "API_Type.h"
#include "CLReflectFunctionPointerTypes.h"

struct metaProperty_s;
typedef struct metaProperty_s* refl_metaProperty;

/*!
    Initialises and allocates memory for the meta property
    @param result The result of the call.
*/
refl_metaProperty refl_initMetaProperty(CLReflectResult *result);

/*!
    Destroys the meta property
    @param result The result of the call.
*/
void refl_destroyMetaProperty(refl_metaProperty metaProperty, CLReflectResult *result);

/*!
    Sets the meta-property's name
    @name The name of the meta-property. Caller does not need to retain name memory.
    @param result The result of the call.
*/
void refl_setMetaPropertyName(refl_metaProperty metaProperty, char const * name, CLReflectResult* result);

/*!
    Returns a pointer to the meta property's name
    @param result The result of the call.
    @return A pointer to the meta-property name
*/
char const * refl_getMetaPropertyName(refl_metaProperty metaProperty, CLReflectResult* result);

/*!
    Sets the meta-property's string representation of its type e.g. "int" or "char *"
    @param type The name of the meta-property. Caller does not need to retain name memory.
    @param result The result of the call.
*/
void refl_setMetaPropertyTypeString(refl_metaProperty metaProperty, char const * type, CLReflectResult* result);

/*!
    Returns a pointer to the meta property's type as a string
    @param result The result of the call.
    @return A pointer to the meta-property type as a string.
*/
char const * refl_getMetaPropertyTypeAsString(refl_metaProperty metaProperty, CLReflectResult* result);

/*!
    Sets the meta-property's type according to the refl_type enum e.g. REFL_INT or REFL_DOUBLE etc.
    @param type The type of the property
    @param result The result of the call.
*/
void refl_setMetaPropertyType(refl_metaProperty metaProperty, refl_type type, CLReflectResult* result);

/*!
    Returns the meta property's type
    @param result The result of the call.
    @return The meta property's type
*/
refl_type refl_getMetaPropertyType(refl_metaProperty metaProperty, CLReflectResult* result);

/*!
    Returns whether the meta-property is unsigned e.g. unsigned int.
    @param result The result of the call.
    @return True if the property is unsigned, else false.
*/
refl_bool refl_isMetaPropertyUnsigned(refl_metaProperty metaProperty, CLReflectResult *result);

/*!
    Sets whether the meta-property is unsigned e.g. unsigned int.
    @param result The result of the call.
    @param isUS refl_true or refl_false based on whether the property is unsigned or not.
*/
void refl_setIsMetaPropertyUnsigned(refl_metaProperty metaProperty, refl_bool isUS, CLReflectResult *result);

/*!
    Returns the level of indirection of the variable e.g. char * = 1, char ** = 2.
    @param result The result of the call.
    @return The meta-property's level of indirection.
*/
unsigned int refl_getMetaPropertyIndirection(refl_metaProperty metaProperty, CLReflectResult *result);

/*!
    Sets the meta-property's level of indirection.
    @param result The result of the call.
    @param level The level of indirection i.e. how many pointers.
*/
void refl_setMetaPropertyIndirection(refl_metaProperty metaProperty, unsigned int level,  CLReflectResult *result);

/*!
    Sets the meta-property's data that is provided as a parameter in its call-back functions.
    @param result The result of the call.
    @param data A pointer to a piece of user data.
*/
void refl_setMetaPropertyData(refl_metaProperty metaProperty, refl_userData_t data, CLReflectResult *result);

/*!
    Sets the meta-property's call-back functions for string read/write
    @param getter The read call-back function
    @param setter The write call-back function.
    @param result The result of the call.
*/
void refl_setMetaPropertyStringFunctions(refl_metaProperty metaProperty,
        refl_getValueAsString_f getter, refl_setValueAsString_f setter, CLReflectResult* result);

/*!
    Sets the meta-property's call-back functions for void * read/write
    @param getter The read call-back function
    @param setter The write call-back function.
    @param result The result of the call.
*/
void refl_setMetaPropertyVoidFunctions(refl_metaProperty metaProperty,
        refl_getValueAsVoid_f getter, refl_setValueAsVoid_f setter, CLReflectResult* result);
#endif /* end of include guard: API_METAPROPERTY_H */
