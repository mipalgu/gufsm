/*
 *  ActivityFactory.h
 *  
 *  Created by René Hexel on 28/08/11.
 *  Copyright (c) 2011 Rene Hexel. All rights reserved.
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
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
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
#ifndef gubehaviourinterpreter_ActivityFactory_h
#define gubehaviourinterpreter_ActivityFactory_h

#include <map>
#include <string>
#include "FSMAction.h"

#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"

namespace FSM
{
        class Machine;
        class State;
        class Activity;
        class ANTLRAction;
}

/**
 * Factory for ANTLR state machine activities
 */
class ActivityFactory
{
protected:
        FSM::Machine *_fsm;                                     ///< state machine reference
        std::map<std::string, FSM::Action *> *_named_actions;   ///< map from names to actions
        const char *_file;                                      ///< name of file being processed

        FSM::State *_currentState;                              ///< state currently being processed

        FSM::ANTLRAction *_currentAction;                       ///< action currently being processed
        FSM::ActionStage _currentStage;                         ///< onEntry, onExit, or internal

        bool _error;                                            ///< did an error occur?
        
public:
        /** Init member variables and call the init function. */
        ActivityFactory(FSM::Machine *machine, const char *filename, std::map<std::string, FSM::Action *> *func);
        /** Init member variables but don't call the init function. */
        ActivityFactory(FSM::Machine *machine, const char *filename, std::map<std::string, FSM::Action *> *func, bool noInit);
        FSM::Machine *fsm() { return _fsm; }
        bool error() { return _error; }
        void set_error(bool e) { _error = e; }
        FSM::State *state() { return _currentState; }
        void set_state(FSM::State *s) { _currentState = s; }
        FSM::ANTLRAction *action() { return _currentAction; }
        void set_action(FSM::ANTLRAction *a) { _currentAction = a; }
        std::map<std::string, FSM::Action *> *named_actions()
        { return _named_actions; }
        FSM::ActionStage stage() { return _currentStage; }
        void set_stage(FSM::ActionStage stage) { _currentStage = stage; }
};

#pragma clang diagnostic pop

#endif
