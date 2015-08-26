#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wdeprecated"

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
    class ReflectAPI_MetaProperty_Tests: public ::testing::Test
    {
    public:
        int testValue;
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaProperty_Tests()
        {
            metaProperty = refl_initMetaProperty(NULL);
        }

        virtual ~ReflectAPI_MetaProperty_Tests()
        {
            refl_destroyMetaProperty(metaProperty, NULL);
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
    };

    TEST_F(ReflectAPI_MetaProperty_Tests, initandDestroyMetaProperty)
    {
        CLReflectResult result;
        refl_metaProperty property = refl_initMetaProperty(&result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_destroyMetaProperty(property, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_destroyMetaProperty(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    int value;
    void set(refl_machine_t machine, refl_userData_t data, void* val)
    {
        value = *static_cast<int*>(val);
    }

    void* get(refl_machine_t machine, refl_userData_t data)
    {
        return static_cast<void*>(&value);
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, setAndGetVoid)
    {
        CLReflectResult result;
        refl_setMetaPropertyVoidFunctions(metaProperty, get, set, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setMetaPropertyVoidFunctions(NULL, get, set, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_setMetaPropertyVoidFunctions(metaProperty, get, NULL, &result);
        ASSERT_EQ(REFL_SUCCESS, result);

    }

    void setString(refl_machine_t machine, refl_userData_t data, char const * val)
    {

    }

    char const * getString(refl_machine_t machine, refl_userData_t data)
    {
        return  NULL;
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, setAndGetString)
    {
        CLReflectResult result;
        refl_setMetaPropertyStringFunctions(metaProperty, getString, setString, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setMetaPropertyStringFunctions(NULL, getString, setString, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_setMetaPropertyStringFunctions(metaProperty, getString, NULL, &result);
        ASSERT_EQ(REFL_SUCCESS, result);

    }

    TEST_F(ReflectAPI_MetaProperty_Tests, setUserData)
    {
        CLReflectResult result;
        refl_setMetaPropertyData(metaProperty, NULL, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_setMetaPropertyData(NULL, NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, name)
    {
        CLReflectResult result;
        char const * name = "TestName";
        refl_setMetaPropertyName(metaProperty, name, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        char const * ret = refl_getMetaPropertyName(metaProperty, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ(name, ret);

        refl_setMetaPropertyName(NULL, name, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_getMetaPropertyName(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);

    }

    TEST_F(ReflectAPI_MetaProperty_Tests, type)
    {
        CLReflectResult result;
        char const * name = "TestName";
        refl_setMetaPropertyType(metaProperty, name, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        char const * ret = refl_getMetaPropertyType(metaProperty, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_STREQ(name, ret);

        refl_setMetaPropertyType(NULL, name, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_getMetaPropertyType(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, machineProperties)
    {
        refl_metaMachine machine = refl_initMetaMachine(NULL);
        refl_metaProperty properties[] = { metaProperty };
        CLReflectResult result;
        refl_setMachineMetaProperties(machine, properties, 1, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(1, refl_getNumberOfMachineProperties(machine, &result));
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_metaProperty const *retProperties = refl_getMachineMetaProperties(machine, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(properties[0], retProperties[0]);

        //Error handling
        refl_setMachineMetaProperties(machine, NULL, 0, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_getMachineMetaProperties(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);

        metaProperty = NULL; // So we don't delete twice in destructor
        refl_destroyMetaMachine(machine, NULL);
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, stateProperties)
    {
        refl_metaState metaState = refl_initMetaState(NULL);

        refl_metaProperty properties[] = { metaProperty };
        CLReflectResult result;
        refl_setStateMetaProperties(metaState, properties, 1, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(1, refl_getNumberOfStateProperties(metaState, &result));
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_metaProperty const *retProperties = refl_getStateMetaProperties(metaState, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(properties[0], retProperties[0]);

        //Error handling
        refl_setStateMetaProperties(metaState, NULL, 0, &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        refl_getStateMetaProperties(NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
    }

    void setAsVoid(refl_machine_t machine, refl_userData_t data, void* newValue)
    {
        ReflectAPI_MetaProperty_Tests* tests = static_cast<ReflectAPI_MetaProperty_Tests*>
                                                    (machine);
        tests->testValue = *static_cast<int*>(newValue);
    }

    void* getAsVoid(refl_machine_t machine, refl_userData_t data)
    {
        ReflectAPI_MetaProperty_Tests* tests = static_cast<ReflectAPI_MetaProperty_Tests*>
                                                    (machine);
        return static_cast<void*>(&tests->testValue);
    }


    TEST_F(ReflectAPI_MetaProperty_Tests, getAsVoid)
    {
        CLReflectResult result;
        refl_setMetaPropertyVoidFunctions(metaProperty, getAsVoid, setAsVoid, &result);
        ASSERT_EQ(REFL_SUCCESS, result);

        int val = 0;
        this->testValue = val;
        void* testClass = static_cast<void*>(this);

        int retVal = *static_cast<int*>(_refl_getPropertyAsVoid(metaProperty, testClass, &result));
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(this->testValue, retVal);
        ++val;

        _refl_setPropertyAsVoid(metaProperty, testClass, static_cast<void*>(&val),
                                    &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(val, testValue);
        //Error handling
        void* badReturnVal = _refl_getPropertyAsVoid(metaProperty, NULL, &result);
        ASSERT_TRUE(badReturnVal == NULL);
        ASSERT_EQ(REFL_INVALID_ARGS, result);

        //Create new property without setting functions
        refl_metaProperty prop = refl_initMetaProperty(NULL);
        _refl_setPropertyAsVoid(prop, testClass, NULL, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        badReturnVal = _refl_getPropertyAsVoid(prop, testClass, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        refl_destroyMetaProperty(prop, NULL);
    }

    TEST_F(ReflectAPI_MetaProperty_Tests, machinePropertyGetAsVoid)
    {
        refl_metaMachine machine = refl_initMetaMachine(NULL);
        void* testClass = static_cast<void*>(this);
        refl_setMachine(machine, testClass, NULL);
        refl_setMetaPropertyVoidFunctions(metaProperty, getAsVoid, setAsVoid, NULL);
        refl_metaProperty properties[] = { metaProperty };
        refl_setMachineMetaProperties(machine, properties, 1, NULL);

        //Setup values
        int val = 45;
        this->testValue = val;
        //Get value and check its right
        CLReflectResult result;
        int retVal = *static_cast<int *>(refl_getMachinePropertyValue_V(machine,
                                            0, &result));
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(this->testValue, retVal);
        ++val;
        refl_setMachinePropertyValue_V(machine, 0, static_cast<void*>(&val), &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(val, this->testValue);
        metaProperty = NULL;
        refl_destroyMetaMachine(machine, NULL);

    }

    TEST_F(ReflectAPI_MetaProperty_Tests, statePropertyGetAsVoid)
    {
        CLReflectResult result;
        refl_metaMachine machine = refl_initMetaMachine(&result);
        void* testClass = static_cast<void*>(this);
        refl_setMachine(machine, testClass, &result);
        refl_metaState state = refl_initMetaState(&result);
        refl_setMetaPropertyVoidFunctions(metaProperty, getAsVoid, setAsVoid, &result);
        refl_setStateMetaProperties(state, &metaProperty, 1, &result);
        refl_setMetaStates(machine, &state, 1, &result);

        //Setup values
        int val = 45;
        this->testValue = val;
        //Get value and check its right

        int retVal = *static_cast<int *>(refl_getStatePropertyValue_V(machine,
                                            0, 0, &result));
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(this->testValue, retVal);
        ++val;
      refl_setStatePropertyValue_V(machine, 0, 0, static_cast<void*>(&val), &result);
        ASSERT_EQ(REFL_SUCCESS, result);
        ASSERT_EQ(val, this->testValue);

        //Error checking
        refl_getStatePropertyValue_V(machine, 1, 0, &result);
        ASSERT_EQ(REFL_INVALID_ARGS, result);
        metaProperty = NULL;
        refl_destroyMetaMachine(machine, NULL);


    }

}

#pragma clang diagnostic pop
