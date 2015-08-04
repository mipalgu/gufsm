#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

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
            // You can do set-up work for each test here.
        }

        virtual ~ReflectAPI_MetaAction_Tests()
        {
            // You can do clean-up work that doesn't throw exceptions here.
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
        refl_metaAction action = NULL;

    };

    TEST_F(ReflectAPI_MetaAction_Tests, initMetaFunction)
    {
        ASSERT_EQ(refl_initMetaAction(&action), API_SUCCESS);
        ASSERT_TRUE(action != NULL);
    }

    TEST_F(ReflectAPI_MetaAction_Tests, destroyMetaAction)
    {
        ASSERT_EQ(refl_destroyMetaAction(action), API_SUCCESS);
    }



}

#pragma clang diagnostic pop
