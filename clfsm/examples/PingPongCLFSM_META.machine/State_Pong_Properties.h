#ifndef STATE_PONG_PROPERTIES
#define STATE_PONG_PROPERTIES

// Created with CLMetaGen. Do not modify.

#include "PingPongCLFSM_META.h"
#include <unistd.h>
#include "State_Pong.h"
#include "CLBoundProperty.h"
#include <string>
#include <memory>
#include <cstdlib>
#include <sstream>
#include "CLReflect_API.h"
#include "CLMetaProperty.h"

namespace FSM
{
	namespace PingPongCLFSM_META_namespace
	{
		// Bound Property: stateName
		class Bound_Pong_stateName : public CLReflect::CLBoundProperty
		{
		private:
			CLM::PingPongCLFSM_META* _machine;

		public:
			Bound_Pong_stateName(CLM::PingPongCLFSM_META* machine) : _machine(machine) {}

			std::string getValue()
			{
				return std::string(((FSM::CLM::FSMPingPongCLFSM_META::State::Pong*) _machine->state(1))->stateName);
			}
			void setValue(std::string value)
			{
				((FSM::CLM::FSMPingPongCLFSM_META::State::Pong*) _machine->state(1))->stateName = value.c_str();
			}
		};
		// Meta Property: stateName
		class Meta_Pong_stateName : public CLReflect::CLMetaProperty
		{
		public:
			Meta_Pong_stateName() : CLMetaProperty("stateName", "const char *") {}

			std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)
			{
				CLM::PingPongCLFSM_META* castedMachine = dynamic_cast<CLM::PingPongCLFSM_META*>(machineInstance);
				if (castedMachine)
				{
					return std::shared_ptr<CLReflect::CLBoundProperty>(new Bound_Pong_stateName(castedMachine));
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
