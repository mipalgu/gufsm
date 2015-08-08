#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_MetaState_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaState_Tests()
        {
            // You can do set-up work for each test here.
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

}

#pragma clang diagnostic pop
