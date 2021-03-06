/*
 *  FSMVectorFactory.h
 *  
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011, 2015 Rene Hexel.
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
#ifndef gufsm_FSMVectorFactory_h
#define gufsm_FSMVectorFactory_h

#include <string>
#include <queue>
#include <Whiteboard.h>
#include "FSMANTLRMachineVector.h"

namespace FSM
{
        class ANTLRContext;
        class SuspensibleMachine;

        class ANTLRStateMachineVectorFactory
        {
        protected:
                ANTLRMachineVector *_fsms;      /// delivered FSMs
                ANTLRContext *_context;         /// factory context

                std::queue<std::string> _reload_queue; /// queue for reloading machines
                std::queue<std::string> _reread_queue; /// queue for rereading machines
                dispatch_semaphore_t _queue_semaphore; /// queue protector
        public:
                /** constructor that builds vector of machines */
                ANTLRStateMachineVectorFactory(ANTLRContext *context, const std::vector<std::string> &names_of_machines_to_build);
                
                /** Default constructor. */
                ANTLRStateMachineVectorFactory();

                /** destructor (unsubscribes from whiteboard) */
                virtual ~ANTLRStateMachineVectorFactory();

                /** get ANTLR context */
                virtual ANTLRContext &context() const { return *_context; }

                /** getter */
                ANTLRMachineVector *fsms() const { return _fsms; }

                /** create a new machine with a given name and index */
                SuspensibleMachine *addMachine(std::string name, int index=-1, bool resume=false);

                /** execute state machines */
                void execute(void);

                /** get the index of a machine with a given name (-1 if not found) */
                int index_of_machine_named(std::string machine_name);

                /** reload given state machine and restart from initial state */
                void reloadMachine(std::string name);
                
                /** reread given state machine and resume from current state */
                void rereadMachine(std::string name);

                /** reload callback on Whiteboard */
                void wb_reload(std::string, WBMsg *machinemsg);

                /** reread callback on Whiteboard (work like reload, but tries to resume from current state */
                void wb_reread(std::string, WBMsg *machinemsg);

                /** reload_MACHINE callback on Whiteboard */
                void wb_reload_specific(std::string, WBMsg *machinemsg);
                
                /** reread_MACHINE callback on Whiteboard (work like reload, but tries to resume from current state */
                void wb_reread_specific(std::string, WBMsg *machinemsg);
        };
}
#endif
