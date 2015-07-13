#ifndef PINGPONGCLFSM_META_PROPERTIES
#define PINGPONGCLFSM_META_PROPERTIES

#include <memory>
#include <string>

#include "PingPongCLFSM.h"
#include "CLMetaProperty.h"
#include "CLBoundProperty.h"

namespace FSM
{
    namespace PingPongCLFSM_META_namespace
    {
        class Bound_Machine_currentState : public CLReflect::CLBoundProperty
        {
        private:
            CLM::PingPongCLFSM_META* _machine;

        public:
            Bound_Machine_currentState(CLM::PingPongCLFSM_META* machine) : _machine(machine) {}

            void setValue(std::string value)
            {
                _machine->currentState = (int)value[0];
            }

            std::string getValue()
            {
                return std::to_string(_machine->currentState);
            }

        };

        class Meta_Machine_currentState : public CLReflect::CLMetaProperty
        {
        public:
            Meta_Machine_currentState() : CLMetaProperty("currentState", "int") {}

            std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)
            {
                CLM::PingPongCLFSM_META* castedMachine = dynamic_cast<CLM::PingPongCLFSM_META*>(machineInstance);
                if (castedMachine)
                    return std::shared_ptr<CLReflect::CLBoundProperty>(new Bound_Machine_currentState(castedMachine));
                else
                    return std::shared_ptr<CLReflect::CLBoundProperty>(NULL);
            }

        };


    }
}

#endif /* end of include guard: PINGPONGCLFSM_META_PROPERTIES */
