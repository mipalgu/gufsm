#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wsign-compare"


#include <gtest/gtest.h>
#include <string>
#include "CLReflectAPI.h"

using namespace std;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_Util_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_Util_Tests()
        {

        }

        virtual ~ReflectAPI_Util_Tests()
        {

        }

        virtual void SetUp()
        {

        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }



    };

    TEST_F(ReflectAPI_Util_Tests, stringCopyTests)
    {
        char str[] = "TestString";
        char buffer_test[20];
        ASSERT_EQ(REFL_SUCCESS, refl_strcpy(buffer_test, str, 20));
        ASSERT_STREQ("TestString", buffer_test);
        ASSERT_EQ(REFL_BUFFER_OVERFLOW, refl_strcpy(buffer_test, str, 5));
        ASSERT_STREQ(str, buffer_test) << "Previous call shouldn't change string" << endl;
        char* heapString = static_cast<char *>(malloc(sizeof(str)));
        ASSERT_EQ(REFL_SUCCESS, refl_strcpy(heapString, str, 20));
        ASSERT_STREQ(heapString, str);
    }

}

#pragma clang diagnostic pop
