//
// SMTeleoperation.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMTeleoperation__
#define __clfsm__SMTeleoperation__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMTeleoperation: public CLMachine
        {
            CLState *_states[15];
        public:
            SMTeleoperation(int mid  = 0, const char *name = "SMTeleoperation");
            virtual ~SMTeleoperation();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 15; }
#           include "SMTeleoperation_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMTeleoperation *CLM_Create_SMTeleoperation(int mid, const char *name);
}

#endif // defined(__gufsm__SMTeleoperation__)
