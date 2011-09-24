/*
 *  FSMTest.mm
 *  
 *  Created by René Hexel on 23/09/11.
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
#include "FSM.h"
#include "FSMAction.h"
#include "FSMActivity.h"
#include "FSMState.h"
#include "FSMTransition.h"
#include "FSMExpression.h"

#import "FSMTest.h"

#define NAME_FIRST_STATE        "First State"
#define NAME_SECOND_STATE       "Second State"
#define ID_FIRST_STATE          1
#define ID_SECOND_STATE         2

using namespace FSM;

@implementation FSMTest

- (void) setUp
{
        [super setUp];

        fsm = new Machine();
        STAssertNotNil((id) fsm, @"Could not construct FSM");
        STAssertEquals((int) fsm->states().size(), 0, @"Expected 0 states, got %d",
                       fsm->states().size());

        firstState = new State();
        STAssertNotNil((id) firstState, @"Could not construct first State");
        STAssertEquals((int) firstState->activity().onEntryActions().size(), 0,
                       @"Expected empty onEntry actions list");
        STAssertEquals((int) firstState->activity().onExitActions().size(), 0,
                       @"Expected empty onExit actions list");
        STAssertEquals((int) firstState->activity().internalActions().size(), 0,
                       @"Expected empty internal actions list");
        firstState->setName(NAME_FIRST_STATE);
        firstState->setStateID(ID_FIRST_STATE);

        onEntry = new PrintStringAction("OnEntry");
        STAssertNotNil((id) onEntry, @"Could not construct OnEntry Action");
        onExit = new PrintingAction<const char *>("OnExit");
        STAssertNotNil((id) onExit, @"Could not construct OnExit Action");
        internal = new PrintingAction<int>(3);
        STAssertNotNil((id) internal, @"Could not construct internal Action");
        sleepAction = new SleepAction(1001);
        STAssertNotNil((id) internal, @"Could not construct sleep Action");

        firstState->activity().addOnEntryAction(onEntry);
        STAssertEquals((int) firstState->activity().onEntryActions().size(), 1,
                       @"Unexpected length of onEntry actions list");
        firstState->activity().addOnExitAction(onExit);
        STAssertEquals((int) firstState->activity().onExitActions().size(), 1,
                       @"Unexpected length of onExit actions list");
        firstState->activity().addInternalAction(internal);
        firstState->activity().addInternalAction(sleepAction);
        STAssertEquals((int) firstState->activity().internalActions().size(), 2,
                       @"Unexpected length of internal actions list");

        fsm->addState(firstState);
        STAssertEquals((int) fsm->states().size(), 1, @"Expected one state");

        secondState = new State();
        STAssertNotNil((id) secondState, @"Could not construct second State");
        STAssertEquals((int) secondState->activity().onEntryActions().size(), 0,
                       @"Expected empty onEntry actions list");
        STAssertEquals((int) secondState->activity().onExitActions().size(), 0,
                       @"Expected empty onExit actions list");
        STAssertEquals((int) secondState->activity().internalActions().size(), 0,
                       @"Expected empty internal actions list");
        secondState->setName(NAME_SECOND_STATE);
        secondState->setStateID(ID_SECOND_STATE);
        
        fsm->addState(secondState);
        STAssertEquals((int) fsm->states().size(), 2, @"Expected two states");

        falseExpression = new Predicate("FALSE", true, true);
        falseTransition = new Transition(firstState, firstState, falseExpression);
        trueExpression  = new Predicate();
        trueTransition  = new Transition(firstState, secondState, trueExpression);

        firstState->addTransition(falseTransition);
        firstState->addTransition(trueTransition);
        STAssertEquals((int) firstState->transitions().size(), 2, @"Expected two transitions");

        backTransition = new Transition(secondState, firstState,
                                           new Predicate("YES", false, true));
        secondState->addTransition(backTransition);
        STAssertEquals((int) secondState->transitions().size(), 1, @"Expected one transitions");
}

- (void) tearDown
{
        delete fsm;
        delete firstState;
        delete secondState;
        delete onEntry;
        delete onExit;
        delete internal;

        delete sleepAction;
        delete falseTransition;
        delete trueTransition;
        delete falseExpression;
        delete trueExpression;

        [super tearDown];
}

- (void) testFSM
{
}

- (void) testFirstState
{
        STAssertEquals(firstState, fsm->states()[0],
                       @"Unexpected first state address");
        STAssertEquals(firstState->stateID(), ID_FIRST_STATE,
                       @"Unexpected first state id");
}


- (void) testOnEntry
{
        STAssertEquals(onEntry, firstState->activity().onEntryActions()[0],
                       @"Unexpected onEntry action address");
        PrintStringAction *a = (PrintStringAction *) onEntry;
        STAssertTrue(a->content() == "OnEntry",
                       @"unexpected OnEntry printing action content");
        for (Action *action: firstState->activity().onEntryActions())
                action->perform(fsm, STAGE_ON_ENTRY, 0);
}



- (void) testOnExit
{
        STAssertEquals(onExit, firstState->activity().onExitActions()[0],
                       @"Unexpected onExit action address");
        PrintingAction<const char *> *a = (PrintingAction<const char *> *) onExit;
        STAssertTrue(strcmp(a->content(), "OnExit") == 0,
                     @"unexpected OnExit printing action content: %s",
                     a->content());
        for (Action *action: firstState->activity().onExitActions())
                action->perform(fsm, STAGE_ON_EXIT, 0);
}



- (void) testInternal
{
        STAssertEquals(internal, firstState->activity().internalActions()[0],
                       @"Unexpected internal action address");
        PrintingAction<int> *a = (PrintingAction<int> *) internal;
        STAssertTrue(a->content() == 3,
                     @"unexpected internal printing action content");
        for (Action *action: firstState->activity().internalActions())
                action->perform(fsm, STAGE_INTERNAL, 0);
}


- (void) testSleep
{
        STAssertEquals(sleepAction,
                       (SleepAction *) firstState->activity().internalActions()[1],
                       @"Unexpected sleep action address");
        STAssertEquals(sleepAction->content(), 1001,
                     @"unexpected internal sleep action content");
        time_t t1 = time(NULL);
        sleepAction->perform(fsm, STAGE_INTERNAL, 0);
        time_t t2 = time(NULL);
        STAssertEquals(t1 + 1, t2, @"unexpected sleep time");
}

- (void) testExpressions
{
        STAssertTrue(trueExpression->evaluate(), @"Expression %s should be true",
                      trueExpression->name().c_str());
        STAssertFalse(trueExpression->isNegation(), @"Expression %s should not be a negation",
                     trueExpression->name().c_str());
        STAssertFalse(falseExpression->evaluate(), @"Expression %s should be false",
                      falseExpression->name().c_str());
        STAssertTrue(falseExpression->isNegation(), @"Expression %s should be a negation",
                      falseExpression->name().c_str());
        STAssertTrue(backTransition->expression()->evaluate(),
                     @"Expression %s should be true",
                     ((Predicate *) backTransition->expression())->name().c_str());
        STAssertTrue(((Predicate *) backTransition->expression())->isNegation(),
                     @"Expression %s should be a negation",
                     ((Predicate *) backTransition->expression())->name().c_str());
}

@end
