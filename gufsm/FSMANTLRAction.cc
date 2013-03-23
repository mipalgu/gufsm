/*
 *  Action.h
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
#include "FSMANTLRContext.h"
#include "FSMANTLRAction.h"
#include "FSMANTLRExpression.h"

#include <iostream>
#include <sstream>
#include <cassert>
#include <gu_util.h>
#include <Whiteboard.h>

#include "FSMachine.h"
#include "FSMState.h"

extern "C" {
#include "parser_walk.h"
}

using namespace FSM;
using namespace std;

static inline ANTLR3_UINT32 getType(pANTLR3_BASE_TREE tree)
{
	if  (tree->isNilNode(tree) == ANTLR3_TRUE)
                return 0;
        
	return	((pANTLR3_COMMON_TREE)(tree->super))->token->getType(((pANTLR3_COMMON_TREE)(tree->super))->token);
}


static inline const char *getTString(pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        return (const char *) state->tokenNames[getType(tree)];
}

static inline string getContent(pANTLR3_BASE_TREE tree)
{
        pANTLR3_STRING s = tree->toString(tree);
        if (!s) return NULL;
        string rv = (const char *) s->chars;
        s->factory->destroy(s->factory, s);
        return rv;
}

static int
statement_callback(void *context, const char *terminal, const char *content,
             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        Machine *m = (Machine *) context;
        ANTLRContext *c = (ANTLRContext *) m->context();
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;

        assert(terminal);                       /* must not be nil */
        
        if (string("BLOCK") == terminal)        /* block in curly brackets? */
        {
                /*
                walk_parse_children(state, tree, statement_callback, NULL, NULL, context);
                return 0;
                 */
                return 1;                       /* parse children */
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                const char *t1t = getTString(state, t1);
                string t1c = getContent(t1);
                assert(string("K_ID") == t1t);
                
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                int result = ANTLRExpression::evaluate(state, t2, m);
                
                if (c->internal_variable_exists(m->id(), t1c))
                {
                        c->set_internal_variable(t1c, m->id(), result);
			
#ifdef MONITORING_MODE_ON
			// Decide to post the value if we are monitoring the
			//  machine from eg Qfsm.
			if (m->isBeingMonitored()) {
				if (c->whiteboard()) {
					char msgName[60];
					string varName = c->internal_variable_name(t1c, m->id());
					sprintf(msgName, "mon_%s", varName.c_str());
					c->whiteboard()->addMessage(msgName, WBMsg(result));
				}
			}
#endif
			
                        return 0;                       /* parse children */
                }
                else if (c->external_variable_exists(t1c))
                {
                        c->set_external_variable(t1c, result); /* cache ext variable */
                        if (c->whiteboard())
                                c->whiteboard()->addMessage(t1c, WBMsg(result));
                        return 0;                       /* parse children */
                }
                else
                {
                        c->set_variable(t1c, result);   /* set global variable */
			
#ifdef MONITORING_MODE_ON
			// Decide to post the value if we are monitoring the
			//  machine from eg Qfsm.
			if (m->isBeingMonitored()) {
				if (c->whiteboard()) {
					char msgName[60];
					string varName = t1c;
					sprintf(msgName, "mon_%s", varName.c_str());
					c->whiteboard()->addMessage(msgName, WBMsg(result));
				}
			}
#endif
			
                        return 0;
                }
        }
        if (string("K_ID") == terminal)         /* function call? */
                ANTLRExpression::evaluate(state, tree, m);

        return 1;
}


void ANTLRAction::performv(Machine *m, ActionStage stage, int x, va_list)
{
#ifdef DEBUG
        State *s = stage == STAGE_ON_EXIT ? m->previousState() : m->currentState();
        DBG(cout << "ANTLRAction perform stage " << stage << " for state "
             << s->name() << "(" << s->stateID()
             << "): " << x << endl);
#endif
        walk_parse_children(antlr_state(), content(), statement_callback, NULL, NULL, m);
};


static int
statement_print_pop_callback(void *context, const char *terminal, const char *content,
                             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        stringstream &ss = *(stringstream *)context;
        assert(terminal);                       /* must not be nil */
        
        if (string("BLOCK") == terminal)        /* block in curly brackets? */
        {
                ss << "}\n" << endl;
                return 1;                       /* parse children */
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                ss << " ) " << endl;
                return 1;
        }
        ss << content;
        return 1;
}


static int
assignment_print_callback(void *context, const char *terminal, const char *content,
                    pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        stringstream &ss = *(stringstream *)context;
        assert(terminal);                       /* must not be nil */
        
        if (string("K_ID") == terminal)         /* variable name */
        {
                ss << content << ", ";
                return 0;
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                ss << " =( " ;
                walk_parse_children(state, tree, assignment_print_callback, NULL, statement_print_pop_callback, context);
                return 0;
        }
        ss << content << ", ";
        return 1;
}



static int
statement_print_callback(void *context, const char *terminal, const char *content,
                   pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        stringstream &ss = *(stringstream *)context;
        assert(terminal);                       /* must not be nil */
        
        if (string("BLOCK") == terminal)        /* block in curly brackets? */
        {
                ss << "{\n" << endl;
                return 1;                       /* parse children */
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                ss << " =( " ;
                walk_parse_children(state, tree, assignment_print_callback, NULL, NULL, context);
                return 0;
        }
        ss << content << ", ";
        return 1;
}


string ANTLRAction::description()
{
        stringstream ss;

        walk_parse_children(antlr_state(), content(), statement_print_callback, NULL, statement_print_pop_callback, &ss);

        return ss.str();
};


static int
assignment_extract_callback(void *context, const char *terminal, const char *content,
                          pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        Machine *fsm = (Machine *) context;
        ANTLRContext *antlr_context = (ANTLRContext *) fsm->context();
        assert(terminal);                       /* must not be nil */
        
        if (string("K_ID") == terminal)         /* variable name */
        {
                ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;
                if (!n && !antlr_context->internal_variable_exists(fsm->id(), content))
                        antlr_context->set_variable(content);
                return 0;
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                walk_parse_children(state, tree, assignment_extract_callback, NULL, NULL, context);
                return 0;
        }
        return 1;
}



static int
statement_extract_callback(void *context, const char *terminal, const char *content,
                         pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        assert(terminal);                       /* must not be nil */
        
        if (string("BLOCK") == terminal)        /* block in curly brackets? */
        {
                return 1;                       /* parse children */
        }
        if (string("K_EQ") == terminal)         /* assignment */
        {
                walk_parse_children(state, tree, assignment_extract_callback, NULL, NULL, context);
                return 0;
        }
        return 1;
}


void ANTLRAction::set_external_variables(Machine *fsm)
{
        walk_parse_children(antlr_state(), content(), statement_extract_callback, NULL, NULL, fsm);
}


