/*
 *  FSMExpression.cc
 *  
 *  Created by René Hexel on 26/09/11.
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
#include <sys/time.h>
#include <cassert>
#include <gu_util.h>
#include <iostream>
#include "FSMANTLRExpression.h"
#include "FSMANTLRContext.h"
#include "FSMachine.h"

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

static inline const char *getContent(pANTLR3_BASE_TREE tree)
{
        pANTLR3_STRING s = tree->toString(tree);
        if (!s) return NULL;
        return (const char *) s->chars;
}

static
int evaluate_node(pANTLR3_RECOGNIZER_SHARED_STATE state,
                  pANTLR3_BASE_TREE tree,
                  Machine *m)
{
        ANTLRContext *context = (ANTLRContext *) m->context();
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;
        const char *terminal = getTString(state, tree);
        const char *content  = getContent(tree);
        
        if (string("K_PLUS") == terminal)
        {
                int result = 0;
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                        
                {
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                                tree->children->get(tree->children, i);
                        result += evaluate_node(state, t, m);
                }
                return result;
        }
        if (string("K_ANDAND") == terminal)
        {
                int result = 1;
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                        
                {
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                                tree->children->get(tree->children, i);
                        result = result && evaluate_node(state, t, m);
                }
                return result;
        }
        if (string("K_NOT") == terminal)
                
        {
                assert(n == 1);
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                return !evaluate_node(state, t, m);
        }
        if (string("K_EQEQ") == terminal)
                
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                return evaluate_node(state, t1, m) == evaluate_node(state, t2, m);
        }
        if (string("K_LT") == terminal)
                
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                return evaluate_node(state, t1, m) < evaluate_node(state, t2, m);
        }
        if (string("K_OROR") == terminal)
                
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                return evaluate_node(state, t1, m) || evaluate_node(state, t2, m);
        }
        /*
         * leaf node
         */
        if (string("K_INT") == terminal)
                return atoi(content);
        
        if (string("K_ID") != terminal)
        {
                DBG(cerr << "Ignoring unexpected token '" << terminal <<
                    "' with content '" << content << "'" << endl);
                return 0;
        }
        /*
         * ID
         */
        if (context->internal_variable_exists(m->id(), content))
                return context->internal_variable_value(m->id(), content);
        /*
         * external
         */
        /* TODO: get from whiteboard */
        return 0;
}


static
int evaluate_children(pANTLR3_RECOGNIZER_SHARED_STATE state,
                      pANTLR3_BASE_TREE tree,
                      Machine *m)
{
        ANTLR3_UINT32 n = tree->children->size(tree->children);
        
        int result = 0;
        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, i);
                
                result = evaluate_node(state, t, m);
        }
        
        return result;
}


int ANTLRExpression::evaluate_children(pANTLR3_RECOGNIZER_SHARED_STATE state,
                              pANTLR3_BASE_TREE tree,
                              Machine *m)
{
        return ::evaluate_children(state, tree, m);
}


int ANTLRExpression::evaluate(pANTLR3_RECOGNIZER_SHARED_STATE state,
                              pANTLR3_BASE_TREE tree,
                              Machine *m)
{
        return evaluate_node(state, tree, m);
}


bool ANTLRExpression::evaluate(Machine *m)
{
        return evaluate(antlrState(), expression(), m);
}


static
void print_node(pANTLR3_RECOGNIZER_SHARED_STATE state,
                  pANTLR3_BASE_TREE tree,
                  stringstream &ss)
{
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;
        const char *terminal = getTString(state, tree);
        const char *content  = getContent(tree);
        
        if (string("K_PLUS") == terminal)
        {
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                        
                {
                        ss << "+( ";
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                                tree->children->get(tree->children, i);
                        print_node(state, t, ss);
                        if (i < n-1) ss << ", ";
                }
                ss << ") ";
                return;
        }
        if (string("K_ANDAND") == terminal)
        {
                ss << "&&( ";
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                        
                {
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                                tree->children->get(tree->children, i);
                        print_node(state, t, ss);
                        if (i < n-1) ss << ", ";
                }
                ss << " ) ";
                return;
        }
        if (string("K_NOT") == terminal)
                
        {
                assert(n == 1);
                ss << "!";
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                print_node(state, t, ss);
                return;
        }
        if (string("K_EQEQ") == terminal)
                
        {
                ss << "( ";
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                print_node(state, t1, ss);
                ss << " == ";
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 1);
                print_node(state, t2, ss);
                ss << " ) ";
                return;
        }
        if (string("K_LT") == terminal)
                
        {
                ss << "( ";
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                print_node(state, t1, ss);
                ss << " << ";
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 1);
                print_node(state, t2, ss);
                ss << " ) ";
                return;
        }
        if (string("K_OROR") == terminal)
                
        {
                ss << "( ";
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                print_node(state, t1, ss);
                ss << " || ";
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                print_node(state, t2, ss);
                ss << " ) ";
                return;
        }
        /*
         * leaf node
         */
        if (string("K_INT") == terminal)
        {
                ss << content;
                return;
        }
        
        if (string("K_ID") != terminal)
        {
                DBG(cerr << "Ignoring unexpected token '" << terminal <<
                    "' with content '" << content << "'" << endl);
                return;
        }
        /*
         * ID
         */
        ss << content;

        return;
}


static
void print_children(pANTLR3_RECOGNIZER_SHARED_STATE state,
                      pANTLR3_BASE_TREE tree,
                      stringstream &ss)
{
        ANTLR3_UINT32 n = tree->children->size(tree->children);
        
        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, i);
                
                print_node(state, t, ss);
        }
}



string ANTLRExpression::description(pANTLR3_RECOGNIZER_SHARED_STATE state,
                                    pANTLR3_BASE_TREE tree)
{
        stringstream ss;
        print_node(state, tree, ss);
        return ss.str();
}

string ANTLRExpression::description()
{
        return description(antlrState(), expression());
}

static
void expression_extract_callback(void *context, const char *terminal, const char *content,
                                pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        Machine *m = (Machine *) context;
        ANTLRContext *antlr_context = (ANTLRContext *) m->context();
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;

        if (string("K_ID") == terminal)
        {
                if (!antlr_context->internal_variable_exists(m->id(), content))
                        antlr_context->set_variable(content);
                return;
        }

        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, i);
                const char *terminal = getTString(state, t);
                const char *content  = getContent(t);

                expression_extract_callback(context, terminal, content, state, t);
        }
}




void ANTLRExpression::set_external_variables(Machine *fsm)
{
        const char *terminal = getTString(antlrState(), expression());
        const char *content  = getContent(expression());

        expression_extract_callback(fsm, terminal, content, antlrState(), expression());
}


