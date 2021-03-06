//
//  libclfsm_tests.h
//  gufsm
//
//  Created by Rene Hexel on 5/04/2014.
//  Copyright (c) 2014, 2015, 2018 Rene Hexel. All rights reserved.
//



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"
#pragma clang diagnostic ignored "-Wmissing-noreturn"
#pragma clang diagnostic ignored "-Wshift-sign-overflow"
#pragma clang diagnostic ignored "-Wused-but-marked-unused"
#pragma clang diagnostic ignored "-Wdeprecated"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wsuggest-override"
#pragma clang diagnostic ignored "-Wsuggest-destructor-override"
#pragma clang diagnostic ignored "-Wzero-as-null-pointer-constant"
#include <gtest/gtest.h>
#pragma clang diangostic pop

#include "gu_util.h"
#include "FSMState.h"
#include "FSMSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "CLMachine.h"
#include "CLState.h"
#include "clfsm_machine.h"
#include "clfsm_vector_factory.h"
#include "DummyMachines.h"


namespace
{
    // The fixture for testing clfsm.
    class clfsmTest: public ::testing::Test
    {
    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        clfsmTest()
        {
            // You can do set-up work for each test here.
        }

        virtual ~clfsmTest()
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

        // Objects declared here can be used by all tests in the test case for clfsm.
    };

    // Tests that the an empty clfsm vector has no machines
    TEST_F(clfsmTest, EmptyMachineVectorHasNoMachines)
    {
        using namespace std;
        using namespace FSM;

        StateMachineVector emptyVector;

        ASSERT_TRUE(emptyVector.machines().empty()) << "Expecting empty vector" << endl;
    }

    // Tests that the an empty clfsm vector has no machines
    TEST_F(clfsmTest, VectorFactory)
    {
        using namespace std;
        using namespace FSM;

        Context context;
        CLFSMVectorFactory factory(&context, false);

        ASSERT_TRUE(factory.fsms()->machines().empty()) << "Expecting empty vector" << endl;

        TestMachine machine;
        const char *machineName = "Test";

        machine.setMachineName("Test");
        factory.addMachine(&machine);

        ASSERT_STREQ(machineName, factory.name_of_machine_at_index(0)) << "Expecting machine named " << machineName << endl;
    }
}  // namespace

//int main(int argc, char **argv) {
//    ::testing::InitGoogleTest(&argc, argv);
//    return RUN_ALL_TESTS();
//}
