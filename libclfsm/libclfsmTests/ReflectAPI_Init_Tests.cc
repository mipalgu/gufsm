
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

#include <gtest/gtest.h>
#include "CLMachineRetriever.h"
#include "clfsm_vector_factory.h"
#include "DummyMachines.h"

using namespace std;
using namespace FSM;

namespace
{
    // The fixture for testing clfsm.
    class ReflectAPI_Init_Tests: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_Init_Tests()
        {
            // You can do set-up work for each test here.
        }

        virtual ~ReflectAPI_Init_Tests()
        {
            // You can do clean-up work that doesn't throw exceptions here.
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
    };



    //! Testing retrieval from execution vector
    TEST_F(ReflectAPI_Init_Tests, getMachineByName)
    {
        Context context;
        CLFSMVectorFactory factory(&context, false);

        const char* name = "TestMachineName";
        void* null_machine = CLMachineRetriever::getMachineWithName(name);
        ASSERT_TRUE(null_machine == NULL) << "Expecting null pointer" << std::endl;

        TestMachine testMachine;
        testMachine.setMachineName(name);
        factory.addMachine(&testMachine);
        void* machine = CLMachineRetriever::getMachineWithName(name);
        ASSERT_FALSE(machine == NULL) << "Machine should not be null" << std::endl;
    }
}

#pragma clang diagnostic pop
