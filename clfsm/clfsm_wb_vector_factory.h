/*
 *  clfsm_wb_vector_factory.h
 *  clfsm
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

#ifndef clfsm_wb_vector_factory_
#define clfsm_wb_vector_factory_

#include "clfsm_vector_factory.h"
#include "typeClassDefs/FSM_Control.h"
#include "gusimplewhiteboard.h"
#include "guwhiteboardtypelist_generated.h"
#include "guwhiteboardwatcher.h"

#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wweak-vtables"
#pragma clang diagnostic ignored "-Wc++98-compat"

//namespace guWhiteboard
//{
//        class FSMControlStatus;
//}

/**
 * Factory for whiteboard-controlled FSMs
 */
namespace FSM
{
        class Context;

        class CLFSMWBVectorFactory: public FSM::CLFSMVectorFactory
        {
#ifndef WITHOUT_LIBDISPATCH
                whiteboard_watcher _watcher;            ///< whiteboard watcher to manage subscriptions
#endif
                guWhiteboard::FSM_Status_t _wbstatus;   ///< current whiteboard status of machines
                guWhiteboard::FSM_Names_t _wbfsmnames;  ///< fsm name information on the whiteboard
                guWhiteboard::FSM_States_t _wbfsmStates;   ///< buffered state status, used to limit WB publications.
                guWhiteboard::FSMState fsmCurrStates;
        public:
                /**
                 * Designated constructor.
                 * @param[in] wbcontext                 Whiteboard context to use.
                 * @param[in] deleteOnDestruction       Delete non-NULLPTR wbcontext on destruction
                 * @param[in] timeout                   Idle timeout in microseconds
                 */
                CLFSMWBVectorFactory(FSM::Context *wbcontext = NULLPTR, bool deleteOnDestruction = false, useconds_t timeout = 10000L);

                /** context getter */
                FSM::Context *context() { return static_cast<FSM::Context *>(_context); }

                /** context setter */
                void setContext(FSM::Context *context) { _context = static_cast<FSM::Context *>(context); }

#ifndef WITHOUT_LIBDISPATCH
                /** whiteboard watcher getter */
                whiteboard_watcher &watcher() { return _watcher; }
#endif
                /** status getter */
                guWhiteboard::FSM_Status_t &wbstatus() { return _wbstatus; }

                /** names getter */
                guWhiteboard::FSM_Names_t &wbfsmnames() { return _wbfsmnames; }

                /** state getter */
                guWhiteboard::FSM_States_t &wbfsmstates() { return _wbfsmStates; }
                /**
                 * whiteboard callback for control message
                 */
                void whiteboard_fsm_control(guWhiteboard::WBTypes t, guWhiteboard::FSMControlStatus &controlMsg);

                /**
                 * whiteboard callback for names message
                 */
                void whiteboard_fsm_names(guWhiteboard::WBTypes t, guWhiteboard::FSMNames &namesReq);

                /// post the status of all machines on the whiteboard
                void postMachineStatus();

                /// suspend the machines whose bits are 1
                void suspendMachines(guWhiteboard::FSMControlStatus &suspendControl);

                /// resume the machines whose bits are 1
                void resumeMachines(guWhiteboard::FSMControlStatus &resumeControl);

                /// restart the machines whose bits are 1
                void restartMachines(guWhiteboard::FSMControlStatus &restartControl);

                /// post the names of the current machines on the whiteboard
                void postMachineNames();

                /// post one packet of names starting from the given index
                guWhiteboard::FSMNames* postMachineNamesFromIndex(guWhiteboard::FSMNames &namesReq);

                /**
                 * execute one iteration of the current state of each machine
                 * with a given visitor for each machine
                 * @param should_execute_machine visitor that returns whether machine should be executed in this round
                 * @param context pointer to a user-defined context (such as a whiteboard context for the wb singleton)
                 * @return true if any transition fired on any machine
                 */
                virtual bool executeOnce(visitor_f should_execute_machine, void *context) OVERRIDE;
        };
}
#pragma clang diagnostic pop

#endif /* defined clfsm_wb_vector_factory_ */
