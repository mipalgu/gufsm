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
    class ReflectAPI_MetaTransition_Tests: public ::testing::Test
    {
    public:


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
        int result;
        refl_metaTransition trans = refl_initMetaTransition(&result);
        ASSERT_FALSE(trans == NULL);
        ASSERT_EQ(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_MetaTransition_Tests, destroyMetaTransition)
    {
        int result;
        refl_destroyMetaTransition(transition, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        transition = NULL; // So it won't get destroyed twice
        refl_destroyMetaTransition(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }


}

#pragma clang diagnostic pop
