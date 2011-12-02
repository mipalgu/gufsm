/*
 *  FSM.cc
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
#include <sstream>
#include <cassert>
#include "FSMachine.h"
#include "FSMState.h"
#include "FSMTransition.h"
#include "FSMExpression.h"

#include "stringConstants.h"

using namespace FSM;

bool Machine::executeOnce()
{
        assert(_currentState);                  // need a valid state

        /*
         * perform onEntry activities if this is a new state
         */
        if (_currentState != _previousState)    // entering a new state?
        {
                gettimeofday(&_state_time, NULL);
                _activities_count = 0;
                _currentState->activity().performOnEntry(this);
                gettimeofday(&_actty_time, NULL);
        }

        /*
         * check all transitions to see if state change is required
         */
        Transition *firingTransition = NULL;
        for (Transition *t: _currentState->transitions())       // foreach t
                if (t->expression()->evaluate(this))            // does t fire?
                {
                        firingTransition = t;                   // yes, then
                        break;                                  // we are done
                }

        _previousState = _currentState;

        /*
         * switch state and perform onExit activities if a transition fired
         */
        if (firingTransition)                   // new state required?
        {
                _currentState = firingTransition->target();     // target state
                _previousState->activity().performOnExit(this); // onExit act
                return true;
        }

        /*
         * no transition fired, so we perform internal activities
         */
        _currentState->activity().performInternal(this);
        _activities_count++;

        /*
         * return and indicate whether the machine should keep going
         */
        return _currentState->transitions().size() != 0;
}

State *Machine::restart(State *initialState)
{
        State *oldState = _currentState;

        initialise();
        if (initialState) _currentState = initialState;

        return oldState;
}

State *Machine::stateForID(int state_id)
{
        for (State *s: states())
        {
                if (s->stateID() == state_id)
                        return s;
        }

        return NULL;
}

using namespace std;

string Machine::description()
{
        stringstream ss;
        int i = 0;
        for (State *s: states())
                ss << "State " << i++ << " (" << (long) s <<  "): " << s->description() << endl;

        return ss.str();
}

string Machine::kripkeInSVMformat()
{
        stringstream ss;
        int i = 0;
        for (State *s: states())
                ss << "State " << i++ << " (" << (long) s <<  "): " << s->description() << endl;
        
        return ss.str();
}

const LocalKripkeStateNames &Machine::localKripkeStateNames(bool snapshotPerTransition)
{
        // caching
        if (_have_kripke_states)
                return _localKripkeStateNames;
        
        int count=0;
        for (State *s: states())
        {
                stringstream sBefore;
                sBefore << "M"<<id() << "::" << pcBefore << s->name() ;
                _localKripkeStateNames.push_back(sBefore.str() ) ;
                  
                 stringstream sAfter;                                   
                sAfter <<  "M"<<id()<< "::" << pcAfterOnEntry << s->name() ;
                _localKripkeStateNames.push_back(sAfter.str() ) ;
                                                    
                /* we neeed information on transitions labels here */
                
                int transitionNumber=1;
                
                for (Transition *tr: s->transitions() )
                {       stringstream sAfterEvaluateT;
                        sAfterEvaluateT <<  "M"<<id() << "::" << pcAfterEvaluate << pcBoolean << transitionNumber << pcTrue << s->name();
                        _localKripkeStateNames.push_back(sAfterEvaluateT.str() ) ;
                        stringstream sAfterEvaluateF;
                        sAfterEvaluateF <<  "M"<<id() << "::" << pcAfterEvaluate << pcBoolean << transitionNumber << pcTrue << s->name();
                        _localKripkeStateNames.push_back(sAfterEvaluateF.str() ) ;
                        
                        if (snapshotPerTransition)	
                                { stringstream sExternal;
                                       sExternal<< "M" << id() << "::" << pcBeforeEvaluate << pcBoolean << transitionNumber << s->name() ;
                                        _localKripkeStateNames.push_back(sExternal.str() ) ;

                                }
                       transitionNumber++;    
                } // each transiiton
                
                count++;
        }

        _have_kripke_states = true;
        return _localKripkeStateNames;
}

string Machine::initialStateName()
{
        stringstream ss;
        
                ss << "M"<< id() << "::" << pcBefore << (states()[0])->name();
 
        return ss.str();
}