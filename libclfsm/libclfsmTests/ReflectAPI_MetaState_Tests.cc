#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

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
            refl_destroyMetaState(metaState);
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
        refl_initMetaState(&states[0]);
        refl_setMetaStateName(states[0], STATE_0);
        refl_initMetaState(&states[1]);
        refl_setMetaStateName(states[1], STATE_1);
        refl_setMetaStates(machine, states, 2);
    }

    TEST_F(ReflectAPI_MetaState_Tests, initMetaState)
    {
        ASSERT_EQ(refl_initMetaState(&metaState), REFL_SUCCESS) << "Expecting REFL_SUCCESS" << endl;
        ASSERT_TRUE(metaState != NULL) << "Ptr should not be null " << endl;

    }

    TEST_F(ReflectAPI_MetaState_Tests, destroyMetaState)
    {
        refl_initMetaState(&metaState);
        ASSERT_EQ(refl_destroyMetaState(metaState), REFL_SUCCESS);
        metaState = NULL;
    }

    TEST_F(ReflectAPI_MetaState_Tests, setStateName)
    {
        char name[] = "Test Name";
        refl_initMetaState(&metaState);
        ASSERT_EQ(refl_setMetaStateName(metaState, name), REFL_SUCCESS) << "Expecting success" << std::endl;
        ASSERT_NE(refl_setMetaStateName(metaState, NULL), REFL_SUCCESS) << "Expecting failure for null value" << std::endl;

        // Retrieving and checking name value
        char buffer[20];
        CLReflectResult res = refl_getMetaStateName(metaState, buffer, 20);
        ASSERT_EQ(res, REFL_SUCCESS) << "Expecting successful name retrieval" << std::endl;
        ASSERT_STREQ(name, buffer) << "Expecting names to be equal" << std::endl;
    }

    TEST_F(ReflectAPI_MetaState_Tests, bufferOverflow)
    {
        char name[] = "Test Name";
        refl_initMetaState(&metaState);
        refl_setMetaStateName(metaState, name);

        char buffer[9];
        int bufferLen = 9;
        CLReflectResult res = refl_getMetaStateName(metaState, buffer, bufferLen);
        ASSERT_EQ(res, REFL_BUFFER_OVERFLOW) << "Expecting buffer overflow since buffer is too small" << std::endl;
    }

    TEST_F(ReflectAPI_MetaState_Tests, statesOnStack)
    {
        refl_metaMachine machine;
        refl_initMetaMachine(&machine);
        setStates(machine);
        int numStates;
        refl_getNumberOfStates(machine, &numStates);
        ASSERT_EQ(2, numStates);
        refl_metaState const * states;
        refl_getMetaStates(machine, &states);
        char buffer[20];
        refl_getMetaStateName(states[0], buffer, 20);
        ASSERT_STREQ(STATE_0, buffer);
        refl_getMetaStateName(states[1], buffer, 20);
        ASSERT_STREQ(STATE_1, buffer);


    }

}

#pragma clang diagnostic pop
