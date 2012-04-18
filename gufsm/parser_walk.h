/*
 *  parser_walk.h
 *  
 *  Created by René Hexel on 21/08/11.
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
#ifndef _PARSER_WALK_H_
#define _PARSER_WALK_H_

#include <stdbool.h>
#include <antlr3.h>
#include "SimpleCLexer.h"

/**
 * This is the callback function that gets invoked on every single token
 * in the AST.
 * @param[in] context  a user provided context
 * @param[in] terminal the name of the current terminal as per the grammar (NULL for nil node)
 * @param[in] content  the content currently parsed for that terminal (NULL for nil node)
 * @param[in] state    ANTLR recogniser state
 * @param[in] tree     the current ANTLR parse (subtree)
 * @return -1 in case of an error, 0 to not descend into subtree, 1 to descend
 */
typedef int (*pa_callback_f)(void *context,
                             const char *terminal,
                             const char *content,
                             pANTLR3_RECOGNIZER_SHARED_STATE state,
                             pANTLR3_BASE_TREE tree);

/**
 * The state description, state name and state id are supplied so that this function can
 * create an entire state.
 * @param[in] description   State description.
 * @param[in] name          State name.
 * @param[in] id            State id.
 * @param[in] down          Callback for descending into subtree.
 * @param[up] up            Callback for ascending from subtree.
 * @param[in] context       Caller-specified context used for parsing (passed to callbacks).
 */
int parse_description(const char * description, const char * name, pa_callback_f down, pa_callback_f up, void * context);

/**
 * The main entry point for parsing actions
 * @param[in] filename the name of the file to parse
 * @param[in] callback function to be called for every node in the parse tree (can be NULL)
 * @param[in] down     callback for descending into subtree (can be NULL)
 * @param[in] up       callback for ascending from subtree (can be NULL)
 * @param[in] context  caller-specified context to use for parsing (passed to callbacks)
 * @return -1 in case of an error, -2 to abort sibling walk, >=0 otherwise
 */
int parse_actions(const char *filename, pa_callback_f callback,
                  pa_callback_f down, pa_callback_f up, void *context);

/**
 * The main entry point for parsing transitions
 * @param[in] transition text.
 * @param[in] callback function to be called for every node in the parse tree (can be NULL)
 * @param[in] down     callback for descending into subtree (can be NULL)
 * @param[in] up       callback for ascending from subtree (can be NULL)
 * @param[in] context  caller-specified context to use for parsing (passed to callbacks)
 * @return -1 in case of an error, -2 to abort sibling walk, >=0 otherwise
 */
int get_expr_tree(const char *transition, 
                  void *context, 
                  pANTLR3_BASE_TREE * tree, 
                  pANTLR3_RECOGNIZER_SHARED_STATE * state);

/**
 * The main entry point for parsing transitions
 * @param[in] filename the name of the file to parse
 * @param[in] callback function to be called for every node in the parse tree (can be NULL)
 * @param[in] down     callback for descending into subtree (can be NULL)
 * @param[in] up       callback for ascending from subtree (can be NULL)
 * @param[in] context  caller-specified context to use for parsing (passed to callbacks)
 * @return -1 in case of an error, -2 to abort sibling walk, >=0 otherwise
 */
int parse_transitions(const char *filename, pa_callback_f callback,
                      pa_callback_f down, pa_callback_f up, void *context);

/**
 * This is the tree walker function called by the parser.  A callback may
 * invoke this manually (and then return 0) to impose its own parsing hierarchy
 * @param[in] state    global ANTLR recogniser state
 * @param[in] tree     root of the current subtree to start from
 * @param[in] callback function to be called for every node in the parse tree (can be NULL)
 * @param[in] down     callback for descending into subtree (can be NULL)
 * @param[in] up       callback for ascending from subtree (can be NULL)
 * @param[in] context  caller-specified context passed to callback
 * @return -1 in case of an error, -2 to abort sibling walk, >=0 otherwise
 */
int walk_parse_tree(pANTLR3_RECOGNIZER_SHARED_STATE state,
                      pANTLR3_BASE_TREE tree,
                      pa_callback_f callback,
                      pa_callback_f down,
                      pa_callback_f up,
                      void *context);

/**
 * This parses the current action's children.  A callback may
 * invoke this manually (and then return 0) to impose its own parsing hierarchy
 * @param[in] state    global ANTLR recogniser state
 * @param[in] tree     root of the current subtree to start from
 * @param[in] callback function to be called for every node in the parse tree (can be NULL)
 * @param[in] down     callback for descending into subtree (can be NULL)
 * @param[in] up       callback for ascending from subtree (can be NULL)
 * @param[in] context  caller-specified context passed to callback
 * @return -1 in case of an error
 */
int walk_parse_children(pANTLR3_RECOGNIZER_SHARED_STATE state,
                          pANTLR3_BASE_TREE tree,
                          pa_callback_f callback,
                          pa_callback_f down,
                          pa_callback_f up,
                          void *context);

/* Utility method. */
pANTLR3_COMMON_TOKEN_STREAM open_string_stream(const char *string, 
                                               const char *n, 
                                               pANTLR3_INPUT_STREAM *inputRef, 
                                               pSimpleCLexer *lexerRef);

#endif // _PARSER_WALK_H_
