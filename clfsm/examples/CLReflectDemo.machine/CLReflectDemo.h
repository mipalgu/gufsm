//
// CLReflectDemo.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__CLReflectDemo__
#define __clfsm__CLReflectDemo__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class CLReflectDemo: public CLMachine
        {
            CLState *_states[8];
        public:
            CLReflectDemo(int mid  = 0, const char *name = "CLReflectDemo");
            virtual ~CLReflectDemo();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "CLReflectDemo_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::CLReflectDemo *CLM_Create_CLReflectDemo(int mid, const char *name);
}

#endif // defined(__gufsm__CLReflectDemo__)
