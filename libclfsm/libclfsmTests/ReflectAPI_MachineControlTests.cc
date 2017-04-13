#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#pragma clang diagnostic ignored "-Wsign-compare"


#include <gtest/gtest.h>
#include <string>
#include <unistd.h>
#include <cstdio>
#include <limits>
#include "clfsm_machine.h"
#include "CLReflectAPI.h"
#include "MachineControlTest.h"

using namespace std;



namespace
{

    // The fixture for testing clfsm.
    class ReflectAPI_MachineControlTests: public ::testing::Test
    {
    public:
        const char * TEST_FSM_PATH = "../ReflectTestMachines/MachineControlTest.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MachineControlTests()
        {
            wrapper = new FSM::MachineWrapper(TEST_FSM_PATH);
            fsm = static_cast<FSM::CLM::MachineControlTest*>(wrapper->instantiate(0, "MachineControlTest"));
            metaFSM = wrapper->instantiateMetaMachine(fsm);

        }

        virtual ~ReflectAPI_MachineControlTests()
        {
            delete(fsm);
            delete(wrapper);
            refl_destroyMetaMachine(metaFSM, NULL);
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {
            if (!wrapper || !fsm || !metaFSM)
                throw;
        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }

        FSM::MachineWrapper *wrapper;
        FSM::CLM::MachineControlTest *fsm;
        refl_metaMachine metaFSM;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_MachineControlTests, initialState)
    {
        unsigned int initialState = 0;
        unsigned int currentState = refl_getCurrentState(metaFSM, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(initialState, currentState);
    }

    TEST_F(ReflectAPI_MachineControlTests, previousState)
    {
        int nullPrevState = -1;
        int prevState = refl_getPreviousState(metaFSM, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(nullPrevState, prevState);
        unsigned int newPrevState = 1;
        refl_setPreviousState(metaFSM, newPrevState, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        prevState = refl_getPreviousState(metaFSM, &result);
        ASSERT_EQ(newPrevState, prevState);
    }

    TEST_F(ReflectAPI_MachineControlTests, suspendState)
    {
        int expectedSuspendState = 2;
        int suspendState = refl_getSuspendState(metaFSM, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(expectedSuspendState, suspendState);
        unsigned int newSuspendState = 0;
        refl_setSuspendState(metaFSM, newSuspendState, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(static_cast<int>(newSuspendState), refl_getSuspendState(metaFSM, NULL));
    }
}

#pragma clang diagnostic pop
