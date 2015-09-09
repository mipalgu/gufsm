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
    class ReflectAPI_SupportedTypeTests: public ::testing::Test
    {
    public:
        const char * TEST_FSM_PATH = "../ReflectTestMachines/SupportedTypesTest.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_SupportedTypeTests()
        {
            wrapper = new FSM::MachineWrapper(TEST_FSM_PATH);
            fsm = static_cast<FSM::CLM::VariableTests*>(wrapper->instantiate(0, "VariableTests"));
            metaFSM = wrapper->instantiateMetaMachine(fsm);

        }

        virtual ~ReflectAPI_SupportedTypeTests()
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

    TEST_F(ReflectAPI_SupportedTypeTests, correctType)
    {
        // Checks that types have been recognised correctly
        unsigned int expectedType = 0;
        refl_metaProperty* properties = refl_getMachineMetaProperties(metaFSM, NULL);
        unsigned int numProperties = refl_getNumberOfMachineProperties(metaFSM, NULL);
        for (unsigned int i = 0; i < numProperties; i++)
        {
            refl_type type = static_cast<refl_type>(expectedType++);
            ASSERT_EQ(type, refl_getMetaPropertyType(properties[i], NULL));
        }
    }

    TEST_F(ReflectAPI_SupportedTypeTests, stringConversion)
    {
        char returnBuffer[40];
        unsigned int bufferSize = 40;
        // chars
        for (unsigned int i = 0; i < 3; i++)
        {
            const char * value = "v";
            refl_setMachinePropertyValue_S(metaFSM, i, const_cast<char *>(value), NULL);
            ASSERT_STREQ(value, refl_getMachinePropertyValue_S(metaFSM, i,
                                                returnBuffer, bufferSize, NULL));
        }
        //integers/longs
        for (unsigned int i = 3; i < 20; i++)
        {
            const char * value = "45";
            refl_setMachinePropertyValue_S(metaFSM, i, const_cast<char *>(value), NULL);
            ASSERT_STREQ(value, refl_getMachinePropertyValue_S(metaFSM, i,
                                                returnBuffer, bufferSize, NULL))
                                                << "Expecting " << value << " for property " << i << endl;
        }
        // floats/doubles
        for (unsigned int i = 20; i < 23; i++)
        {
            const char * value = "45.500000";
            refl_setMachinePropertyValue_S(metaFSM, i, const_cast<char *>(value), NULL);
            ASSERT_STREQ(value, refl_getMachinePropertyValue_S(metaFSM, i,
                                                returnBuffer, bufferSize, NULL))
                                                << "Expecting " << value << " for property " << i << endl;

        }
    }
}

#pragma clang diagnostic pop
