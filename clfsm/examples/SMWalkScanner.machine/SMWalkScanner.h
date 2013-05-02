//
// SMWalkScanner.h -- 2013-05-02 08:47:57 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMWalkScanner__
#define __clfsm__SMWalkScanner__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMWalkScanner: public CLMachine
        {
            CLState *_states[13];
        public:
            SMWalkScanner(int mid  = 0, const char *name = "SMWalkScanner");
            virtual ~SMWalkScanner();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 13; }
#           include "SMWalkScanner_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMWalkScanner *CLM_Create_SMWalkScanner(int mid, const char *name);
}

#endif // defined(__gufsm__SMWalkScanner__)
