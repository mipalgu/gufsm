#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"

#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_MetaMachine_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaMachine_Tests()
        {
            // You can do set-up work for each test here.
        }

        virtual ~ReflectAPI_MetaMachine_Tests()
        {
            refl_destroyMetaMachine(metaMachine, NULL);
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

        // Objects declared here can be used by all tests in the test case.
        refl_metaMachine metaMachine = NULL;
    };

    TEST_F(ReflectAPI_MetaMachine_Tests, initMetaMachine)
    {
        CLReflectResult result;
        ASSERT_TRUE(refl_initMetaMachine(&result) != NULL);
        ASSERT_EQ(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, destroyMetaMachine)
    {
        metaMachine = refl_initMetaMachine(NULL);
        CLReflectResult result;
        refl_destroyMetaMachine(metaMachine, &result);
        metaMachine = NULL;
        ASSERT_EQ(REFL_SUCCESS, result) << "Expecting success" << std::endl;
        refl_destroyMetaMachine(NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result) << "Expecting destroy failure" << std::endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, setMachineName)
    {
        char name[] = "Test Name";
        metaMachine = refl_initMetaMachine(NULL);
        CLReflectResult result;
        refl_setMetaMachineName(metaMachine, name, &result);
        ASSERT_EQ(REFL_SUCCESS, result) << "Expecting success" << std::endl;
        refl_setMetaMachineName(metaMachine, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result) << "Expecting failure for null value" << std::endl;

        // Retrieving and checking name value
        CLReflectResult res;
        char* buffer = refl_getMetaMachineName(metaMachine, &res);
        ASSERT_EQ(res, REFL_SUCCESS) << "Expecting successful name retrieval" << std::endl;
        ASSERT_STREQ(name, buffer) << "Expecting names to be equal" << std::endl;
        free(buffer);
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, nullName)
    {
        metaMachine = refl_initMetaMachine(NULL);
        CLReflectResult result;
        char* buffer = refl_getMetaMachineName(metaMachine, &result);
        ASSERT_NE(result, REFL_SUCCESS) << "Expecting failure since name is not set" << endl;
        free(buffer);
        refl_setMetaMachineName(metaMachine, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, emptyStates)
    {
        metaMachine = refl_initMetaMachine(NULL);
        CLReflectResult result;
        int n = refl_getNumberOfStates(metaMachine, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        n = refl_getNumberOfStates(NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
        ASSERT_EQ(n, 0) << "No states added, number of states should = 0" << endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, setStates)
    {
        metaMachine = refl_initMetaMachine(NULL);
        refl_metaState states[1];
        refl_metaState state;
        refl_initMetaState(&state);
        states[0] = state;
        CLReflectResult result;
        refl_setMetaStates(metaMachine, states, 1, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        int numStates = refl_getNumberOfStates(metaMachine, NULL);
        ASSERT_EQ(numStates, 1) << "Expecting just one state" << endl;
        refl_setMetaStates(metaMachine, NULL, 1, &result);
        ASSERT_NE(REFL_SUCCESS, result) << "Expecting failure" << endl;
        refl_setMetaStates(metaMachine, NULL, 0, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, getStates)
    {
        metaMachine = refl_initMetaMachine(NULL);
        refl_metaState states[2];
        refl_initMetaState(&states[0]);
        refl_initMetaState(&states[1]);
        refl_setMetaStates(metaMachine, states, 2, NULL);

        refl_metaState const * retStates;
        ASSERT_EQ(REFL_SUCCESS, refl_getMetaStates(metaMachine, &retStates));
        ASSERT_EQ(states[0], retStates[0]);
        ASSERT_EQ(states[1], retStates[1]);

    }

}

#pragma clang diagnostic pop
