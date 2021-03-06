/*
 *  CLState.h
 *  gufsm
 *
 *  Created by Rene Hexel on 1/08/12.
 *  Copyright (c) 2012, 2013, 2015, 2018, 2019, 2021 Rene Hexel.
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
#ifndef clfsm_CLState_
#define clfsm_CLState_

#include "CLAction.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wweak-vtables"
#pragma clang diagnostic ignored "-Wc++98-compat"
#pragma clang diagnostic ignored "-Wsuggest-override"
#pragma clang diagnostic ignored "-Wsuggest-destructor-override"

namespace FSM
{
        class State;
        class CLMachine;
        class CLTransition;

        class CLState
        {
                const char      *_name;                 /// name fo the state
                class State     *_stateContext;         /// FSM context
                CLAction        &_onEntryAction;        /// onEntry
                CLAction        &_onExitAction;         /// onExit
                CLAction        &_internalAction;       /// internal
                CLAction        *_onSuspendAction;      /// onSuspend (optional)
                CLAction        *_onResumeAction;       /// onResume (optional)
        public:
                /** default constructor */
                CLState(const char *name, CLAction &onEntry, CLAction &onExit, CLAction &internal, class State *context = NULLPTR, CLAction *onSuspend = NULLPTR, CLAction *onResume = NULLPTR): _name(name), _stateContext(context), _onEntryAction(onEntry), _onExitAction(onExit), _internalAction(internal), _onSuspendAction(onSuspend), _onResumeAction(onResume) {}

                /** destructor (subclass responsibility!) */
                virtual ~CLState() {}

                /** name getter */
                const char *name() const { return _name; }

                /** name setter */
                void setName(const char *name) { _name = name; }

                /** state context getter */
                class State *stateContext() const { return _stateContext; }

                /** state context setter */
                void setStateContext(class State *state) { _stateContext = state; }

                /** onEntry action getter */
                CLAction &onEntryAction() const { return _onEntryAction; }

                /** onExit action getter */
                CLAction &onExitAction()  const { return _onExitAction; }

                /** internal action getter */
                CLAction &internalAction()const { return _internalAction; }

                /** onSuspend action getter (NULLPTR if not set) */
                CLAction *onSuspendAction()  const { return _onSuspendAction; }
            
                /** onResume action getter (NULLPTR if not set) */
                CLAction *onResumeAction()  const { return _onResumeAction; }
            
                /** perform the onEntry action */
                void performOnEntry(CLMachine *m) { _onEntryAction.perform(m, this); }

                /** perform the onExit action */
                void performOnExit(CLMachine *m)  { _onExitAction.perform(m, this); }

                /** perform the internal action */
                void performInternal(CLMachine *m){ _internalAction.perform(m, this); }

                /** perform the onSuspend action */
                void performOnSuspend(CLMachine *m)  { if (_onSuspendAction) _onSuspendAction->perform(m, this); }

                /** perform the onResume action */
                void performOnResume(CLMachine *m)  { if (_onResumeAction) _onResumeAction->perform(m, this); }

                /** return the ith transition leading out of this state */
                CLTransition *transition(int i) const { return transitions()[i]; }

                /** return the array of transitions for this state */
                virtual CLTransition * const *transitions() const = 0;

                /** return the number of transitions leading out of this state */
                virtual int numberOfTransitions() const = 0;
        };
}

#pragma clang diagnostic pop

#endif /* defined gufsm_CLState_) */
