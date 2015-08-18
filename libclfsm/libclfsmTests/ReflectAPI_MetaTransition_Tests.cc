#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wunused-parameter"

#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_MetaTransition_Tests: public ::testing::Test
    {
    public:
        refl_bool truthVal;

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaTransition_Tests()
        {
            transition = refl_initMetaTransition(NULL);

        }

        virtual ~ReflectAPI_MetaTransition_Tests()
        {
            refl_destroyMetaTransition(transition, NULL);
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
        refl_metaTransition transition;
    };

    TEST_F(ReflectAPI_MetaTransition_Tests, initMetaTransition)
    {
        CLReflectResult result;
        refl_metaTransition trans = refl_initMetaTransition(&result);
        ASSERT_FALSE(trans == NULL);
        ASSERT_EQ(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, destroyMetaTransition)
    {
        CLReflectResult result;
        refl_destroyMetaTransition(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        transition = NULL; // So it won't get destroyed twice
        refl_destroyMetaTransition(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, transitionTarget)
    {
        CLReflectResult result;
        unsigned int target = 1;
        refl_setMetaTransitionTarget(transition, target, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        unsigned int retTarget = refl_getMetaTransitionTarget(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(target, retTarget);
        refl_setMetaTransitionTarget(NULL, target, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_getMetaTransitionTarget(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, transitionSource)
    {
        CLReflectResult result;
        unsigned int source = 1;
        refl_setMetaTransitionSource(transition, source, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        unsigned int retTarget = refl_getMetaTransitionSource(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(source, retTarget);
        refl_setMetaTransitionSource(NULL, source, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_getMetaTransitionSource(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    refl_bool testEvalMethod(refl_machine_t machine, refl_userData_t data)
    {
        return refl_TRUE;
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, evalMethod)
    {
        CLReflectResult result;
        int data = 42;
        refl_transitionEval_f func = testEvalMethod;
        refl_setMetaTransitionEvalFunction(transition, func, static_cast<void*>(&data), &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_transitionEval_f retFunc = refl_getMetaTransitionEvalFunction(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(func, retFunc);
        refl_userData_t retData = refl_getMetaTransitionData(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(data, *static_cast<int*>(retData));
        refl_getMetaTransitionData(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_setMetaTransitionEvalFunction(NULL, NULL, NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        retFunc = refl_getMetaTransitionEvalFunction(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        ASSERT_TRUE(retFunc == NULL);
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, transitionExpression)
    {
        CLReflectResult result;
        const char * expression = "true";
        refl_setMetaTransitionExpression(transition, expression, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        char * retExpression = refl_getMetaTransitionExpression(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ(expression, retExpression);

        //Failures
        refl_setMetaTransitionExpression(transition, NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_getMetaTransitionExpression(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

}

#pragma clang diagnostic pop
