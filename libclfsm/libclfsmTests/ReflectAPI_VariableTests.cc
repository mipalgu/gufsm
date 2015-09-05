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
#include "clfsm_machine.h"
#include "CLReflectAPI.h"
#include "VariableTests.h"

using namespace std;



namespace
{

    // The fixture for testing clfsm.
    class ReflectAPI_VariableTests: public ::testing::Test
    {
    public:
        const char * VARIABLE_TESTS_FSM_PATH = "../ReflectTestMachines/VariableTests.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_VariableTests()
        {
            wrapper = new FSM::MachineWrapper(VARIABLE_TESTS_FSM_PATH);
            fsm = static_cast<FSM::CLM::VariableTests*>(wrapper->instantiate(0, "VariableTests"));
            metaFSM = wrapper->instantiateMetaMachine(fsm);

        }

        virtual ~ReflectAPI_VariableTests()
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
        FSM::CLM::VariableTests *fsm;
        refl_metaMachine metaFSM;
        char buffer[40];
        unsigned int bufferLen = 40;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_VariableTests, integers_setAndCheck)
    {
        // First 3 values are int, long, unsigned int
        for (int i = 0; i < 3; i++)
        {
            refl_setMachinePropertyValue_S(metaFSM, i, &string("45")[0], &result);
            ASSERT_EQ(REFL_SUCCESS, result);
            char *checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_EQ(REFL_SUCCESS, result);
            ASSERT_STREQ("45", checkValue) << "Expecting 45 for property " << i << endl;
            free(checkValue);
        }
    }

    TEST_F(ReflectAPI_VariableTests, integers_ErrorHandling)
    {
        for (int i = 0; i < 1; i++)
        {
            refl_setMachinePropertyValue_S(metaFSM, i, &string("---")[0], &result);
            char * checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_STREQ("0", checkValue);
            free(checkValue);
            refl_setMachinePropertyValue_S(metaFSM, i, &string("f")[0], &result);
            checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_STREQ("0", checkValue);
            free(checkValue);

        }
    }

    TEST_F(ReflectAPI_VariableTests, floats_setAndCheck)
    {
        // Variables 4,5 are float, double
        for (int i = 3; i < 5; i++)
        {
            refl_setMachinePropertyValue_S(metaFSM, i, &string("45.5")[0], &result);
            ASSERT_EQ(REFL_SUCCESS, result);
            char *checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_EQ(REFL_SUCCESS, result);
            ASSERT_STREQ("45.500000", checkValue) << "Expecting 45.5 for property " << i << endl;
            free(checkValue);
        }
    }

    TEST_F(ReflectAPI_VariableTests, floats_ErrorHandling)
    {
        for (int i = 3; i < 5; i++)
        {
            refl_setMachinePropertyValue_S(metaFSM, i, &string("")[0], &result);
            char * checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_STREQ("0.000000", checkValue);
            free(checkValue);
            refl_setMachinePropertyValue_S(metaFSM, i, &string("ss")[0], &result);
            checkValue = refl_getMachinePropertyValue_S(metaFSM, i, NULL, 0, &result);
            ASSERT_STREQ("0.000000", checkValue);
        }
    }

    TEST_F(ReflectAPI_VariableTests, chars)
    {
        // 5th variable is char
        unsigned int charVar = 5;
        refl_setMachinePropertyValue_S(metaFSM, charVar, &string("c")[0], &result);
        //Check returned value is buffer
        ASSERT_STREQ(refl_getMachinePropertyValue_S(metaFSM, charVar, buffer, bufferLen, &result), buffer);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ("c", buffer);

        // Check that it fails if buffer is too small
        buffer[0] = 'd';
        refl_getMachinePropertyValue_S(metaFSM, charVar, buffer, 1, NULL);
        ASSERT_STRNE(buffer, "c");


    }

    TEST_F(ReflectAPI_VariableTests, pointers)
    {
        //6, 7 are char* and void*
        unsigned int chrPtrIndex = 6;
        unsigned int voidPtrIndex = 7;

        //Char ptr
        string testValue = "Test";
        refl_setMachinePropertyValue_S(metaFSM, chrPtrIndex, &testValue[0], &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_getMachinePropertyValue_S(metaFSM, chrPtrIndex, buffer, bufferLen, NULL);
        ASSERT_STREQ(testValue.c_str(), buffer);
        char * heapValue = refl_getMachinePropertyValue_S(metaFSM, chrPtrIndex, NULL, bufferLen, NULL);
        ASSERT_NE(heapValue, buffer);
        ASSERT_STREQ(testValue.c_str(), heapValue);
        free(heapValue);

        //Void ptr
        refl_setMachinePropertyValue_V(metaFSM, voidPtrIndex, static_cast<void *>(&testValue), &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        void ** returnValueAddress = static_cast<void **>(refl_getMachinePropertyValue_V(metaFSM, voidPtrIndex, &result));
        string* testValueCopy = static_cast<string *>(*returnValueAddress);
        ASSERT_EQ(&testValue, testValueCopy);
        ASSERT_EQ(REFL_SUCCESS, result);


    }
}

#pragma clang diagnostic pop
