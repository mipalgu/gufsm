#ifndef PINGPONGCLFSM_META_PROPERTIES
#define PINGPONGCLFSM_META_PROPERTIES

#include "PingPongCLFSM.h"

#include "CLMetaProperty.h"
#include "CLBoundProperty.h"

namespace FSM
{
    namespace PingPongCLFSM_META_namespace
    {
        class Meta_Machine_currentState : public CLMetaProperty
        {
        public:
            Meta_Machine_currentState() : CLMetaProperty("currentState", "int") {}


        };

        class Bound_Machine_currentState : public CLBoundProperty
        {
        private:
            PingPongCLFSM_META* _machine;

        public:
            Bound_Machine_currentState(FSM::PingPongCLFSM_META* machine) _machine(machine) {}
        };
    }
}

#endif /* end of include guard: PINGPONGCLFSM_META_PROPERTIES */
