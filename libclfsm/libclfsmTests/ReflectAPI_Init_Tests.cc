#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"

#include <gtest/gtest.h>
#include <string>
#include "clfsm_vector_factory.h"

#include "CLReflectAPI.h"

#include "DummyMachines.h"

using namespace std;
using namespace FSM;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_Init_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_Init_Tests()
        {
            metaMachine = refl_initMetaMachine(NULL);
        }

        virtual ~ReflectAPI_Init_Tests()
        {
            refl_destroyMetaMachine(metaMachine, NULL);
            refl_destroyAPI();
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {
            // Code here will be called immediately after the constructor (right
            // before each test).
        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }
        refl_metaMachine metaMachine;
    };

    TEST_F(ReflectAPI_Init_Tests, initAPI)
    {
        ASSERT_EQ(refl_initAPI(), REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_Init_Tests, destroyAPI)
    {
        ASSERT_EQ(refl_destroyAPI(), REFL_INVALID_CALL) << "Expecting invalid as API not inited" << endl;
        refl_initAPI();
        ASSERT_EQ(refl_destroyAPI(), REFL_SUCCESS) << "Expecting successful destroy after API init" << endl;
    }

    TEST_F(ReflectAPI_Init_Tests, registerMetaMachine)
    {
        refl_initAPI();
        ASSERT_EQ(refl_registerMetaMachine(metaMachine, 0), REFL_SUCCESS);
        ASSERT_EQ(refl_registerMetaMachine(metaMachine, 10), REFL_SUCCESS);
        ASSERT_EQ(refl_registerMetaMachine(metaMachine, 50), REFL_SUCCESS);
        ASSERT_NE(refl_registerMetaMachine(metaMachine, 0), REFL_SUCCESS) << "Expecting fail for reuse of id" << endl;
        ASSERT_NE(refl_registerMetaMachine(NULL, 1), REFL_SUCCESS) << "Expecting fail for NULL machine" << endl;
    }

    TEST_F(ReflectAPI_Init_Tests, getMetaMachine)
    {
        refl_initAPI();
        refl_registerMetaMachine(metaMachine, 0);
        refl_metaMachine returnMach;
        ASSERT_EQ(refl_getMetaMachine(0, &returnMach), REFL_SUCCESS);
        ASSERT_EQ(metaMachine, returnMach);
        ASSERT_EQ(refl_getMetaMachine(1, &returnMach), REFL_INVALID_ARGS);
    }

    TEST_F(ReflectAPI_Init_Tests, testPingPong)
    {
        refl_metaMachine pingPong = createPingPong();
        char* buffer = refl_getMetaMachineName(pingPong, NULL);
        ASSERT_STREQ("PingPongCLFSM", buffer);
        int numStates = refl_getNumberOfStates(pingPong, NULL);
        ASSERT_EQ(2, numStates);
        refl_metaState const * states = refl_getMetaStates(pingPong, NULL);

        char pingBuffer[20];
        refl_getMetaStateName(states[0], pingBuffer, 20);
        ASSERT_STREQ("Ping", pingBuffer);
        char pongBuffer[20];
        refl_getMetaStateName(states[1],pongBuffer, 20);
        ASSERT_STREQ("Pong", pongBuffer);
    }


}

#pragma clang diagnostic pop
