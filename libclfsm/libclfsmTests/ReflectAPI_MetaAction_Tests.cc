#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wsign-compare"



#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_MetaAction_Tests: public ::testing::Test
    {

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaAction_Tests()
        {
            action = refl_initMetaAction(NULL);
        }

        virtual ~ReflectAPI_MetaAction_Tests()
        {
            refl_destroyMetaAction(action, NULL);
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {

        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }

        // Objects declared here can be used by all tests in the test case.
        refl_metaAction action;


    };
    //! Test method for state action
    void testStateMethod(void* testObj, void* userData)
    {

    }

    TEST_F(ReflectAPI_MetaAction_Tests, initMetaFunction)
    {
        CLReflectResult result;
        refl_metaAction metaAction = refl_initMetaAction(&result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_TRUE(metaAction != NULL);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, destroyMetaAction)
    {
        CLReflectResult result;
        refl_destroyMetaAction(action, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        action = NULL;
    }

    TEST_F(ReflectAPI_MetaAction_Tests, setActionMethod)
    {
        refl_stateAction_f testMethod = testStateMethod;
        CLReflectResult result;
        refl_setMetaActionMethod(action, testMethod, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setMetaActionMethod(NULL, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, getActionMethod)
    {
        refl_stateAction_f testMethod = testStateMethod;
        refl_setMetaActionMethod(action, testMethod, NULL);

        CLReflectResult result ;
        refl_stateAction_f returnMethod = refl_getMetaActionMethod(action, &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        ASSERT_EQ(testMethod, returnMethod);
        refl_getMetaActionMethod(NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, getUserData)
    {
        refl_userData_t returnData = refl_getMetaActionData(action, NULL);
        ASSERT_TRUE(returnData == NULL);
        int testValue = 1;
        refl_userData_t data = static_cast<refl_userData_t>(&testValue);
        refl_setMetaActionData(action, data, NULL);

        returnData = refl_getMetaActionData(action, NULL);
        ASSERT_EQ(data, returnData);
        ASSERT_EQ(testValue, *static_cast<int*>(returnData));
        CLReflectResult result;
        refl_getMetaActionData(NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, setUserData)
    {
        CLReflectResult result;
        refl_setMetaActionData(action, NULL, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setMetaActionData(NULL, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);

    }



}

#pragma clang diagnostic pop
