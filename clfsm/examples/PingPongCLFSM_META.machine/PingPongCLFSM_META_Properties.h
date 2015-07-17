#ifndef PINGPONGCLFSM_META_PROPERTIES
#define PINGPONGCLFSM_META_PROPERTIES

// Created with CLMetaGen. Do not modify.

#include <iostream>
#include <cmath>
#include "CLMacros.h"
#include <memory>
#include <string>
#include <sstream>
#include "CLMetaProperty.h"
#include "CLBoundProperty.h"
#include "PingPongCLFSM_META.h"

namespace FSM
{
	namespace PingPongCLFSM_META_namespace
	{
		// Bound property: currentState
		class Bound_Machine_currentState : public CLReflect::CLBoundProperty
		{
		private:
			CLM::PingPongCLFSM_META* _machine;

		public:
			Bound_Machine_currentState(CLM::PingPongCLFSM_META* machine) : _machine(machine) {}

			std::string getValue()
			{
				return std::to_string(_machine->currentState);
			}
			void setValue(std::string value)
			{
				int newValue; std::istringstream(value) >> newValue;
				_machine->currentState = newValue;
			}
		};
		// Meta property: currentState
		class Meta_Machine_currentState : public CLReflect::CLMetaProperty
		{
		public:
			Meta_Machine_currentState() : CLMetaProperty("currentState", "int") {}

			std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)
			{
				CLM::PingPongCLFSM_META* castedMachine = dynamic_cast<CLM::PingPongCLFSM_META*>(machineInstance);
				if (castedMachine)
				{
					return std::shared_ptr<CLReflect::CLBoundProperty>(new Bound_Machine_currentState(castedMachine));
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
