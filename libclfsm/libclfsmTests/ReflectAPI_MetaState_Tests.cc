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
    const char* STATE_0 = "STATE_0";
    const char* STATE_1 = "STATE_1";
    // The fixture for testing clfsm.
    class ReflectAPI_MetaState_Tests: public ::testing::Test
    {
    public:


    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaState_Tests()
        {

        }

        virtual ~ReflectAPI_MetaState_Tests()
        {
            refl_destroyMetaState(metaState, NULL);
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
        refl_metaState metaState = NULL;
    };


    void setStates(refl_metaMachine machine)
    {
        refl_metaState states[2];
        states[0] = refl_initMetaState(NULL);
        refl_setMetaStateName(states[0], STATE_0, NULL);
        states[1] = refl_initMetaState(NULL);
        refl_setMetaStateName(states[1], STATE_1, NULL);
        refl_setMetaStates(machine, states, 2, NULL);
    }

    TEST_F(ReflectAPI_MetaState_Tests, initMetaState)
    {
        CLReflectResult result;
        metaState = refl_initMetaState(&result);
        ASSERT_EQ(REFL_SUCCESS, result) << "Expecting REFL_SUCCESS" << endl;
        ASSERT_TRUE(metaState != NULL) << "Ptr should not be null " << endl;

    }

    TEST_F(ReflectAPI_MetaState_Tests, destroyMetaState)
    {
        CLReflectResult result;
        metaState = refl_initMetaState(NULL);
        refl_destroyMetaState(metaState, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        metaState = NULL;
    }

    TEST_F(ReflectAPI_MetaState_Tests, setStateName)
    {
        char name[] = "Test Name";
        metaState = refl_initMetaState(NULL);
        CLReflectResult result;
        refl_setMetaStateName(metaState, name, &result);
        ASSERT_EQ(REFL_SUCCESS, result) << "Expecting success" << std::endl;
        refl_setMetaStateName(metaState, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result) << "Expecting failure for null value" << std::endl;

        // Retrieving and checking name value
        CLReflectResult res;
        char* buffer = refl_getMetaStateName(metaState, &res);
        ASSERT_EQ(res, REFL_SUCCESS) << "Expecting successful name retrieval" << std::endl;
        ASSERT_STREQ(name, buffer) << "Expecting names to be equal" << std::endl;
        free(buffer);
    }

    TEST_F(ReflectAPI_MetaState_Tests, statesOnStack)
    {
        refl_metaMachine machine = refl_initMetaMachine(NULL);
        setStates(machine);
        int numStates = refl_getNumberOfStates(machine, NULL);
        ASSERT_EQ(2, numStates);
        refl_metaState const * states = refl_getMetaStates(machine, NULL);
        char *buffer = refl_getMetaStateName(states[0], NULL);
        ASSERT_STREQ(STATE_0, buffer);
        buffer = refl_getMetaStateName(states[1], NULL);
        ASSERT_STREQ(STATE_1, buffer);
        free(buffer);


    }

}

#pragma clang diagnostic pop
