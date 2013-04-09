//
// Safety_BatteryMonitor.h -- 2013-04-09 01:20:15 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__Safety_BatteryMonitor__
#define __clfsm__Safety_BatteryMonitor__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Safety_BatteryMonitor: public CLMachine
        {
            CLState *_states[3];
        public:
            Safety_BatteryMonitor(int mid  = 0, const char *name = "Safety_BatteryMonitor");
            virtual ~Safety_BatteryMonitor();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "Safety_BatteryMonitor_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Safety_BatteryMonitor *CLM_Create_Safety_BatteryMonitor(int mid, const char *name);
}

#endif // defined(__gufsm__Safety_BatteryMonitor__)
