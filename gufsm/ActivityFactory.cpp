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
#include "Machine.h"
#include "Activity.h"
#include "ActivityFactory.h"

extern "C"
{
#include "parser_walk.h"        
}

using namespace FSM;
using namespace std;

static int
wb_pop(void *context, const char *terminal, const char *content,
       pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        p_onePost newPost = new onePost();
        
        newPost->setMessageType(self->wb_name());
        newPost->setDoing(self->wb_content());
        
        self->activity()->addOnePostToPossiblePostsByStage(self->stage(),
                                                               newPost);
        return 1;
}

static int
wb_callback(void *context, const char *terminal, const char *content,
            pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        
        DBG(cout << __FUNCTION__ << "(" << terminal << ", " << content << ")" <<
            endl);

        assert(terminal);       /* must not be nil */

        /*
         * whiteboard message content
         * XXX: this is ugly: for the lexer to be unique knowledge about
         * SEP_CONTENT starting with a colon and possible whitespaces needs
         * to be passed into here rather than handled directly by the parser.
         */
        if (string("WHITEBOARD_SEP_CONTENT") == terminal)
        {
                assert(':' == content[0]);      /* must start with ':' */

                const char *s = content + 1;    /* skip ':' */
                while (isspace(*s)) s++;        /* skip whitespace */
                self->set_wb_content(s);
                
                wb_pop(context, terminal, s, state, tree);

                return 0;                       /* no children */
        }

        cerr << "Ignoring unexpected whiteboard token '" << terminal
             << "' with content '" << content << "'" << endl;

        return 1;
}




static int
cpp_callback(void *context, const char *terminal, const char *content,
            pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;
        
        DBG(cout << __FUNCTION__ << "(" << terminal << ", " << content << ")" <<
            endl);
        
        assert(terminal);       /* must not be nil */

        if (string("ID") == terminal)           /* C+++ ID */
        {
                self->set_wb_name(content);     /* store as name */

                return 1;                       /* parse children */
        }
        if (string("INT") == terminal)          /* integer parameter */
        {
                char *guts = (char *) atol(content);
                self->set_cpp_content(guts);    /* store as name */

                return 0;                       /* no children */
        }
        if (string("STRING_LITERAL") == terminal) /* string parameter */
        {                                       /* strip quotes */
                int len = strlen(content);
                assert('"' == content[0]);      /* must start with " */
                assert(len >= 2);               /* at least two chars */

                char *guts = gu_strdup(content + 1);    // XXX: needs to be freed in destructor!
                guts[len-2] = '\0';             /* delete closing " */
                self->set_cpp_content(guts);    /* store as name */

                return 0;                       /* no children */
        }

        cerr << "Ignoring unexpected C++ token '" << terminal
             << "' with content '" << content << "'" << endl;
        
        return 1;
}

static int
cpp_pop(void *context, const char *terminal, const char *content,
        pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        if (!self->named_functions()) return 1;

        fsm_callback_f func = (*self->named_functions())[self->wb_name()];

        self->activity()->set_activity(self->stage(), func,
                                           self->cpp_content());
        return 1;
}



static int
action_callback(void *context, const char *terminal, const char *content,
                pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        DBG(cout << __FUNCTION__ << "(" << terminal << ", " << content << ")" <<
            endl);

        assert(terminal);                       /* must not be nil */

        if (string("ID") == terminal)           /* whiteboard message? */
        {
                self->set_wb_name(content);
                if (walk_parse_children(state, tree, wb_callback,
                                          NULL, wb_pop, context) == -1)
                        return -1;
                return 0;
        }
        if (string("CPLUSPLUS") == terminal)    /* C++ activity? */
        {
                if (walk_parse_children(state, tree, cpp_callback,
                                          NULL, cpp_pop, context) == -1)
                        return -1;
                return 0;
        }
        if (string("SEMICOLON") == terminal)    /* end? */
                return 0;
        if (string("SLASH") == terminal)        /* onEntry/Exit termination? */
                return 0;

        DBG(cerr << "Ignoring unexpected state name token '" << terminal <<
            "' with content '" << content << "'" << endl);
        
        return 1;
}


static int
statename_callback(void *context, const char *terminal, const char *content,
                   pANTLR3_RECOGNIZER_SHARED_STATE state, pANTLR3_BASE_TREE tree)
{
        ActivityFactory *self = (ActivityFactory *) context;

        assert(terminal);                       /* must not be nil */

        if (content && string("ID") == terminal)/* state name (ID) */
        {
                self->set_state_name(content);

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

        if (string("INT") == terminal)  /* state ID? */
        {
                self->set_state_id(atoi(content));
                if (self->fsm()->exists_already(self->state_id()))
                {
                        cerr << "BAD ACTIVITY FILE: duplicate state "
                             << self->state_id() << endl;
                        return -1;
                }
                Activity *a = new Activity();
                if (!a)
                {
                        cerr << "CANNOT CREATE ACTIVITY for state "
                             << self->state_id() << endl;
                        return -1;
                }
                self->set_activity(a);
                self->set_state_name("NONAME");

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
        fmsActivity *activity = self->activity();
        
        if (activity)
        {
                fsmState *newState = new fsmState(self->state_id(),
                                                  self->state_name(),
                                                  activity);
                if (newState)
                        self->fsm()->addState(newState);
                else
                {
                        cerr << "OUT OF MEMORY adding state "
                             << self->state_id() << " '"
                             << self->state_name() << "'" << endl;
                        return -1;
                }
                self->set_activity(NULL);
        }
        return 1;
}

ActivityFactory::ActivityFactory(FSM::Machine *machine, const char *filename,
                                 map<std::string, Action *> *func):
        _fsm(machine), _file(filename), _currentActivity(NULL), _error(false),
        _named_functions(func), _state_id(-1), _state_name("unknown")
{
        if (parse_actions(filename, NULL, activity_push, activity_pop, this) == -1)
                set_error(true);
}
