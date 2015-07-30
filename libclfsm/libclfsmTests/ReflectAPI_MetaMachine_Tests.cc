#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

#include <gtest/gtest.h>

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
        refl_metaMachine metaMachine = NULL;
    };

    TEST_F(ReflectAPI_MetaMachine_Tests, initMetaMachine)
    {
        ASSERT_EQ(refl_initMetaMachine(&metaMachine), API_SUCCESS);
        ASSERT_TRUE(metaMachine != NULL) << "Metamachine should not be null" << std::endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, destroyMetaMachine)
    {
        refl_initMetaMachine(&metaMachine);
        ASSERT_EQ(refl_destroyMetaMachine(metaMachine), API_SUCCESS) << "Expecting success" << std::endl;
        ASSERT_NE(refl_destroyMetaMachine(NULL), API_SUCCESS) << "Expecting destroy failure" << std::endl;
    }



}

#pragma clang diagnostic pop
