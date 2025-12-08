^{
        <#code#>
}/*
 *  FSMTest.mm
 *
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011, 2014 Rene Hexel.
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
#ifndef WITHOUT_LIBDISPATCH
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#include <dispatch/dispatch.h>
#pragma clang diagnostic pop
#else
#include <thread>
#include <chrono>
#endif

#include "FSMWB.h"
#include "Whiteboard.h"

#import "FSMTest.h"

#if !defined(WHITEBOARD_OLD_H) && !defined(_BOOST_WHITEBOARD_H_)
namespace guWhiteboard
{
        static const char *kUpdateProof = "updateProofsForOutput";
}
#endif

static const char *state_names[5] =
{
        "First State",
        "Second State",
        "Third State (WB)",
        "Fourth State (WBq)",
        "Exit State"
};

#define NAME_FIRST_STATE        (state_names[0])
#define NAME_SECOND_STATE       (state_names[1])
#define NAME_THIRD_STATE        (state_names[2])
#define NAME_FOURTH_STATE       (state_names[3])
#define NAME_EXIT_STATE         (state_names[4])
#define ID_FIRST_STATE          1
#define ID_SECOND_STATE         2
#define ID_THIRD_STATE          3
#define ID_FOURTH_STATE         4
#define ID_EXIT_STATE           5

#define falseTransition         (transition[0])
#define trueTransition          (transition[1])
#define wbTransition            (transition[2])
#define wbqTransition           (transition[3])
#define finalTransition         (transition[4])

#define WBMSGTXT                "WBTest"

#define UTIMEOUT                5000

using namespace std;
using namespace FSM;
using namespace guWhiteboard;

class WBCallbackTest
{
        Whiteboard *wb;
        FSMTest *self;

public:
        WBCallbackTest(Whiteboard *w, FSMTest *t): wb(w), self(t)
        {
                Whiteboard::WBResult result = Whiteboard::METHOD_OK;

                wb->subscribeToMessage(kUpdateProof, WB_BIND(WBCallbackTest::wb_callback), result);

                STAssertEquals(result, Whiteboard::METHOD_OK, @"Callback subscription unexpectedly failed");

        }

        virtual ~WBCallbackTest()
        {
                Whiteboard::WBResult result = Whiteboard::METHOD_OK;

                wb->unsubscribeToMessage(kUpdateProof, result);

                STAssertEquals(result, Whiteboard::METHOD_OK, @"Unsubscription unexpectedly failed");
        }

        void wb_callback(string dataName, WBMsg *msg)
        {
                STAssertTrue(strcmp(dataName.c_str(), kUpdateProof) == 0, @"Expected %s on callback", kUpdateProof);
                STAssertEquals(msg->getType(), WBMsg::TypeString, @"Expected string message, but got %d", msg->getType());
                string content = msg->getStringValue();
                STAssertTrue(strcmp(content.c_str(), WBMSGTXT) == 0, @"Expected '%s', but got '%s'", WBMSGTXT, content.c_str());
                wb->addMessage(content, WBMsg(false));
        }
};


@implementation FSMTest

- (void) setUp
{
        [super setUp];

        /*
         * Whiteboard
         */
        context = new WBContext();
        STAssertNotNil((id) context, @"Could not construct FSM WB Context");

        Whiteboard *wb = context->whiteboard();
        STAssertNotNil((id) wb, @"Whiteboard should not be nil");

        callbackTest = new WBCallbackTest(wb, self);

        /*
         * Suspensible State Machine
         */
        fsm = new SuspensibleMachine(NULL, context);
        STAssertNotNil((id) fsm, @"Could not construct FSM");
        STAssertNil((id) fsm->suspendState(), @"should not have a suspend state");
        STAssertEquals((int) fsm->states().size(), 0, @"Expected 0 states, got %d",
                       fsm->states().size());

        for (int i = 0; i < sizeof(state)/sizeof(state[0]); i++)
        {
                state[i] = new State();
                STAssertNotNil((id) state[i], @"Could not construct State %d", i);
                STAssertEquals((int) state[i]->activity().onEntryActions().size(), 0,
                               @"Expected empty onEntry actions list");
                STAssertEquals((int) state[i]->activity().onExitActions().size(), 0,
                               @"Expected empty onExit actions list");
                STAssertEquals((int) state[i]->activity().internalActions().size(), 0,
                               @"Expected empty internal actions list");
                state[i]->setName(state_names[i]);
                state[i]->setStateID(i+1);
                fsm->addState(state[i]);
                STAssertEquals((int) fsm->states().size(), i+1, @"Expected %d states", i);

        }

        onEntry = new PrintStringAction("OnEntry");
        STAssertNotNil((id) onEntry, @"Could not construct OnEntry Action");
        onExit = new PrintingAction<const char *>("OnExit");
        STAssertNotNil((id) onExit, @"Could not construct OnExit Action");
        internal = new PrintingAction<int>(3);
        STAssertNotNil((id) internal, @"Could not construct internal Action");
        sleepAction = new SleepAction(1001);
        STAssertNotNil((id) internal, @"Could not construct sleep Action");

        state[0]->activity().addOnEntryAction(onEntry);
        STAssertEquals((int) state[0]->activity().onEntryActions().size(), 1,
                       @"Unexpected length of onEntry actions list");
        state[0]->activity().addOnExitAction(onExit);
        STAssertEquals((int) state[0]->activity().onExitActions().size(), 1,
                       @"Unexpected length of onExit actions list");
        state[0]->activity().addInternalAction(internal);
        state[0]->activity().addInternalAction(sleepAction);
        STAssertEquals((int) state[0]->activity().internalActions().size(), 2,
                       @"Unexpected length of internal actions list");

        falseExpression = new Predicate("FALSE", true, true);
        falseTransition = new Transition(state[0], state[3], falseExpression);
        trueExpression  = new Predicate();
        trueTransition  = new Transition(state[0], state[1], trueExpression);
        timeoutPredicate = new TimeoutPredicate(UTIMEOUT);

        state[0]->addTransition(falseTransition);
        state[0]->addTransition(trueTransition);
        STAssertEquals((int) state[0]->transitions().size(), 2, @"Expected two transitions");

        wbPredicate = new WBPredicate("WBTest", false, context);
        wbPredicate->setValue(false);   // clear any old WB content
        wbTransition = new Transition(state[1], state[2], (WBExpression *) wbPredicate);

        state[1]->addTransition(wbTransition);

        wbQueryPredicate = new WBQueryPredicate("WBTest", true, context);
        wbqTransition = new Transition(state[2], state[3], (WBExpression *) wbQueryPredicate);

        state[2]->addTransition(wbqTransition);

        finalTransition = new Transition(state[3], state[4],
                                           new Predicate("YES", false, true));
        state[3]->addTransition(finalTransition);
        STAssertEquals((int) state[1]->transitions().size(), 1, @"Expected one transition");
        STAssertEquals((int) state[4]->transitions().size(), 0, @"Expected no transitions out of final state");
}

