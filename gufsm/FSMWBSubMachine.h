/*
 *  FSMWBSubMachine.h
 *  
 *  Created by René Hexel on 22/11/11.
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
#ifndef gufsm_FSMWBSubMachine_h
#define gufsm_FSMWBSubMachine_h

#include <Whiteboard.h>
#include "FSMSuspensibleMachine.h"
#include "ExecComStruct.h"

namespace FSM
{
        class WBContext;

        class WBSubMachine: public SuspensibleMachine
        {
                std::string _name;      /// name for the machine on the Whiteboard
                bool _deleteContext;    /// does the machine own its WB context?
                bool _scheduleSuspend;  /// should suspend when executing next time
                bool _scheduleResume;   /// should resume when executing next time
                bool _scheduleRestart;  /// should restart when executing next time
        public:
                /** constructor */
                WBSubMachine(const std::string &mname, State *initialState = NULL, 
                             WBContext *ctx = NULL, 
                             int mid=0,
                             State *s = NULL, 
                             bool del = false,
                             ExecCom_Struct * execCom = NULL);

                /** destructor */
                virtual ~WBSubMachine();

                /** put the state machine into its initial state */
                virtual void initialise();
                
                /** name getter */
                const std::string &name() { return _name; }

                /** name setter */
                void setName(const std::string &name) { _name = name; }

                /** execute once */
                virtual bool executeOnce(bool *fired=NULL);

                /** suspend this state machine */
                virtual void suspend();

                /** resume this state machine where it left off */
                virtual void resume();

                /** restart this state machine where it left off */
                virtual void restart();

                /** is this machine scheduled for resumption? */
                virtual bool scheduledForResume() { return _scheduleResume; }
                
                /** is this machine scheduled for restart? */
                virtual bool scheduledForRestart() { return _scheduleRestart; }

                /** return whether the context will be deleted by the destructor */
                bool willDeleteContext() { return _deleteContext; }

                /** should the context be deleted in the destructor? */
                void setDeleteContext(bool del = true) { _deleteContext = del; }

                /** suspend from the whiteboard, requires a string with the machine's name */
                void wb_suspend(std::string, WBMsg *msg) { if (name() == msg->getStringValue()) _scheduleSuspend = true; }

                /** specific suspend from the whiteboard (wb message name must be suspend_MACHINENAME */
                void wb_suspend_me(std::string s, WBMsg *msg) { _scheduleSuspend = msg->boolValue(); if (!_scheduleSuspend) wb_resume_me(s, msg); }

                /** resume from the whiteboard, requires a string with the machine's name */
                void wb_resume(std::string, WBMsg *msg) { if (name() == msg->getStringValue()) _scheduleResume = true; }

                /** specific resume from the whiteboard (wb message name must be suspend_MACHINENAME */
                void wb_resume_me(std::string, WBMsg *) { _scheduleResume = true; }

                /** restart from the whiteboard, requires a string with the machine's name */
                void wb_restart(std::string s, WBMsg *msg) { if (name() == msg->getStringValue()) wb_restart_me(s, msg); }

                /** specific restart from the whiteboard (wb message name must be suspend_MACHINENAME */
                void wb_restart_me(std::string, WBMsg *) { _scheduleRestart = true; }
		
		/** Start sending non-external variables over the whiteboard, as well
		    as the current state for this machine. */
		void wb_startMonitoring(std::string, WBMsg *);
		
		/** Start sending non-external variables over the whiteboard, as well
		    as the current state for this machine. */
		void wb_startMonitoring_me(std::string, WBMsg *);
		
		/** Stop sending internal state machine data over the whiteboard. */
		void wb_stopMonitoring(std::string, WBMsg *);
		void wb_stopMonitoring_me(std::string, WBMsg *);
        };
}
#endif
