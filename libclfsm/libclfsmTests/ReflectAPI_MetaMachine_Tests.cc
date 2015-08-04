#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

#include <gtest/gtest.h>
#include <string>
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
        ASSERT_EQ(refl_initMetaMachine(&metaMachine), REFL_SUCCESS);
        ASSERT_TRUE(metaMachine != NULL) << "Metamachine should not be null" << std::endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, destroyMetaMachine)
    {
        refl_initMetaMachine(&metaMachine);
        ASSERT_EQ(refl_destroyMetaMachine(metaMachine), REFL_SUCCESS) << "Expecting success" << std::endl;
        ASSERT_NE(refl_destroyMetaMachine(NULL), REFL_SUCCESS) << "Expecting destroy failure" << std::endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, setMachineName)
    {
        char name[] = "Test Name";
        refl_initMetaMachine(&metaMachine);
        ASSERT_EQ(refl_setMetaMachineName(metaMachine, name), REFL_SUCCESS) << "Expecting success" << std::endl;
        ASSERT_NE(refl_setMetaMachineName(metaMachine, NULL), REFL_SUCCESS) << "Expecting failure for null value" << std::endl;

        // Retrieving and checking name value
        char buffer[20];
        CLReflectResult res = refl_getMetaMachineName(metaMachine, buffer, 20);
        ASSERT_EQ(res, REFL_SUCCESS) << "Expecting successful name retrieval" << std::endl;
        ASSERT_TRUE(strcmp(name, buffer)) << "Expecting names to be equal" << std::endl;
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, nullName)
    {
        refl_initMetaMachine(&metaMachine);
        char buffer[20];
        CLReflectResult result = refl_getMetaMachineName(metaMachine, buffer, 20);
        ASSERT_NE(result, REFL_SUCCESS) << "Expecting failure since name is not set" << endl;
        ASSERT_NE(refl_setMetaMachineName(metaMachine, NULL), REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_MetaMachine_Tests, bufferOverFlowTest)
    {
        char name[] = "Test Name";
        refl_initMetaMachine(&metaMachine);
        refl_setMetaMachineName(metaMachine, name);

        char buffer[9];
        int bufferLen = 9;
        CLReflectResult res = refl_getMetaMachineName(metaMachine, buffer, bufferLen);
        ASSERT_EQ(res, REFL_BUFFER_OVERFLOW) << "Expecting buffer overflow since buffer is too small" << std::endl;
    }



}

#pragma clang diagnostic pop
