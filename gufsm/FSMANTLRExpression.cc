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

static const char *string_guts(const char *content)
{
        static string s;
        size_t len = content ? strlen(content) : 0;

        if (len < 2)
                s = "";
        else
                s = string(content).substr(1, len-2);

        return s.c_str();
}

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

static
long long evaluate_node(pANTLR3_RECOGNIZER_SHARED_STATE state,
                  pANTLR3_BASE_TREE tree,
                  Machine *m)
{
        ANTLRContext *context = (ANTLRContext *) m->context();
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;
        const char *terminal = getTString(state, tree);
        string content  = getContent(tree);
        
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
        if (string("K_MINUS") == terminal)
        {
                assert(n > 0);
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, 0);
                int result = evaluate_node(state, t, m);
                if (n>1) for (ANTLR3_UINT32 i = 1; i < n; i++)
                {
                        t = (pANTLR3_BASE_TREE) tree->children->get(tree->children, i);
                        result -= evaluate_node(state, t, m);
                }
                else result = -result;
                return result;
        }
        if (string("K_TIMES") == terminal)
        {
                int result = 1;
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                {
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, i);
                        result *= evaluate_node(state, t, m);
                }
                return result;
        }
        if (string("K_DIV") == terminal)
        {
                assert(n > 0);
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE) tree->children->get(tree->children, 0);
                int result = evaluate_node(state, t, m);
                for (ANTLR3_UINT32 i = 1; i < n; i++)
                {
                        t = (pANTLR3_BASE_TREE) tree->children->get(tree->children, i);
                        int d = evaluate_node(state, t, m);
                        if (d) result /= d;
                        else result = INT_MAX;
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
        if (string("K_OROR") == terminal)
        {
                int result = 0;
                for (ANTLR3_UINT32 i = 0; i < n; i++)
                {
                        pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, i);
                        result = result || evaluate_node(state, t, m);
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
        if (string("K_NEQ") == terminal)
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                return evaluate_node(state, t1, m) != evaluate_node(state, t2, m);
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
        if (string("K_GT") == terminal)
        {
                assert(n == 2);
                pANTLR3_BASE_TREE t1 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 0);
                pANTLR3_BASE_TREE t2 = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, 1);
                return evaluate_node(state, t1, m) > evaluate_node(state, t2, m);
        }
        /*
         * leaf node
         */
        if (string("STRING_LITERAL") == terminal)
                return (long long) string_guts(content.c_str());

        if (string("K_INT") == terminal)
                return atoi(content.c_str());

        if (string("K_ID") != terminal)
        {
                DBG(cerr << "Ignoring unexpected token '" << terminal <<
                    "' with content '" << content << "'" << endl);
                return 0;
        }
        /*
         * ID (which means variable or function (children = parameter list)
         */
        if (!context->function_exists(content))   // !function ( = variable )
        {
                if (n) cerr << " *** WARNING: Variable '" << content << "' is not a function, but called with " << n << "parameters!" << endl;
                if (context->internal_variable_exists(m->id(), content))
                        return context->internal_variable_value(m->id(), content);
                else if (context->external_variable_exists(content))
                        return context->external_cached_variable_value(content);  // external variable cached from WB
                else
                        return context->value(content); // global variable
        }

        /*
         * function call
         */
        Expression *func_expr = context->expression_for_function(content);
        long long result = 0LL;
        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                   tree->children->get(tree->children, i);
                
                result = evaluate_node(state, t, m);
                func_expr->add_parameter(i, result);
        }
        
        return func_expr->evaluate(m);
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
                
                result = (int) evaluate_node(state, t, m);
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
        return (int) evaluate_node(state, tree, m);
}


int ANTLRExpression::evaluate(Machine *m)
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
        string content  = getContent(tree);
        
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
        if (string("STRING_LITERAL") == terminal)
                ss << "``" << string_guts(content.c_str()) << "''";

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

        /*
         * extract global (non-declared) variables from expression
         */
        if (string("K_ID") == terminal)
        {
                if (!n &&
                    !antlr_context->external_variable_exists(content) &&
                    !antlr_context->internal_variable_exists(m->id(), content))
                        antlr_context->set_variable(content);
                return;
        }

        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                        tree->children->get(tree->children, i);
                const char *terminal = getTString(state, t);
                string content  = getContent(t);

                expression_extract_callback(context, terminal, content.c_str(), state, t);
        }
}




void ANTLRExpression::set_global_variables(Machine *fsm)
{
        const char *terminal = getTString(antlrState(), expression());
        string content  = getContent(expression());

        expression_extract_callback(fsm, terminal, content.c_str(), antlrState(), expression());
}


