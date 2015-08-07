
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"


#include <gtest/gtest.h>
#include "clfsm_vector_factory.h"

#include "CLReflectAPI.h"

#include "DummyMachines.h"

using namespace std;
using namespace FSM;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_Init_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_Init_Tests()
        {
            refl_initMetaMachine(&metaMachine);
        }

        virtual ~ReflectAPI_Init_Tests()
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
        refl_metaMachine metaMachine;
    };

    TEST_F(ReflectAPI_Init_Tests, registerMetaMachine)
    {
        ASSERT_EQ(refl_registerMetaMachine(metaMachine, 0), REFL_SUCCESS);
        ASSERT_NE(refl_registerMetaMachine(metaMachine, 0), REFL_SUCCESS) << "Expecting fail for reuse of id" << endl;
        ASSERT_NE(refl_registerMetaMachine(NULL, 1), REFL_SUCCESS) << "Expecting fail for NULL machine" << endl;

    }


}

#pragma clang diagnostic pop
