//
//  parse_transitions.c
//  grammar_test
//
//  Created by René Hexel on 21/08/11.
//  Copyright (c) 2011 Rene Hexel. All rights reserved.
//
#include "parse_actions.h"
#include "parse_transitions.h"

#include <stdio.h>
#include <string.h>
#include <libgen.h>
#include <errno.h>

#include "TransitionContainerParser.h"
#include "TransitionContainerLexer.h"

int ANTLR3_CDECL
parse_transitions(const char *filename, bool verbose)
{
        int rv = -1;

        if (!filename) filename = "/dev/stdin";

        pANTLR3_UINT8 file_name = (pANTLR3_UINT8) filename;
        pANTLR3_INPUT_STREAM input = antlr3FileStreamNew(file_name, ANTLR3_ENC_UTF8);

        if (!input)
        {
                ANTLR3_FPRINTF(stderr, "Unable to open file %s: %s\n",
                               filename, strerror(errno));
                return -1;
        }

        pTransitionContainerLexer lexer = TransitionContainerLexerNew(input);

        if (!lexer)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create lexer for %s: %s\n",
                               filename, strerror(errno));
                goto err1;
        }

        pANTLR3_COMMON_TOKEN_STREAM tstream =
                antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, TOKENSOURCE(lexer));
        if (!tstream)
        {
                ANTLR3_FPRINTF(stderr, "Unable to create token source for %s: %s\n",
                               filename, strerror(errno));
                goto err2;
        }
        
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
        TransitionContainerParser_transitions_return TransitionsAST = parser->transitions(parser);

        if ( parser->pParser->rec->state->errorCount > 0)
        {
                ANTLR3_FPRINTF(stderr, "Parsing %s returned %d errors, tree walking aborted.\n",
                               filename,
                               parser->pParser->rec->state->errorCount);
                goto err4;
        }

        if (verbose)
                printf("Tree:\n%s\n", TransitionsAST.tree->toStringTree(TransitionsAST.tree)->chars);
        else
                printf("OK: '%s'\n", basename((char *) filename));

        rv = 0;

err4:   parser->free(parser);
err3:   tstream->free(tstream);
err2:   lexer->free(lexer);
err1:   input->free(input);

        return rv;
}