- (void) tearDown
{
        delete fsm;
        delete context;
        delete state[0];
        delete state[1];
        delete onEntry;
        delete onExit;
        delete internal;

        delete sleepAction;
        delete falseTransition;
        delete trueTransition;
        delete falseExpression;
        delete trueExpression;

        delete callbackTest;

        [super tearDown];
}

- (void) testFSM
{
        STAssertEquals(fsm->context(), (Context *) context, @"Unexpected context");
        /*
         * run once
         */
        fsm->initialise();
        STAssertFalse(fsm->isSuspended(), @"should not be suspended");
        STAssertTrue(fsm->previousState() == NULL, @"Unexpected previous state");
        STAssertEquals(fsm->currentState(), state[0], @"Unexpected initial state");
        bool cont = fsm->executeOnce();
        STAssertTrue(cont, @"State machine should not be done yet");
        STAssertEquals(fsm->currentState(), state[1], @"Unexpected second state");
        STAssertEquals(fsm->previousState(), state[0], @"Unexpected previous state");
        cont = fsm->executeOnce();
        STAssertTrue(cont, @"State machine should not be done yet");
        STAssertEquals(fsm->currentState(), state[1], @"Unexpected second state");
        STAssertEquals(fsm->previousState(), state[1], @"Unexpected previous state");
        static_cast<WBPredicate *>((WBExpression *)wbTransition->expression())->setValue(true);
        cont = fsm->executeOnce();
        STAssertTrue(cont, @"State machine should not be done yet");
        STAssertEquals(fsm->currentState(), state[2], @"Unexpected current state");
        STAssertEquals(fsm->previousState(), state[1], @"Unexpected previous state");
        /*
         * suspend
         */
        fsm->suspend();
        STAssertTrue(fsm->isSuspended(), @"should now be suspended");
        STAssertNotNil((id) fsm->suspendState(), @"should now have a suspend state");
        STAssertEquals(fsm->currentState(), fsm->suspendState(), @"Unexpected suspend state");
        STAssertEquals(fsm->previousState(), state[2], @"Unexpected previous state");
        STAssertFalse(timeoutPredicate->evaluate(fsm), @"suspend state should not have timed out yet");
        usleep(UTIMEOUT);
        STAssertTrue(timeoutPredicate->evaluate(fsm), @"suspend state should have timed out by now");

        /*
         * resume
         */
        fsm->resume();
        STAssertFalse(fsm->isSuspended(), @"should not be suspended");
        STAssertNotNil((id) fsm->suspendState(), @"should still have a suspend state");
        STAssertEquals(fsm->previousState(), fsm->suspendState(), @"Unexpected previous state");
        STAssertEquals(fsm->currentState(), state[2], @"Unexpected state (should be state 2)");

        /*
         * query the whiteboard and wait for response
         */
        STAssertTrue(wbPredicate->evaluate(), @"WB Predicate should be true now");
        cont = fsm->executeOnce();
        STAssertTrue(cont, @"State machine should not be done yet");
        STAssertEquals(fsm->currentState(), state[3], @"Unexpected current state");
        STAssertEquals(fsm->previousState(), state[2], @"Unexpected previous state");
        STAssertFalse(wbPredicate->evaluate(), @"WB Predicate should be false now");

        cont = fsm->executeOnce();
        STAssertTrue(cont, @"State machine should not be done yet");
        STAssertEquals(fsm->currentState(), state[4], @"Unexpected current state");
        STAssertEquals(fsm->previousState(), state[3], @"Unexpected previous state");
        STAssertFalse(wbPredicate->evaluate(), @"WB Predicate should still be false now");

        cont = fsm->executeOnce();
        STAssertFalse(cont, @"State machine should be done by now");
        /*
         * run again (just once), this time from second state
         */
        State *last = fsm->restart(state[1]);
        STAssertFalse(fsm->isSuspended(), @"should not be suspended");
        STAssertEquals(last, state[4], @"Unexpected state prior to restart");
        STAssertTrue(fsm->previousState() == NULL, @"Unexpected previous state");
        STAssertEquals(fsm->currentState(), state[1], @"Unexpected initial state");
        fsm->executeOnce();
        STAssertEquals(fsm->currentState(), state[1], @"Should have stayed in 1 due to WB false");
        /*
         * run fully, from first state
         */
        last = fsm->restart();
        STAssertFalse(fsm->isSuspended(), @"should not be suspended");
        STAssertEquals(last, state[1], @"Unexpected state prior to restart");
        STAssertTrue(fsm->previousState() == NULL, @"Unexpected previous state");
        STAssertEquals(fsm->currentState(), state[0], @"Unexpected initial state");
        STAssertFalse(wbPredicate->evaluate(), @"WB Predicate should be false now");
        [self setWBAfterOneSecondTo: true];
        fsm->execute();
        STAssertEquals(fsm->currentState(), state[4], @"Unexpected exit state");
        STAssertFalse(wbPredicate->evaluate(), @"WB Predicate should again be false now");
}

