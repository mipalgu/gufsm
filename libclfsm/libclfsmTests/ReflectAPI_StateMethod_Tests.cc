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
    class ReflectAPI_StateMethod_Tests: public ::testing::Test
    {

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_StateMethod_Tests()
        {
            refl_initMetaAction(&action);
            refl_initMetaState(&state);
            refl_initMetaMachine(&machine);
            refl_setMachine(machine, this);
            n = N_START_VAL;

        }

        virtual ~ReflectAPI_StateMethod_Tests()
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
        refl_metaState state;
        refl_metaMachine machine;
        refl_metaState* states;

    public:
        static const int N_START_VAL = 0;
        int n; //Variable used to check if test method runs


    };

    //! Test method for state action
    void testStateMethod(refl_machine_t testObj, refl_userData_t userData)
    {
        ReflectAPI_StateMethod_Tests* tests = static_cast<ReflectAPI_StateMethod_Tests*>(testObj);
        int num = *static_cast<int*>(userData);
        tests->n += num;
    }

    TEST_F(ReflectAPI_StateMethod_Tests, setOnEntry)
    {
        ASSERT_EQ(refl_setOnEntry(state, action), REFL_SUCCESS);
        ASSERT_NE(refl_setOnEntry(state, NULL), REFL_SUCCESS);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, invokeOnEntry)
    {
        refl_setMetaActionMethod(action, testStateMethod);
        int data = 1;
        refl_setMetaActionData(action, static_cast<refl_userData_t>(&data));
        refl_setOnEntry(state, action);

        states[0] = state;
        refl_setMetaStates(machine, states, 1);

        refl_invokeOnEntry(machine, 0);
        ASSERT_EQ(n, N_START_VAL + data);



    }



}

#pragma clang diagnostic pop
