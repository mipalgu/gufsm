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
#include <sys/time.h>

namespace FSM
{
        class State;
        class Context {};
        
        typedef std::vector<State *> StateVector;
        typedef StateVector::iterator StateIterator;

        /**
         * State machine class
         */
        class Machine
        {
                Context *_context;      /// context used by behaviour

                StateVector _states;    /// machine states
                State *_currentState;   /// current state of the machine
                State *_previousState;  /// previous state

                timeval _state_time;    /// state start time
                timeval _actty_time;    /// internal activity start time

                long _activities_count; /// how many times have activities run?

        public:
                /** constructor */
                Machine(State *initial = NULL, Context *ctx = NULL):
                        _context(ctx), _currentState(initial),
                        _previousState(NULL), _states()
                {
                        if (initial)
                        {
                                addState(initial);
                                initialise();
                        }
                }

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

                /** get the preceding state */
                State *previousState() { return _previousState; }

                /** set the preceding state */
                void setPreviousState(State *s) { _previousState = s; }

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

                /** put the state machine into its initial state */
                virtual void initialise()
                {
                        _currentState = _states[0];
                        _previousState = NULL;
                }

                /**
                 * execute one iteration of the current state
                 * @return true if the state machine should continue
                 */
                virtual bool executeOnce();

                /**
                 * execute until accepting state is encountered
                 */
                virtual void execute() { while (executeOnce()) ; }

                /**
                 * printable state machine description
                 */
                virtual std::string description();
                
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
        };
}

#endif
