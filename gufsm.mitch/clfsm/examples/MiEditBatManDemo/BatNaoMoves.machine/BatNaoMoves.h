//
// BatNaoMoves.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__BatNaoMoves__
#define __clfsm__BatNaoMoves__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class BatNaoMoves: public CLMachine
        {
            CLState *_states[8];
        public:
            BatNaoMoves(int mid  = 0, const char *name = "BatNaoMoves");
            virtual ~BatNaoMoves();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "BatNaoMoves_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::BatNaoMoves *CLM_Create_BatNaoMoves(int mid, const char *name);
}

#endif // defined(__gufsm__BatNaoMoves__)
