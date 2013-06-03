//
// SMFallManager.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__SMFallManager__
#define __clfsm__SMFallManager__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SMFallManager: public CLMachine
        {
            CLState *_states[5];
        public:
            SMFallManager(int mid  = 0, const char *name = "SMFallManager");
            virtual ~SMFallManager();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SMFallManager_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SMFallManager *CLM_Create_SMFallManager(int mid, const char *name);
}

#endif // defined(__gufsm__SMFallManager__)
