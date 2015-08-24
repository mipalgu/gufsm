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

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_MetaProperty_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaProperty_Tests()
        {
            metaMachine = refl_initMetaMachine(NULL);
            metaProperty = refl_initMetaProperty(NULL);
        }

        virtual ~ReflectAPI_MetaProperty_Tests()
        {
            refl_destroyMetaMachine(metaMachine, NULL); //Destroys meta property too
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
        refl_metaMachine metaMachine = NULL;
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


}

#pragma clang diagnostic pop
