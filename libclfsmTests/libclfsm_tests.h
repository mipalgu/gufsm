//
//  libclfsm_tests.h
//  gufsm
//
//  Created by Rene Hexel on 5/04/2014.
//  Copyright (c) 2014, 2015 Rene Hexel. All rights reserved.
//

#ifndef gufsm__libclfsm_tests__
#define gufsm__libclfsm_tests__

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wglobal-constructors"

#include <gtest/gtest.h>
#include "gu_util.h"
#include "FSMState.h"
#include "FSMSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "CLMachine.h"
#include "CLState.h"
#include "clfsm_machine.h"
#include "clfsm_vector_factory.h"
#include "libclfsm_tests.h"

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

    class TestMachine: public FSM::CLMachine
    {
        virtual FSM::CLState * const *states() const { return NULL; }
        virtual int numberOfStates() const { return 0; }
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
#endif /* defined gufsm__libclfsm_tests__) */

#pragma clang diagnostic pop
