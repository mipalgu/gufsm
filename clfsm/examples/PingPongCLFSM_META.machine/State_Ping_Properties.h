#ifndef STATE_PING_PROPERTIES
#define STATE_PING_PROPERTIES

// Created with CLMetaGen. Do not modify.


#include "PingPongCLFSM_META.h"
#include <cstdlib>
#include "CLBoundProperty.h"
#include <string>
#include <memory>
#include <sstream>
#include <unistd.h>
#include "CLMetaMachine.h"
#include "State_Ping.h"
#include "CLReflect_API.h"
#include <vector>
#include "CLMetaProperty.h"

namespace FSM
{
	namespace PingPongCLFSM_META_namespace
	{
		// Bound Property: stateName
		class Bound_Ping_stateName : public CLReflect::CLBoundProperty
		{
		private:
			CLM::PingPongCLFSM_META* _machine;

		public:
			Bound_Ping_stateName(CLM::PingPongCLFSM_META* machine) : _machine(machine) {}

			std::string getValue()
			{
				return std::string(((FSM::CLM::FSMPingPongCLFSM_META::State::Ping*) _machine->state(0))->stateName);
			}
			void setValue(std::string value)
			{
				((FSM::CLM::FSMPingPongCLFSM_META::State::Ping*) _machine->state(0))->stateName = value.c_str();
			}
		};
		// Meta Property: stateName
		class Meta_Ping_stateName : public CLReflect::CLMetaProperty
		{
		public:
			Meta_Ping_stateName() : CLMetaProperty("stateName", "const char *") {}

			std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)
			{
				CLM::PingPongCLFSM_META* castedMachine = dynamic_cast<CLM::PingPongCLFSM_META*>(machineInstance);
				if (castedMachine)
				{
					return std::shared_ptr<CLReflect::CLBoundProperty>(new Bound_Ping_stateName(castedMachine));
				}
				else
				{
					return std::shared_ptr<CLReflect::CLBoundProperty>(NULL);
				}
			}
		};
	}
}

#endif
