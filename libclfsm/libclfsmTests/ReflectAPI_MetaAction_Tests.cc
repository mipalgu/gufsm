#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wunused-parameter"


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
            n = 0;
            refl_initMetaAction(&action);
        }

        virtual ~ReflectAPI_MetaAction_Tests()
        {
            // You can do clean-up work that doesn't throw exceptions here.
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

        public:
            int n;







    };

    void testStateMethod(void* testObj, void* userData)
    {
        ReflectAPI_MetaAction_Tests* test = static_cast<ReflectAPI_MetaAction_Tests*>(testObj);
        test->n++;
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
        refl_userData_t data = NULL;
        refl_setMetaActionData(action, data);

    }

}

#pragma clang diagnostic pop
