/*
 *  FSMachine.h
 *  
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011 Rene Hexel.
 *  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Rene Hexel.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */
#ifndef gufsm_FSMachine_h
#define gufsm_FSMachine_h

#include <vector>
#include <string>
#include <sys/time.h>

#include "ExecComStruct.h"

#define TIMES_TO_POST_NAME_AND_ID 5

namespace FSM
{
        class State;
        class Transition;
        class Machine;

        class Context
        {
        public:
                virtual ~Context() {}           /// destructor
                virtual void take_snapshot() {} /// take a snapshot of current context
        };

        typedef std::vector<State *> StateVector;
        typedef StateVector::iterator StateIterator;
        
        
        //      Epcbefore == 0   EpcAfterOnEntry == 1  EBeforeTransition  ==2
        //  EtransitionFalse == 3  EtransitionTrue == 4
        enum RingletStage{Epcbefore,EpcAfterOnEntry,EBeforeTransition,EtransitionFalse,EtransitionTrue,ETOTAL_NUM_VALUES};
        
        struct KripkeFreezePointOfMachine
        {
                Machine* machine;  /* machine that is frozen */
                int stateID;    /* state where it is frozen */
                enum RingletStage ringletStage ;
                 /* a state in a machien goes thorugh
                                 On Entry * transiitons evaluation (or Onexit)
                                  */
                int transition_id; /* id of transition frozen if above */
                bool operator==(const KripkeFreezePointOfMachine &other) const
                {
                        return machine == other.machine &&
                                stateID == other.stateID &&
                                ringletStage == other.ringletStage &&
                        transition_id == other.transition_id;
                }
                bool operator!=(const KripkeFreezePointOfMachine &other) const
                {
                        return !(*this == other);
                }
               
        };
        typedef std::vector<KripkeFreezePointOfMachine> LocalKripkeFrezzePointVector;   // states per machine


        /**
         * State machine class
         */
        class Machine
        {
                Context *_context;      /// context used by behaviour
                int _id;                /// unique id of machine

                StateVector _states;    /// machine states
                State *_currentState;   /// current state of the machine
                State *_previousState;  /// previous state

                timeval _state_time;    /// state start time
                timeval _actty_time;    /// internal activity start time
		
		bool _beingMonitored;   /*  has someone asked for this machine to send
		                         *  debugging information over the whiteboard. */

                long _activities_count; /// how many times have activities run?
                
                LocalKripkeFrezzePointVector _localKripkeStateNames;
                bool _have_kripke_states;        /// built already?
		
		int _machineIdPostCount; /* How many times have we posted machine name/id pairs
					  *  to the whiteboard? */
        protected:
                /* Communicate back to FSMInterpreter class. */
                ExecCom_Struct * _execCom;
        public:
                /** constructor */
                Machine(State *initial = NULL, 
                        Context *ctx = NULL, int mid=0,
			bool beingMonitored=false,
			ExecCom_Struct * execCom = NULL) 
                :  _id(mid),
                   _context(ctx), 
                   _currentState(initial),
                   _previousState(NULL), 
                   _states(), 
                   _localKripkeStateNames(),
                   _have_kripke_states(false),
                   _beingMonitored(false),
		   _machineIdPostCount(0)
                {
                        _execCom = execCom;
                        
                        if (initial)
                        {
                                addState(initial);
                                initialise();
                        }
                }

                /** destructor */
                virtual ~Machine() {}

                /** ID setter */
                void setID(int i) { _id = i; }

                /** ID getter */
                int id() { return _id; }

                /** states getter method */
                StateVector &states() { return _states; }
                
                /** states setter method */
                void setStates(const StateVector &sv) { _states = sv; }
                
                /** add a state */
                void addState(State *s) { _states.push_back(s); }

                /** get the current state */
                State *currentState() { return _currentState; }

                /** set the current state */
                void setCurrentState(State *s) { _currentState = s; }

                /** get the current state ID */
                int currentStateID();

                /** get the preceding state */
                State *previousState() { return _previousState; }

                /** set the preceding state */
                void setPreviousState(State *s) { _previousState = s; }
		
		/** is this machine being monitored? **/
		bool isBeingMonitored() { return _beingMonitored; }
		
		/** start posting internal and global variables to the
		  * whiteboard. */
		void setBeingMonitored(bool b) { _beingMonitored = b; }

                /** get the current state's start time */
                timeval &stateTime() { return _state_time; }

                /** get the current activity's start time */
                timeval &activityTime() { return _actty_time; }

                /** get the internal activities counter */
                long activitiesCount() { return _activities_count; }

                /** set the internal activities counter */
                void setActivitiesCount(long n = 0) { _activities_count = n; }

                /** context getter */
                Context *context() { return _context; }

                /** context setter */
                void setContext(Context *ctx = NULL) { _context = ctx; }
		
		/** If we are monitoring machines, how many times have we
		  * pose the name and id of each machine being executed? */
		int getMachineIdPostCount() { return _machineIdPostCount; }
		
		void setMachineIdPostCount(int i) { _machineIdPostCount = i; }

                /** put the state machine into its initial state */
                virtual void initialise()
                {
                        if (_states.size()) _currentState = _states[0];
                        _previousState = NULL;
                        if (context()) context()->take_snapshot();
                }

                /**
                 * execute one iteration of the current state
                 * @param fired pointer to a boolean capturing fired condition
                 * @return true if the state machine should continue
                 */
                virtual bool executeOnce(bool *fired=NULL);

                /**
                 * execute until accepting state is encountered
                 */
                virtual void execute() { while (executeOnce()) ; }

                /**
                 * printable state machine description
                 */
                virtual std::string description();
                
                /**
                 *maybe the Kripke structure of a FSM
                 */
                virtual std::string kripkeInSVMformat();
                
                /**
                 * PC values in the Kripke structure of this machine
                 * return false if failure
                 */
                const LocalKripkeFrezzePointVector &localKripkeStateNames(bool      snapshotPerTransition=false);
     
                size_t sizeLocalKripkeStateNames()
                { return _localKripkeStateNames.size();
                }
                
                /**
                 * PC values in the Kripke structure of intial state of this machine
                 */
                virtual std::string initialStateName();
                
              
                
                /**
                 * restart the current state machine from initial state
                 * @param initialState state to start from (default: first state)
                 * @return previous state the machine was in
                 */
                virtual State *restart(State *initialState = NULL);
                
                /**
                 * restart the current state machine from initial state
                 * @param initialState state to start from (default: first state)
                 * @return previous state the machine was in
                 */
                virtual State *stateForID(int state_id);

                /**
                 * execute the OnEntry stage
                 */
                virtual void executeOnEntry();
                
                /**
                 * execute the internal stage
                 */
                virtual void executeInternal();
                
                /**
                 * execute the OnExit phase for a given firing transition --
                 * this changes to the firing transition's target state
                 */
                virtual void executeOnExitForTransition(Transition *firingTransition);

                /**
                 * evaluate a transition
                 */
                virtual bool evaluateTransition(Transition *t);

                /**
                 * evaluate a transition with a given index
                 */
                virtual bool evaluateTransitionWithIndex(int i);

                /**
                 * return the number of transitions in the current state
                 */
                virtual size_t numberOfTransitionsInCurrentState();

                /**
                 * execute the OnExit phase for a given firing transition --
                 * this changes to the firing transition's target state
                 */
                virtual void executeOnExitForTransitionWithIndex(int i);
        };
}

#endif
