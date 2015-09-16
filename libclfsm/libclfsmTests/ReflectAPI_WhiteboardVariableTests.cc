#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#pragma clang diagnostic ignored "-Wsign-compare"
//#pragma clang diagnostic ignored "-Wdelete-incomplete"

#include <gtest/gtest.h>
#include <string>
#include <unistd.h>
#include <cstdio>
#include <limits>
#include "clfsm_machine.h"
#include "CLMachine.h"
#include "CLReflectAPI.h"

using namespace std;



namespace
{

    // The fixture for testing clfsm.
    class ReflectAPI_WhiteboardVariableTests: public ::testing::Test
    {
    public:
        const char * TEST_FSM_PATH = "../ReflectTestMachines/WhiteboardVariableTest.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_WhiteboardVariableTests()
        {
            wrapper = new FSM::MachineWrapper(TEST_FSM_PATH);
            fsm = static_cast<FSM::CLMachine*>(wrapper->instantiate(0, "WhiteboardVariableTest"));
            metaFSM = wrapper->instantiateMetaMachine(fsm);

        }

        virtual ~ReflectAPI_WhiteboardVariableTests()
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
        FSM::CLMachine *fsm;
        refl_metaMachine metaFSM;
        char buffer[40];
        unsigned int bufferLen = 40;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_WhiteboardVariableTests, settingAndGetting)
    {
        // Property is a Point2D wb type
        unsigned int propIndex = 0;
        char * setValue = const_cast<char *>("45,45");
        refl_setMachinePropertyValue_S(metaFSM, propIndex, setValue, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_getMachinePropertyValue_S(metaFSM, propIndex, buffer, bufferLen, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ(setValue, buffer);
    }

}

#pragma clang diagnostic pop
