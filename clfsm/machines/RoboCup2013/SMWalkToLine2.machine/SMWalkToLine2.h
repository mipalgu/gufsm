//
// SMWalkToLine2.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMWalkToLine2__
#define __clfsm__SMWalkToLine2__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMWalkToLine2: public CLMachine
        {
            CLState *_states[7];
        public:
            SMWalkToLine2(int mid  = 0, const char *name = "SMWalkToLine2");
            virtual ~SMWalkToLine2();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "SMWalkToLine2_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMWalkToLine2 *CLM_Create_SMWalkToLine2(int mid, const char *name);
}

#endif // defined(__gufsm__SMWalkToLine2__)
