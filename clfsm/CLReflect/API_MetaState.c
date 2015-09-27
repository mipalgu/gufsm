#include "API_MetaState.h"
#include "API_MetaAction.h"
#include "API_MetaMachine_Internal.h"
#include "API_Util.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wbuiltin-requires-header"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#pragma clang diagnostic pop

//! Initialises the meta state
refl_metaState refl_initMetaState(CLReflectResult *result)
{
    refl_metaState newMetaState = (refl_metaState)malloc(sizeof(struct metaState_s));
    if (newMetaState != NULL)
    {
        newMetaState->name = NULL;
        newMetaState->numberOfTransitions = 0;
        newMetaState->transitions = NULL;
        newMetaState->onEntry = NULL;
        newMetaState->internal = NULL;
        newMetaState->onExit = NULL;
        newMetaState->numberOfProperties = 0;
        newMetaState->metaProperties = NULL;
        if (result)
            *result = REFL_SUCCESS;
        return newMetaState;
    }
    else
    {
        if (result)
            *result = REFL_UNKNOWN_ERROR;
        return NULL;
    }

}

//! Destroys the meta-state
void refl_destroyMetaState(refl_metaState metaState, CLReflectResult* result)
{
    if (metaState)
    {
        free(metaState->name);

        refl_destroyMetaAction(metaState->onEntry, NULL);
        refl_destroyMetaAction(metaState->internal, NULL);
        refl_destroyMetaAction(metaState->onExit, NULL);
        unsigned int i;
        for (i = 0; i < metaState->numberOfTransitions; i++)
        {
            refl_destroyMetaTransition(metaState->transitions[i], NULL);
        }
        free(metaState);
        if (result)
            *result = REFL_SUCCESS;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
    }

}

//! Sets the state name
void refl_setMetaStateName(refl_metaState metaState, char const * name, CLReflectResult* result)
{
    if (!metaState || !name)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        free(metaState->name); // Free the old machine name. Guaranteed heap mem.
        int len = (int)strlen(name) + 1;
        metaState->name = (char *)malloc(sizeof(char) *  len);
        CLReflectResult res;
        if (metaState->name == NULL)
        {
            res = REFL_UNKNOWN_ERROR;
        }
        else
        {
            res = refl_strcpy(metaState->name, name, len);
        }
        if (result)
            *result = res;
    }
}

//! Gets the state name
const char* refl_getMetaStateName(refl_metaState metaState, CLReflectResult *result)
{
    if (!metaState || !metaState->name)
    {
        if (result)
            *result = REFL_INVALID_ARGS; //name has not been set
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaState->name;
    }
}

//! Sets the OnEntry function
void refl_setOnEntry(refl_metaState metaState, refl_metaAction action, CLReflectResult *result)
{
    if (!metaState || !action)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaState->onEntry = action;
        if (result)
            *result = REFL_SUCCESS;

    }
}

void refl_setInternal(refl_metaState metaState, refl_metaAction action, CLReflectResult *result)
{
    if (!metaState || !action)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaState->internal = action;
        if (result)
            *result = REFL_SUCCESS;

    }
}

void refl_setOnExit(refl_metaState metaState, refl_metaAction action, CLReflectResult *result)
{
    if (!metaState || !action)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        metaState->onExit = action;
        if (result)
            *result = REFL_SUCCESS;

    }
}


void refl_setMetaTransitions(refl_metaState metaState, refl_metaTransition* transitions, unsigned int len, CLReflectResult* result)
{
    if (!metaState || (!transitions && len) || (transitions && !len)) //Can have null states if len = 0
    {
        if (result)
            *result = REFL_INVALID_ARGS;
    }
    else
    {
        if (len != 0)
        {
            free(metaState->transitions);
            metaState->transitions = (refl_metaTransition*)
                            malloc(sizeof(refl_metaTransition) * len);
            memcpy(metaState->transitions, transitions,
                        sizeof(refl_metaState) * len);
        }
        metaState->numberOfTransitions = len;
        if (result)
            *result = REFL_SUCCESS;
    }
}

unsigned int refl_getNumberOfTransitions(refl_metaState metaState, CLReflectResult* result)
{
    if (!metaState)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return 0;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaState->numberOfTransitions;
    }

}

refl_metaTransition const * refl_getMetaTransitions(refl_metaState metaState, CLReflectResult* result)
{
    if (!metaState)
    {
        if (result)
            *result = REFL_INVALID_ARGS;
        return NULL;
    }
    else
    {
        if (result)
            *result = REFL_SUCCESS;
        return metaState->transitions;
    }
}
