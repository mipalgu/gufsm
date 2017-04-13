#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wsign-compare"


#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"
extern "C"
{
    #include "API_MetaProperty_Access.h" //Private implementation
}


using namespace std;

namespace
{


    // The fixture for testing clfsm.
    class ReflectAPI_MetaPropertyString_Tests: public ::testing::Test
    {
    public:
        int testValue;
        const int INITIAL_TEST_VALUE = 45;
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.



        ReflectAPI_MetaPropertyString_Tests()
        {
            metaMachine = refl_initMetaMachine(NULL);
            metaProperty = refl_initMetaProperty(NULL);
            refl_setMachineMetaProperties(metaMachine, &metaProperty, 1, NULL);
            thisTestClass = static_cast<void *>(this);
            testValue = INITIAL_TEST_VALUE;
        }

        virtual ~ReflectAPI_MetaPropertyString_Tests()
        {
            refl_destroyMetaMachine(metaMachine, NULL); //destroys property too if assigned to meta machine
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
        refl_metaProperty metaProperty = NULL;
        refl_metaMachine metaMachine = NULL;
        void * thisTestClass = NULL;
        CLReflectResult result;
    };

    char * getAsString(refl_machine_t machine, refl_userData_t data, char * buffer, unsigned int bufferLen)
    {
        ReflectAPI_MetaPropertyString_Tests* testClass =
                            static_cast<ReflectAPI_MetaPropertyString_Tests*>(machine);
        string str = to_string(testClass->testValue);
        char *returnValue;
        if (buffer)
        {
            refl_strcpy(buffer, str.c_str(), bufferLen);
            returnValue = buffer;
        }
        else
        {
            returnValue = static_cast<char *>(malloc(str.length() + 1));
            refl_strcpy(returnValue, str.c_str(), str.length() + 1);
        }
        return returnValue;

    }

    void setAsString(refl_machine_t machine, refl_userData_t data, char * value)
    {
        ReflectAPI_MetaPropertyString_Tests* testClass = static_cast<ReflectAPI_MetaPropertyString_Tests*>(machine);
        testClass->testValue = stoi(value);
    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, getAsString)
    {
        refl_setMetaPropertyStringFunctions(metaProperty, getAsString, setAsString, NULL);
        char * returnValue = _refl_getPropertyAsString(metaProperty, thisTestClass, NULL, 0,
                                                        &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_TRUE(returnValue != NULL);
        ASSERT_STREQ(std::to_string(this->INITIAL_TEST_VALUE).c_str(), returnValue);
        free(returnValue);
        //Error checking
        returnValue = _refl_getPropertyAsString( metaProperty, NULL, NULL, 0, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        ASSERT_TRUE(returnValue == NULL);
    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, setAsString)
    {
        refl_setMetaPropertyStringFunctions(metaProperty, getAsString, setAsString, NULL);
        string value("46");
        _refl_setPropertyAsString(metaProperty, thisTestClass, &value[0], &result);
        ASSERT_EQ(result, REFL_SUCCESS);
        ASSERT_EQ(stoi(value.c_str()), this->testValue);
        ASSERT_THROW(_refl_setPropertyAsString(metaProperty, thisTestClass, &string("sdf")[0], NULL), invalid_argument);
    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, machinePropertyGetAsString)
    {
        refl_setMachine(metaMachine, this->thisTestClass, NULL);
        refl_setMetaPropertyStringFunctions(metaProperty, getAsString, setAsString, NULL);
        char * returnValue = refl_getMachinePropertyValue_S(metaMachine,
                                0, NULL, 0, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(this->testValue, stoi(returnValue));
        free(returnValue);
    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, machinePropertySetAsString)
    {
        refl_setMachine(metaMachine, this->thisTestClass, NULL);
        refl_setMetaPropertyStringFunctions(metaProperty, getAsString, setAsString, NULL);
        refl_setMachinePropertyValue_S(metaMachine, 0, &string("46")[0], &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        char * returnValue = refl_getMachinePropertyValue_S(metaMachine, 0, NULL, 0, NULL);
        ASSERT_STREQ("46", returnValue);
        free(returnValue);

    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, statePropertyAsString)
    {
        refl_setMachine(metaMachine, this->thisTestClass, NULL);
        refl_metaState metaState = refl_initMetaState(NULL);
        refl_metaProperty prop = refl_initMetaProperty(NULL);
        refl_setMetaPropertyStringFunctions(prop, getAsString, setAsString, NULL);
        refl_setStateMetaProperties(metaState, &prop, 1, NULL);
        refl_setMetaStates(metaMachine, &metaState, 1, NULL);

        refl_setStatePropertyValue_S(metaMachine, 0, 0, &string("46")[0], &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        char * returnValue = refl_getStatePropertyValue_S(metaMachine, 0, 0, NULL, 0, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ("46", returnValue);
        free(returnValue);
    }

    TEST_F(ReflectAPI_MetaPropertyString_Tests, stackAndHeapStringVariable)
    {
        //! Check that if buffer provided it is used, otherwise memory is allocated
        refl_setMachine(metaMachine, this->thisTestClass, NULL);
        refl_setMetaPropertyStringFunctions(metaProperty, getAsString, setAsString, NULL);
        char buffer[20];
        char * returnValue = _refl_getPropertyAsString(metaProperty, this->thisTestClass,
                                        buffer, 20, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(buffer, returnValue);
    }

}

#pragma clang diagnostic pop
