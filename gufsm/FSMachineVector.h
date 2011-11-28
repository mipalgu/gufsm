/*
 *  FSMachineVector.h
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
#ifndef gufsm_FSMachineVector_h
#define gufsm_FSMachineVector_h

#include <unistd.h>
#include <vector>
#include "FSMSuspensibleMachine.h"

namespace FSM
{
        typedef std::vector<SuspensibleMachine *> MachineVector;
        typedef MachineVector::iterator MachineIterator;
        typedef void (*idle_f)(useconds_t timeout);

        /**
         * State machine vector class
         */
        class StateMachineVector
        {
                Context         *_context;      /// global context
                MachineVector   _machines;      /// vector of suspensible FSMs
                useconds_t      _idle_timeout;  /// idle timeout in usec
                idle_f          _no_transition_fired; /// idle function
                bool            _accepting;     /// all machines are in an accepting state
        public:
                /** constructor */
                StateMachineVector(Context *ctx = NULL, useconds_t timeout = 10000L, idle_f default_idle_function = NULL);

                /** machines getter method */
                MachineVector &machines() { return _machines; }
                
                /** machines setter method */
                void setMachines(const MachineVector &mv) { _machines = mv; }
                
                /** add a machine */
                SuspensibleMachine *addMachine(SuspensibleMachine *m = NULL)
                {
                        if (!m) m = new SuspensibleMachine(NULL, _context);
                        _machines.push_back(m);
                        return m;
                }

                /** context getter */
                Context *context() { return _context; }
                
                /** context setter */
                void setContext(Context *ctx = NULL) { _context = ctx; }
                
                /** accepting state getter */
                bool accepting() { return _accepting; }
                
                /** accepting state setter */
                void setAccepting(bool accept = true) { _accepting = accept; }
                
                /** put all state machines into their initial state */
                virtual void initialise();

                /**
                 * execute one iteration of the current state of each machine
                 * @return true if any transition fired on any machine
                 */
                virtual bool executeOnce();

                /**
                 * execute until accepting state is encountered
                 */
                virtual void execute();

                /**
                 * restart all state machines from their initial state
                 */
                virtual void restart();

                /**
                 * printable state machine vector description
                 */
                virtual std::string description();
       };
}

#endif