- (void) testFirstState
{
        STAssertEquals(fsm->states()[0], state[0],
                       @"Unexpected first state address");
        STAssertEquals(state[0]->stateID(), ID_FIRST_STATE,
                       @"Unexpected first state id");
}


- (void) testSecondState
{
        STAssertEquals(fsm->states()[1], state[1],
                       @"Unexpected second state address");
        STAssertEquals(state[1]->stateID(), ID_SECOND_STATE,
                       @"Unexpected second state id");
}


- (void) testFinalState
{
        STAssertEquals(fsm->states()[4], state[4],
                       @"Unexpected exit state address");
        STAssertEquals(state[4]->stateID(), ID_EXIT_STATE,
                       @"Unexpected exit state id");
}


- (void) testOnEntry
{
        STAssertEquals(onEntry, state[0]->activity().onEntryActions()[0],
                       @"Unexpected onEntry action address");
        PrintStringAction *a = (PrintStringAction *) onEntry;
        STAssertTrue(a->content() == "OnEntry",
                       @"unexpected OnEntry printing action content");
        for (Action *action: state[0]->activity().onEntryActions())
                action->perform(fsm, STAGE_ON_ENTRY, 0);
}



- (void) testOnExit
{
        STAssertEquals(onExit, state[0]->activity().onExitActions()[0],
                       @"Unexpected onExit action address");
        PrintingAction<const char *> *a = (PrintingAction<const char *> *) onExit;
        STAssertTrue(strcmp(a->content(), "OnExit") == 0,
                     @"unexpected OnExit printing action content: %s",
                     a->content());
        for (Action *action: state[0]->activity().onExitActions())
                action->perform(fsm, STAGE_ON_EXIT, 0);
}



