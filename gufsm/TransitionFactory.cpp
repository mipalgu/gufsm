/*
 *  TransitionFactory.cpp
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
#include <iostream>
#include <assert.h>
#include <ctype.h>
#include <sys/param.h>
#include <gu_util.h>
#include "Machine.h"
#include "Transition.h"
#include "TransitionFactory.h"
#include "Expression.h"

extern "C"
{
#include "parser_walk.h"        
}

using namespace std;

static int
func_callback(void *context, const char *terminal, const char *content,
                   pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        TransitionFactory *self = (TransitionFactory *) context;

        assert(terminal);                       /* must not be nil */

        if (string("INT") == terminal)          /* integer parameter? */
        {
                self->set_value(atol(content));

                return 1;
        }

        DBG(cerr << "Ignoring unexpected state name token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
exp_push(void *context, const char *terminal, const char *content,
         pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        TransitionFactory *self = (TransitionFactory *) context;
        
        assert(terminal);                       /* must not be nil */
        
        if (string("ID") == terminal)           /* function name? */
        {
                self->set_function(true);
                self->set_wb_name(content);
                if (walk_parse_children(state, tree, func_callback, NULL, NULL,
                                        context) == -1)
                        return -1;

                return 0;
        }

        DBG(cerr << "Ignoring unexpected expression token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
exp_callback(void *context, const char *terminal, const char *content,
             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        TransitionFactory *self = (TransitionFactory *) context;
        
        assert(terminal);                       /* must not be nil */
        
        if (string("NEGATION") == terminal)     /* negation? */
        {
                self->set_negation(true);
                return 1;
        }
        if (string("ID") == terminal)           /* whiteboard predicate? */
        {
                self->set_wb_name(content);
                return 1;
        }
        if (string("INT") == terminal)          /* state ID? */
        {
                self->set_dest_id(atoi(content));
                if (!self->get_fsm()->exists_already(self->get_dest_id()))
                {
                        cerr << "BAD TRANSITIONS FILE: target state "
                             << self->get_state_id() << " does not exist!"
                             << endl;
                        return -1;
                }
                return 1;
        }
        
        DBG(cerr << "Ignoring unexpected expression token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
transition_push(void *context, const char *terminal, const char *content,
              pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        TransitionFactory *self = (TransitionFactory *) context;

        if (!terminal) return 1;        /* ignore root push */

        if (string("INT") == terminal)  /* state ID? */
        {
                self->set_state_id(atoi(content));
                if (!self->get_fsm()->exists_already(self->get_state_id()))
                {
                        cerr << "BAD TRANSITIONS FILE: state "
                             << self->get_state_id() << " does not exist!"
                             << endl;
                        return -1;
                }

                self->set_negation(false);
                self->set_function(false);
                if (walk_parse_children(state, tree, exp_callback, exp_push, NULL,
                                        context) == -1)
                        return -1;
                return 0;
        }

        DBG(cerr << "Ignoring unexpected transition token '" << terminal <<
            "' with content '" << content << "'" << endl);

        return 1;
}

static int
transition_pop(void *context, const char *terminal, const char *content,
             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        TransitionFactory *self = (TransitionFactory *) context;
        int s = self->get_state_id();

        if (s == -1) return 1;              // skip

        self->set_state_id(-1);                 // don't pop twice
        
        fsmState *source = self->get_fsm()->find(s);
        fsmState *target = self->get_fsm()->find(self->get_dest_id());

        if (source && target)
        {
                fsmExpression *e = new fsmExpression(self->get_wb_name(),
                                                     self->is_negation(),
                                                     self->is_function(),
                                                     self->get_value());
                fsmTransition *t = new fsmTransition(source, target, e);
                if (!t)
                {
                        cerr << "CANNOT CREATE TRANSITION for state "
                             << s << ": " << e->getWhatToEvaluate()
                             << " -> " << self->get_dest_id() << endl;
                        return -1;
                }

                source->addTransition(t);
        }
        else
        {
                cerr << "INVALID state transition "
                     << s << ": " << self->get_wb_name() << " -> "
                     << self->get_dest_id() << endl;
                return -1;
        }
        return 1;
}

TransitionFactory::TransitionFactory(fsmMachine *machine, const char *filename):
        fsm(machine), file(filename), error(false),
        state_id(-1), destination_id(-1), negation(false), function(false)
{
        if (parse_transitions(filename, NULL, transition_push, transition_pop, this) == -1)
                set_error(true);
}
