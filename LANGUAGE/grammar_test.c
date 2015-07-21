//
//  grammar_test.c
//  grammar_test
//
//  Created by René Hexel on 21/08/11.
//  Copyright (c) 2011 ICT. All rights reserved.
//
#include "parse_actions.h"
#include "parse_transitions.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <libgen.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
        bool verbose = false;
        int ch;
        while ((ch = getopt(argc, argv, "v")) != -1) switch(ch)
        {
                case 'v':
                        verbose = true;
                        break;
                default:
                        fprintf(stderr, "Usage: %s [file ...]\n", argv[0]);
                        return EXIT_FAILURE;
        }
        argc -= optind;
        argv += optind;

        while (argc--)
        {
                char *filename = *argv++;
                char *base = basename(filename);

                if (*base == 'A')
                {
                        if (parse_actions(filename, verbose) < 0)
                                printf(" * Parsing unsuccessful: '%s'\n", base);
                }
                else
                {
                        if (parse_transitions(filename, verbose) < 0)
                                printf(" * Parsing unsuccessful: '%s'\n", base);
                }
        }

        return EXIT_SUCCESS;
}
