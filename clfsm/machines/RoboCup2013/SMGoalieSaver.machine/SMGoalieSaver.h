//
// SMGoalieSaver.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMGoalieSaver__
#define __clfsm__SMGoalieSaver__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMGoalieSaver: public CLMachine
        {
            CLState *_states[14];
        public:
            SMGoalieSaver(int mid  = 0, const char *name = "SMGoalieSaver");
            virtual ~SMGoalieSaver();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 14; }
#           include "SMGoalieSaver_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMGoalieSaver *CLM_Create_SMGoalieSaver(int mid, const char *name);
}

#endif // defined(__gufsm__SMGoalieSaver__)
