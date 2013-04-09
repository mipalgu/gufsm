//
// State_Get_Data.h -- 2013-04-09 01:20:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_State_Get_Data_h
#define clfsm_State_Get_Data_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
        namespace State
        {
            class Get_Data: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 2): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Get_Data(const char *name = "Get_Data");
                    virtual ~Get_Data();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Get_Data_Variables.h"
            };
        }
    }
}

#endif
