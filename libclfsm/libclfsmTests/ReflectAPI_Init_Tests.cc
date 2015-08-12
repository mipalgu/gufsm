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
            refl_destroyAPI(NULL);
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
        CLReflectResult result;
        refl_initAPI(&result);
        ASSERT_EQ(result, REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_Init_Tests, destroyAPI)
    {
        CLReflectResult result;
        refl_destroyAPI(&result);
        ASSERT_EQ(result, REFL_INVALID_CALL) << "Expecting invalid as API not inited" << endl;
        refl_initAPI(NULL);
        refl_destroyAPI(&result);
        ASSERT_EQ(result, REFL_SUCCESS) << "Expecting successful destroy after API init" << endl;
    }

    TEST_F(ReflectAPI_Init_Tests, registerMetaMachine)
    {
        refl_initAPI(NULL);
        CLReflectResult result;
        refl_registerMetaMachine(metaMachine, 0, &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        refl_registerMetaMachine(metaMachine, 10, &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        refl_registerMetaMachine(metaMachine, 50, &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        refl_registerMetaMachine(metaMachine, 0, &result);
        ASSERT_NE(result, REFL_SUCCESS) << "Expecting fail for reuse of id" << endl;
        refl_registerMetaMachine(NULL, 1, &result);
        ASSERT_NE(result, REFL_SUCCESS) << "Expecting fail for NULL machine" << endl;
    }

    TEST_F(ReflectAPI_Init_Tests, getMetaMachine)
    {
        refl_initAPI(NULL);
        refl_registerMetaMachine(metaMachine, 0, NULL);
        CLReflectResult result;
        refl_metaMachine returnMach = refl_getMetaMachine(0, &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        ASSERT_EQ(metaMachine, returnMach);
        refl_getMetaMachine(1, &result);
        ASSERT_EQ(result, REFL_INVALID_ARGS);
    }

    TEST_F(ReflectAPI_Init_Tests, testPingPong)
    {
        refl_metaMachine pingPong = createPingPong();
        char* buffer = refl_getMetaMachineName(pingPong, NULL);
        ASSERT_STREQ("PingPongCLFSM", buffer);
        int numStates = refl_getNumberOfStates(pingPong, NULL);
        ASSERT_EQ(2, numStates);
        refl_metaState const * states = refl_getMetaStates(pingPong, NULL);

        char* pingBuffer = refl_getMetaStateName(states[0], NULL);
        ASSERT_STREQ("Ping", pingBuffer);
        free(pingBuffer);
        char* pongBuffer = refl_getMetaStateName(states[1], NULL);
        ASSERT_STREQ("Pong", pongBuffer);
        free(pongBuffer);
    }


}

#pragma clang diagnostic pop
