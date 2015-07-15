#ifndef STATE_PING_PROPERTIES_H
#define STATE_PING_PROPERTIES_H

#include <memory>
#include <string>


#include "PingPongCLFSM_META.h"
#include "State_Ping.h"
#include "CLMetaProperty.h"
#include "CLBoundProperty.h"

namespace FSM
{
    namespace PingPongCLFSM_META_namespace
    {
        class Bound_Ping_stateName : public CLReflect::CLBoundProperty
        {
        private:
            CLM::FSMPingPongCLFSM::State::Ping* _state;

        public:
            Bound_Ping_stateName(CLM::PingPongCLFSM_META* machine)
            {
                _state = dynamic_cast<CLM::FSMPingPongCLFSM::State::Ping*>(machine->state(0));
            }

            void setValue(std::string value)
            {
                _state->stateName = value.c_str();
            }

            std::string getValue()
            {
                return std::string(_state->stateName);
            }
        };

        class Meta_Ping_stateName : public CLReflect::CLMetaProperty
        {
        public:
            Meta_Ping_stateName() : CLMetaProperty("stateName", "const char *") {}

            std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)
            {
                CLM::PingPongCLFSM_META* castedMachine = dynamic_cast<CLM::PingPongCLFSM_META*>(machineInstance);
                if (castedMachine)
                    return std::shared_ptr<CLReflect::CLBoundProperty>(new Bound_Ping_stateName(castedMachine));
                else
                    return std::shared_ptr<CLReflect::CLBoundProperty>(NULL);
            }
        };
    }
}



#endif /* end of include guard: STATE_PING_PROPERTIES_H */
