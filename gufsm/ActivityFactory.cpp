/*
 *  ActivityFactory.cpp
 *  
 *  Created by René Hexel on 28/08/11.
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
#include "FSMachine.h"
#include "FSMState.h"
#include "FSMActivity.h"
#include "ActivityFactory.h"
#include "FSMANTLRAction.h"
#include "FSMANTLRContext.h"

extern "C"
{
#include "parser_walk.h"        
}

using namespace FSM;
using namespace std;

static int
vardef_callback(void *context, const char *terminal, const char *content,
             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        Machine *fsm = self->fsm();
        ANTLRContext *antlr_context = (ANTLRContext *) fsm->context();

        DATA_TYPES defaultType = TYPE_BOOLEAN;
    
        //fsm->addState(self->state());
        if (string("K_INT_TYPE") == terminal)         /* variable type*/
            {
            DBG( std:: cerr << "setting type to Int " <<std::endl;)
            defaultType=TYPE_NON_NEGATIVE_INT;
            }

        if (string("K_ID") == terminal)         /* variable name */
        {
                antlr_context->set_internal_variable(content, fsm->id(),0,defaultType);
                return 0;                       /* no children */
        }

        /* XXX: we don't worry about types at the moment */
       /** Would like to distinguish NON-NEGATIVE INTEGERS from BOOleans */

        return 1;
}


static int
vardef_pop(void *context, const char *terminal, const char *content,
           pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        //ActivityFactory *self = (ActivityFactory *) context;
        //self->fsm()->addState(self->state());
        
        return 1;
}


static int
block_callback(void *context, const char *terminal, const char *content,
            pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        DBG(cout << __FUNCTION__ << "(" << terminal << ", " << content << ")" <<
            endl);

        assert(terminal);       /* must not be nil */

        if (string("VAR_DEF") == terminal)      /* internal variable */
        {
                if (walk_parse_children(state, tree, vardef_callback,
                                        NULL, vardef_pop, context) == -1)
                        return 0;
                return 0;
        }
        if (string("STATEMENT_LIST") == terminal)       /* actions */
        {
                self->set_action(new ANTLRAction(tree, state));
                self->action()->set_external_variables(self->fsm());
                DBG( cout << "* ANTLRAction " << (long) self->action() << endl);
                return 0;
        }

        cerr << "Ignoring unexpected block token '" << terminal
             << "' with content '" << content << "'" << endl;
        
        return 1;
}

static int
block_pop(void *context, const char *terminal, const char *content,
        pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        Activity &activity = self->state()->activity();
        FSM::ANTLRAction *action = self->action();

        if (!action) return 1;

        switch (self->stage())
        {
                case STAGE_ON_ENTRY:
                        activity.addOnEntryAction(action);
                        break;
                        
                case STAGE_ON_EXIT:
                        activity.addOnExitAction(action);
                        break;
                        
                case STAGE_INTERNAL:
                        activity.addInternalAction(action);
                        break;
                        
                default:
                        cerr << "Unknown stage '" << self->stage() << "'" << endl;
                        return -1;
        }

        self->set_action(NULL);

        return 1;
}



static int
action_callback(void *context, const char *terminal, const char *content,
                pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        //ActivityFactory *self = (ActivityFactory *) context;

        DBG(cout << __FUNCTION__ << "(" << terminal << ", " << content << ")" <<
            endl);

        assert(terminal);                       /* must not be nil */

        if (string("BLOCK") == terminal)        /* block in curly brackets? */
        {
                if (walk_parse_children(state, tree, block_callback,
                                        NULL, block_pop, context) == -1)
                        return -1;
                return 0;
        }
        if (string("EOL") == terminal)        /* ignore EOL */
                return 0;

        DBG(cerr << "Ignoring unexpected action block token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
statename_callback(void *context, const char *terminal, const char *content,
                   pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        assert(terminal);                       /* must not be nil */

        if (content && string("K_ID") == terminal)/* state name (ID) */
        {
                self->state()->setName(content);

                return -2;              /* skip subsequent state names */
        }

        DBG(cerr << "Ignoring unexpected state name token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}

static int
state_push(void *context, const char *terminal, const char *content,
           pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        assert(terminal);                       /* must not be nil */

        if (string("STATENAME") == terminal)    /* state name? */
        {
                if (walk_parse_children(state, tree, statename_callback,
                                          NULL, NULL, context) == -1)
                        return -1;
                return 0;
        }
        if (string("ONENTRY") == terminal)      /* onEntry activities */
        {
                self->set_stage(STAGE_ON_ENTRY);
                if (walk_parse_children(state, tree, action_callback,
                                          NULL, NULL, context) == -1)
                        return -1;
                return 0;
        }
        if (string("ONEXIT") == terminal)       /* onExit activities */
        {
                self->set_stage(STAGE_ON_EXIT);
                if (walk_parse_children(state, tree, action_callback,
                                          NULL, NULL, context) == -1)
                        return -1;
                return 0;
        }
        if (string("INTERNALPART") == terminal) /* internal activities */
        {
                self->set_stage(STAGE_INTERNAL);
                if (walk_parse_children(state, tree, action_callback,
                                          NULL, NULL, context) == -1)
                        return -1;
                return 0;
        }
        
        DBG(cerr << "Ignoring unexpected state token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
activity_push(void *context, const char *terminal, const char *content,
              pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        if (!terminal) return 1;        /* ignore root push */

        if (string("K_INT") == terminal)  /* state ID? */
        {
                int sid = atoi(content);
                if (self->fsm()->stateForID(sid))
                {
                        cerr << "BAD ACTIVITY FILE: duplicate state "
                             << sid << endl;
                        return -1;
                }
                self->set_state(new State(sid));

                if (!self->state())
                {
                        cerr << "OUT OF MEMORY adding state " << sid << endl;
                        return -1;
                }

                if (walk_parse_children(state, tree, NULL,
                                          state_push, NULL, context) == -1)
                        return -1;
                return 0;
        }

        DBG(cerr << "Ignoring unexpected activity token '" << terminal <<
            "' with content '" << content << "'" << endl);

        return 1;
}

static int
activity_pop(void *context, const char *terminal, const char *content,
             pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        DBG(cout << "activity pop (" << terminal << ") content: " << content << endl);
        if (string("K_INT") == terminal)  /* popping a state id? */
                self->fsm()->addState(self->state());

        return 1;
}

ActivityFactory::ActivityFactory(FSM::Machine *machine, const char *filename,
                                 map<std::string, Action *> *func):
        _fsm(machine), _file(filename), _error(false),
        _named_actions(func), _currentAction(NULL), _currentStage(STAGE_ON_ENTRY),
        _currentState(NULL)
{
        if (parse_actions(filename, NULL, activity_push, activity_pop, this) == -1)
                set_error(true);
}
