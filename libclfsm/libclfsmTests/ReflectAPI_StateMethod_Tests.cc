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
    void testStateMethod(refl_machine_t testObj, refl_userData_t userData);

    // The fixture for testing clfsm.
    class ReflectAPI_StateMethod_Tests: public ::testing::Test
    {

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_StateMethod_Tests()
        {
            refl_initMetaAction(&action);
            state = refl_initMetaState(NULL);
            machine = refl_initMetaMachine(NULL);
            refl_setMachine(machine, this, NULL);
            n = N_START_VAL;
            incValue = 1;

            refl_setMetaActionMethod(action, testStateMethod);

            refl_setMetaActionData(action, static_cast<refl_userData_t>(&incValue));

            states[0] = state;
            refl_setMetaStates(machine, states, 1, NULL);

        }

        virtual ~ReflectAPI_StateMethod_Tests()
        {

            //refl_destroyMetaMachine(machine);
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
        refl_metaState states[1];
        int incValue;

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
        CLReflectResult result;
        refl_setOnEntry(state, action, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setOnEntry(state, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, setInternal)
    {
        CLReflectResult result;
        refl_setInternal(state, action, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setInternal(state, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, setOnExit)
    {
        CLReflectResult result;
        refl_setOnExit(state, action, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setOnExit(state, NULL, &result);
        ASSERT_NE(REFL_SUCCESS, result);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, invokeOnEntry)
    {
        refl_setOnEntry(state, action, NULL);
        refl_invokeOnEntry(machine, 0, NULL);
        ASSERT_EQ(n, N_START_VAL + incValue);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, invokeInternal)
    {
        refl_setInternal(state, action, NULL);
        refl_invokeInternal(machine, 0, NULL);
        ASSERT_EQ(n, N_START_VAL + incValue);
    }

    TEST_F(ReflectAPI_StateMethod_Tests, invokeOnExit)
    {
        refl_setOnExit(state, action, NULL);
        refl_invokeOnExit(machine, 0, NULL);
        ASSERT_EQ(n, N_START_VAL + incValue);
    }

}

#pragma clang diagnostic pop
