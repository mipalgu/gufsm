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
    class ReflectAPI_VariableTypeTests: public ::testing::Test
    {
    public:
        const char * VARIABLE_TESTS_FSM_PATH = "../ReflectTestMachines/VariableTests.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_VariableTypeTests()
        {
            wrapper = new FSM::MachineWrapper(VARIABLE_TESTS_FSM_PATH);
            fsm = static_cast<FSM::CLM::VariableTests*>(wrapper->instantiate(0, "VariableTests"));
            metaFSM = wrapper->instantiateMetaMachine(fsm);

        }

        virtual ~ReflectAPI_VariableTypeTests()
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

    TEST_F(ReflectAPI_VariableTypeTests, basicTypes)
    {
        refl_type types[] = { REFL_INT, REFL_LONG, REFL_UNSIGNED_INT, REFL_FLOAT, REFL_DOUBLE,
                                REFL_CHAR, REFL_CHAR, REFL_VOID };
        const char * typeStrings[] = { "REFL_INT", "REFL_LONG", "REFL_UNSIGNED_INT", "REFL_FLOAT", "REFL_DOUBLE",
                                        "REFL_CHAR", "REFL_CHAR", "REFL_VOID" };
        unsigned int len = 8; //Length of types[]
        refl_metaProperty* properties = refl_getMachineMetaProperties(metaFSM, NULL);
        for (unsigned int i = 0; i < len; i++)
        {
            refl_type type = refl_getMetaPropertyType(properties[i], &result);
            ASSERT_EQ(REFL_SUCCESS, result);
            ASSERT_EQ(types[i], type) << "Expecting " << typeStrings[i]
                                      << " for type "
                                      << refl_getMetaPropertyTypeAsString(properties[i], NULL)
                                      << endl;
        }
    }

    TEST_F(ReflectAPI_VariableTypeTests, strings)
    {
        unsigned int stringIndex = 8;
        refl_metaProperty* properties = refl_getMachineMetaProperties(metaFSM, NULL);
        refl_type type = refl_getMetaPropertyType(properties[stringIndex], NULL);
        ASSERT_EQ(REFL_STRING, type);
    }

    TEST_F(ReflectAPI_VariableTypeTests, unsignedTests)
    {
        unsigned int unsignedIndex = 2;
        refl_metaProperty us = refl_getMachineMetaProperties(metaFSM, NULL)[unsignedIndex];
        ASSERT_EQ(refl_TRUE, refl_isMetaPropertyUnsigned(us, NULL));
        unsigned int nonUSIndex = 0;
        refl_metaProperty nonUS = refl_getMachineMetaProperties(metaFSM, NULL)[nonUSIndex];
        ASSERT_EQ(refl_FALSE, refl_isMetaPropertyUnsigned(nonUS, NULL));

    }

    TEST_F(ReflectAPI_VariableTypeTests , indirection)
    {
        unsigned int noPointerIndex = 0;
        unsigned int onePointerIndex = 6;
        unsigned int doublePointerIndex = 9;
        refl_metaProperty* props = refl_getMachineMetaProperties(metaFSM, NULL);
        ASSERT_EQ(0, refl_getMetaPropertyIndirection(props[noPointerIndex], NULL));
        ASSERT_EQ(1, refl_getMetaPropertyIndirection(props[onePointerIndex], NULL));
        ASSERT_EQ(2, refl_getMetaPropertyIndirection(props[doublePointerIndex], NULL));
    }

    
}

#pragma clang diagnostic pop
