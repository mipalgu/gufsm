//
// State_Delete_Testfile.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_Suspend_State_Delete_Testfile_h
#define clfsm_Suspend_State_Delete_Testfile_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSuspend
      {
        namespace State
        {
            class Delete_Testfile: public CLState
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
                    Delete_Testfile(const char *name = "Delete_Testfile");
                    virtual ~Delete_Testfile();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Delete_Testfile_Variables.h"
            };
        }
      }
    }
}

#endif