- (void) testInternal
{
        STAssertEquals(internal, state[0]->activity().internalActions()[0],
                       @"Unexpected internal action address");
        PrintingAction<int> *a = (PrintingAction<int> *) internal;
        STAssertTrue(a->content() == 3,
                     @"unexpected internal printing action content");
        for (Action *action: state[0]->activity().internalActions())
                action->perform(fsm, STAGE_INTERNAL, 0);
}


- (void) testSleep
{
        STAssertEquals(sleepAction,
                       (SleepAction *) state[0]->activity().internalActions()[1],
                       @"Unexpected sleep action address");
        STAssertEquals(sleepAction->content(), 1001,
                     @"unexpected internal sleep action content");
        time_t t1 = time(NULL);
        sleepAction->perform(fsm, STAGE_INTERNAL, 0);
        time_t t2 = time(NULL);
        STAssertEquals(t1 + 1, t2, @"unexpected sleep time of %ld s", t2-t1);
}

/*
 * The following test as well as the Whiteboard tests require
 * handle SIGUSR1 nostop pass
 * in your ~/.gdbinit file!
 */
- (void) testInterruptedSleep
{
#ifndef WITHOUT_LIBDISPATCH
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 50 * NSEC_PER_USEC);
        dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
        ^{
                kill(getpid(), SIGUSR1);
                usleep(1);
                kill(getpid(), SIGUSR1);
        });
#else
        std::thread([this]() {
                std::this_thread::sleep_for(std::chrono::microseconds(50));
                kill(getpid(), SIGUSR1);
                usleep(1);
                kill(getpid(), SIGUSR1);
        }).detach();
#endif
        time_t t1 = time(NULL);
        sleepAction->perform(fsm, STAGE_INTERNAL, 0);
        time_t t2 = time(NULL);
        STAssertEquals(t1 + 1, t2, @"unexpected interrupted sleep of %ld s", t2-t1);
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
        STAssertTrue(finalTransition->expression()->evaluate(),
                     @"Expression %s should be true",
                     ((Predicate *) finalTransition->expression())->name().c_str());
        STAssertTrue(((Predicate *) finalTransition->expression())->isNegation(),
                     @"Expression %s should be a negation",
                     ((Predicate *) finalTransition->expression())->name().c_str());
        STAssertFalse(timeoutPredicate->evaluate(), @"NULL machine should never time out");
}


- (void) setWBAfterOneSecondTo: (bool) trueOrFalse
{
#ifndef WITHOUT_LIBDISPATCH
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
                       ^{
                               static_cast<WBPredicate *>((WBExpression *)wbTransition->expression())->setValue(trueOrFalse);
                       });
#else
        std::thread([this, trueOrFalse]() {
                std::this_thread::sleep_for(std::chrono::seconds(1));
                static_cast<WBPredicate *>((WBExpression *)wbTransition->expression())->setValue(trueOrFalse);
        }).detach();
#endif
}



@end
