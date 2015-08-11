#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wunused-parameter"
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
    class ReflectAPI_MetaAction_Tests: public ::testing::Test
    {

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaAction_Tests()
        {
            refl_initMetaAction(&action);
        }

        virtual ~ReflectAPI_MetaAction_Tests()
        {
            refl_destroyMetaAction(action);
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
        refl_metaAction metaAction;
        ASSERT_EQ(refl_initMetaAction(&metaAction), REFL_SUCCESS);
        ASSERT_TRUE(metaAction != NULL);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, destroyMetaAction)
    {
        ASSERT_EQ(refl_destroyMetaAction(action), REFL_SUCCESS);
        action = NULL;
    }

    TEST_F(ReflectAPI_MetaAction_Tests, setActionMethod)
    {
        refl_stateAction_f testMethod = testStateMethod;
        ASSERT_EQ(refl_setMetaActionMethod(action, testMethod), REFL_SUCCESS);
        ASSERT_NE(refl_setMetaActionMethod(NULL, NULL), REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, getActionMethod)
    {
        refl_stateAction_f testMethod = testStateMethod;
        refl_setMetaActionMethod(action, testMethod);
        refl_stateAction_f returnMethod;
        int result = refl_getMetaActionMethod(action, &returnMethod);
        ASSERT_EQ(result, REFL_SUCCESS);
        ASSERT_EQ(testMethod, returnMethod);
        ASSERT_NE(refl_getMetaActionMethod(NULL, &returnMethod), REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, getUserData)
    {
        refl_userData_t returnData;
        refl_getMetaActionData(action, &returnData);
        ASSERT_TRUE(returnData == NULL);
        int testValue = 1;
        refl_userData_t data = static_cast<refl_userData_t>(&testValue);
        refl_setMetaActionData(action, data);

        refl_getMetaActionData(action, &returnData);
        ASSERT_EQ(data, returnData);
        ASSERT_EQ(testValue, *static_cast<int*>(returnData));
        ASSERT_NE(REFL_SUCCESS, refl_getMetaActionData(NULL, &returnData));
    }

    TEST_F(ReflectAPI_MetaAction_Tests, setUserData)
    {
        ASSERT_EQ(refl_setMetaActionData(action, NULL), REFL_SUCCESS);
        ASSERT_NE(refl_setMetaActionData(NULL, NULL), REFL_SUCCESS);

    }



}

#pragma clang diagnostic pop
