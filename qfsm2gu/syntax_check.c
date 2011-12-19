/*
 *  syntax_check.c
 *  
 *  Created by René Hexel on 3/09/11.
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

#include <antlr3.h>
#include "syntax_check.h"
#include "TransitionContainerParser.h"
#include "ActionsContainerParser.h"
#include "SimpleCLexer.h"

static pANTLR3_COMMON_TOKEN_STREAM
open_string_stream(const char *string, const char *n,
                   pANTLR3_INPUT_STREAM *inputRef, pSimpleCLexer *lexerRef)
{
        pANTLR3_UINT8 data = (pANTLR3_UINT8) string;
        pANTLR3_UINT8 name = (pANTLR3_UINT8) n;
        pANTLR3_INPUT_STREAM input = antlr3StringStreamNew(data, ANTLR3_ENC_UTF8,
                                        (ANTLR3_UINT32) strlen(string), name);
        if (!input)
        {
                ANTLR3_FPRINTF(stderr, "Unable to string stream %s: %s\n", n,
                               strerror(errno));
                return NULL;
        }
        
        pSimpleCLexer lexer = SimpleCLexerNew(input);
        
        if (!lexer)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create lexer for %s: %s\n", n,
                               strerror(errno));
                input->free(input);
                return NULL;
        }
        
        pANTLR3_COMMON_TOKEN_STREAM tstream =
        antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT,
                                         TOKENSOURCE(lexer));
        if (!tstream)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create token source for %s: %s\n",
                               n, strerror(errno));
                lexer->free(lexer);
                input->free(input);
                return NULL;
        }
        
        if (inputRef) *inputRef = input;
        if (lexerRef) *lexerRef = lexer;
        
        return tstream;
}


int check_action(const char *string, const char *name)
{
        int rv = -1;
        
        if (!string) { errno = EINVAL; return rv; }
        if (!name) name = "unknown";

        pANTLR3_INPUT_STREAM input = NULL;
        pSimpleCLexer lexer = NULL;
        pANTLR3_COMMON_TOKEN_STREAM tstream = open_string_stream(string, name,
                                                                 &input, &lexer);
        if (!tstream) goto err2;

        pActionsContainerParser parser = ActionsContainerParserNew(tstream);
        
        if (!parser)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create parser for %s: %s\n",
                               name, strerror(errno));
                goto err3;
        }
        
        /*
         * parse state description and generate AST
         */
        parser->state_description(parser);

        if ( parser->pParser->rec->state->errorCount > 0)
        {
                ANTLR3_FPRINTF(stderr, "Parsing %s returned %d errors\n",
                               name,
                               parser->pParser->rec->state->errorCount);
                goto err4;
        }

        /*
         * everything is fine
         */
        rv = 0;

err4:   parser->free(parser);
err3:   tstream->free(tstream);
err2:   if (lexer) lexer->free(lexer);
        if (input) input->free(input);
        
        return rv;
}



int check_transition(const char *string, const char *name)
{
        int rv = -1;

        if (!string) { errno = EINVAL; return rv; }
        if (!name) name = "unknown";

        pANTLR3_INPUT_STREAM input = NULL;
        pSimpleCLexer lexer = NULL;
        pANTLR3_COMMON_TOKEN_STREAM tstream = open_string_stream(string, name,
                                                                 &input, &lexer);
        if (!tstream) goto err2;
        
        pTransitionContainerParser parser = TransitionContainerParserNew(tstream);
        
        if (!parser)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create parser for %s: %s\n",
                               name, strerror(errno));
                goto err3;
        }
        
        /*
         * parse file and generate AST
         */
        parser->transition(parser);
        
        if ( parser->pParser->rec->state->errorCount > 0)
        {
                ANTLR3_FPRINTF(stderr, "Parsing %s returned %d errors\n",
                               name,
                               parser->pParser->rec->state->errorCount);
                goto err4;
        }

        /*
         * everything is fine
         */
        rv = 0;
        
err4:   parser->free(parser);
err3:   tstream->free(tstream);
err2:   lexer->free(lexer);
        input->free(input);
        
        return rv;
}