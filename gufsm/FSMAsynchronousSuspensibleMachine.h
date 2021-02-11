/*
 *  FSMAsynchronousSuspensibleMachine.h
 *  gufsm
 *
 *  Created by Rene Hexel on 25/03/13.
 *  Copyright (c) 2013, 2015, 2018, 2021 Rene Hexel. All rights reserved.
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
#ifndef gufsm_FSMAsynchronousSuspensibleMachine_
#define gufsm_FSMAsynchronousSuspensibleMachine_

#include "FSMSuspensibleMachine.h"


#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wc++98-compat"

namespace FSM
{
        class Context;

        /**
         * Suspensible FSM with a whiteboard
         */
        class AsynchronousSuspensibleMachine: public SuspensibleMachine
        {
            enum ScheduledAction {
                SCHEDULE_NO_ACTION,
                SCHEDULE_SUSPEND_ACTION,
                SCHEDULE_RESUME_ACTION,
                SCHEDULE_RESTART_ACTION
            };
        protected:
                /// suspend/resume/restart action to happen when executing the next time
                enum ScheduledAction _scheduledAction;
        public:
                /** constructor */
                AsynchronousSuspensibleMachine(State *initialState = NULLPTR,
                                               Context *ctx = NULLPTR,
                                               int mid=0,
                                               State *s = NULLPTR,
                                               bool del = false);

                // /** destructor */
                //virtual ~AsynchronousSuspensibleMachine();

                /** execute once */
                virtual bool executeOnce(bool *fired=NULLPTR) OVERRIDE;
                
                /** suspend this state machine */
                virtual void suspend() OVERRIDE;
                
                /** resume this state machine where it left off */
                virtual void resume() OVERRIDE;
                
                /** restart this state machine from its initial state */
                virtual State *restart(State *initialState = NULLPTR) OVERRIDE;

                /** is this machine scheduled for suspend? */
                virtual bool scheduledForSuspend() const OVERRIDE { return _scheduledAction == SCHEDULE_SUSPEND_ACTION; }

                /** is this machine scheduled for resumption? */
                virtual bool scheduledForResume() const OVERRIDE { return _scheduledAction == SCHEDULE_RESUME_ACTION; }
                
                /** is this machine scheduled for restart? */
                virtual bool scheduledForRestart() const OVERRIDE { return _scheduledAction == SCHEDULE_RESTART_ACTION; }

                /** schedule suspend */
                virtual void scheduleSuspend(bool s=true) OVERRIDE { if (s) _scheduledAction = SCHEDULE_SUSPEND_ACTION; }
                
                /** schedule resume */
                virtual void scheduleResume(bool s=true) { if (s) _scheduledAction = SCHEDULE_RESUME_ACTION; }
                
                /** schedule restart */
                virtual void scheduleRestart(bool s=true) { if (s) _scheduledAction = SCHEDULE_RESTART_ACTION; }

                /** return the scheduled action */
                virtual enum ScheduledAction scheduledAction() const { return _scheduledAction; }

                /** schedule an action or cancel scheduled actions
                 *  if action == SCHEDULE_NO_ACTION (default))
                 */
                virtual void setScheduledAction(enum ScheduledAction action = SCHEDULE_NO_ACTION) { _scheduledAction = action; }
        };
}

#endif /* defined gufsm_FSMAsynchronousSuspensibleMachine_ */
