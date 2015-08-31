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
    class ReflectAPI_MetaPropertyString_Tests: public ::testing::Test
    {
    public:
        int testValue;
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_MetaPropertyString_Tests()
        {
            metaProperty = refl_initMetaProperty(NULL);
        }

        virtual ~ReflectAPI_MetaPropertyString_Tests()
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

    TEST_F(ReflectAPI_MetaPropertyString_Tests, getAsString)
    {
        
    }

}

#pragma clang diagnostic pop
