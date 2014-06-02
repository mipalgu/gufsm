//
// FallManager.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__FallManager__
#define __clfsm__FallManager__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class FallManager: public CLMachine
        {
            CLState *_states[7];
        public:
            FallManager(int mid  = 0, const char *name = "FallManager");
            virtual ~FallManager();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "FallManager_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::FallManager *CLM_Create_FallManager(int mid, const char *name);
}

#endif // defined(__gufsm__FallManager__)
