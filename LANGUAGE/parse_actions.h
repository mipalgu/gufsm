//
//  parse_actions.h
//  grammar_test
//
//  Created by René Hexel on 21/08/11.
//  Copyright (c) 2011 Rene Hexel. All rights reserved.
//

#ifndef grammar_test_parse_actions_h
#define grammar_test_parse_actions_h

#undef __block
#define __block antlr_block
#include <antlr3.h>
#undef __block
#define __block __attribute__((__blocks__(byref)))
#undef false
#undef true
#include "SimpleCLexer.h"
#include "ActionsContainerLexer.h"
#include "ActionsContainerParser.h"
#include "ActionsContainer_SimpleCParser.h"
#include "TransitionContainerLexer.h"
#include "TransitionContainerParser.h"
#include "TransitionContainer_SimpleCParser.h"
#undef true
#undef false
#include <stdbool.h>

int parse_actions(const char *filename, bool verbose);

#endif
