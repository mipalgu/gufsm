/*
 *  parser_walk.c
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
#include <stdio.h>
#include <string.h>
#include <libgen.h>
#include <errno.h>

#include "parser_walk.h"
#include "TransitionContainerParser.h"
#include "ActionsContainerParser.h"
#include "SimpleCLexer.h"

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


int walk_parse_tree(pANTLR3_RECOGNIZER_SHARED_STATE state,
                      pANTLR3_BASE_TREE tree,
                      pa_callback_f callback,
                      pa_callback_f down,
                      pa_callback_f up,
                      void *context)
{
        int rv = 1;

        /*
         * Node without children?
         */
	if (tree->children == NULL || tree->children->size(tree->children) == 0)
	{
                if (callback && (rv = callback(context, getTString(state, tree),
                                               getContent(tree), state, tree)) < 0)
                        return rv;
	}
        else                                            /* non-nil node */
	{
                const char *terminal = NULL;
                const char *content = NULL;

                if (!tree->isNilNode(tree))             /* non-nil node? */
                {
                        terminal = getTString(state, tree);
                        content = getContent(tree);
                }
                if (down)                               /* descend into subtree */
                {
                        if ((rv = down(context, terminal, content, state, tree)) < 0)
                                return rv;
                }
                else if (callback)
                {
                        if ((rv = callback(context, terminal, content, state, tree)) < 0)
                                return rv;
                }

                /*
                 * if requested (down() or callback() returned >0)
                 * recurse over children
                 */
                if (rv > 0)
                {
                        rv = walk_parse_children(state, tree, callback,
                                                   down, up, context);
                        if (rv < 0) return rv;

                }
                
                /*
                 * finished with subtree, call up()
                 */
                if (up) rv = up(context, getTString(state, tree), getContent(tree),
                                state, tree);
        }
        return rv;
}


int walk_parse_children(pANTLR3_RECOGNIZER_SHARED_STATE state,
                          pANTLR3_BASE_TREE tree,
                          pa_callback_f callback,
                          pa_callback_f down,
                          pa_callback_f up,
                          void *context)
{
        ANTLR3_UINT32 n = tree->children ? tree->children->size(tree->children) : 0;

        for (ANTLR3_UINT32 i = 0; i < n; i++)
        {
                pANTLR3_BASE_TREE t = (pANTLR3_BASE_TREE)
                tree->children->get(tree->children, i);

                if (!t) continue;

                int rv = walk_parse_tree(state, t, callback,
                                           down, up, context);
                if (rv == -1) return rv;
                if (rv < 0) return 0;
        }

        return 1;
}


static pANTLR3_COMMON_TOKEN_STREAM
open_parse_file(const char *filename, pANTLR3_INPUT_STREAM *inputRef,
                pSimpleCLexer *lexerRef)
{
        pANTLR3_UINT8 file_name = (pANTLR3_UINT8) filename;
        pANTLR3_INPUT_STREAM input = antlr3FileStreamNew(file_name,
                                                         ANTLR3_ENC_UTF8);
        if (!input)
        {
                ANTLR3_FPRINTF(stderr, "Unable to open file %s: %s\n",
                               filename, strerror(errno));
                return NULL;
        }
        
        pSimpleCLexer lexer = SimpleCLexerNew(input);
        
        if (!lexer)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create lexer for %s: %s\n",
                               filename, strerror(errno));
                input->free(input);
                return NULL;
        }
        
        pANTLR3_COMMON_TOKEN_STREAM tstream =
        antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT,
                                         TOKENSOURCE(lexer));
        if (!tstream)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create token source for %s: %s\n",
                               filename, strerror(errno));
                lexer->free(lexer);
                input->free(input);
                return NULL;
        }

        if (inputRef) *inputRef = input;
        if (lexerRef) *lexerRef = lexer;

        return tstream;
}


int parse_actions(const char *filename, pa_callback_f callback,
                  pa_callback_f down, pa_callback_f up, void *context)
{
        int rv = -1;

        if (!filename) { errno = EINVAL; return rv; }

        pANTLR3_INPUT_STREAM input = NULL;
        pSimpleCLexer lexer = NULL;
        pANTLR3_COMMON_TOKEN_STREAM tstream = open_parse_file(filename, &input,
                                                              &lexer);
        if (!tstream) goto err2;

        pActionsContainerParser parser = ActionsContainerParserNew(tstream);

        if (!parser)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create parser for %s: %s\n",
                               filename, strerror(errno));
                goto err3;
        }

        /*
         * parse file and generate AST
         */
        ActionsContainerParser_actions_return actionsAST = parser->actions(parser);

        if ( parser->pParser->rec->state->errorCount > 0)
        {
                ANTLR3_FPRINTF(stderr, "Parsing %s returned %d errors, tree walking aborted.\n",
                               filename,
                               parser->pParser->rec->state->errorCount);
                goto err4;
        }

        //printf("Tree:\n%s\n", actionsAST.tree->toStringTree(actionsAST.tree)->chars);
        /*
         * now that we have an AST, walk the tree and invoke callbacks
         * on tokens so that this can be used, e.g. from a factory method
         */
        //printf("Tree:\n");
        rv = walk_parse_tree(parser->pParser->rec->state, actionsAST.tree,
                               callback, down, up, context);

err4:   // parser->free(parser);
err3:   // tstream->free(tstream);
err2:   // if (lexer) lexer->free(lexer);
        // if (input) input->free(input);

        return rv;
}



int parse_transitions(const char *filename, pa_callback_f callback,
                      pa_callback_f down, pa_callback_f up, void *context)
{
        int rv = -1;
        
        if (!filename) { errno = EINVAL; return rv; }
        
        pANTLR3_INPUT_STREAM input = NULL;
        pSimpleCLexer lexer = NULL;
        pANTLR3_COMMON_TOKEN_STREAM tstream = open_parse_file(filename, &input,
                                                              &lexer);
        if (!tstream) goto err2;

        pTransitionContainerParser parser = TransitionContainerParserNew(tstream);
        
        if (!parser)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create parser for %s: %s\n",
                               filename, strerror(errno));
                goto err3;
        }
        
        /*
         * parse file and generate AST
         */
        TransitionContainerParser_transitions_return transitionsAST = parser->transitions(parser);
        
        if ( parser->pParser->rec->state->errorCount > 0)
        {
                ANTLR3_FPRINTF(stderr, "Parsing %s returned %d errors, tree walking aborted.\n",
                               filename,
                               parser->pParser->rec->state->errorCount);
                goto err4;
        }
        
        //printf("Tree:\n%s\n", transitionsAST.tree->toStringTree(transitionsAST.tree)->chars);
        /*
         * now that we have an AST, walk the tree and invoke callbacks
         * on tokens so that this can be used, e.g. from a factory method
         */
        //printf("Tree:\n");
        rv = walk_parse_tree(parser->pParser->rec->state, transitionsAST.tree,
                                   callback, down, up, context);
        
err4:   // parser->free(parser);
err3:   // tstream->free(tstream);
err2:   // lexer->free(lexer);
        // input->free(input);
        
        return rv;
}