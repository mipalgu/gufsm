/*
 *  TransitionFactory.h
 *  
 *  Created by René Hexel on 2/09/11.
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
#ifndef gubehaviourinterpreter_TransitionFactory_h
#define gubehaviourinterpreter_TransitionFactory_h

#include <map>
#include <string>
#include "FSMCodeType.h"
#include "Transition.h"

class fsmMachine;

class TransitionFactory
{
        fsmMachine *fsm;
        const char *file;

        int state_id;           /* transition from this state */
        int destination_id;     /* to this state */
        long value;             /* function parameter value */

        std::string wb_name;    /* whiteboard message name (type) */

        bool negation;          /* is this a negation? */
        bool function;          /* is this a function? */

        bool error;
        
public:
        TransitionFactory(fsmMachine *machine, const char *filename);
        fsmMachine *get_fsm() { return fsm; }
        bool got_error() { return error; }
        void set_error(bool e) { error = e; }
        int get_state_id() { return state_id; }
        void set_state_id(int i) { state_id = i; }
        int get_dest_id() { return destination_id; }
        void set_dest_id(int i) { destination_id = i; }
        long get_value() { return value; }
        void set_value(long v) { value = v; }
        const std::string &get_wb_name() { return wb_name; }
        void set_wb_name(const char *name) { wb_name = name; }
        bool is_negation() { return negation; }
        void set_negation(bool n) { negation = n; }
        bool is_function() { return function; }
        void set_function(bool n) { function = n; }
};

#endif
