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
#include <dlfcn.h>
#include "clfsm_machine.h"
#include "CLReflectAPI.h"


using namespace std;

typedef refl_metaMachine (*create_meta_f)();

namespace
{

    // The fixture for testing clfsm.
    class ReflectAPI_CPingPongTests: public ::testing::Test
    {
    public:
        const char * TEST_FSM_PATH = "../ReflectTestMachines/CPingPong.machine";
        const char * SO_PATH = "../ReflectTestMachines/CPingPong.machine/build.host-local/CPingPong.machine.so";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_CPingPongTests()
        {
            sharedObject = dlopen(SO_PATH, RTLD_NOW|RTLD_GLOBAL);
            createFunc = create_meta_f(dlsym(sharedObject, "Create_MetaMachine"));
            metaFSM = createFunc();
        }

        virtual ~ReflectAPI_CPingPongTests()
        {
            refl_destroyMetaMachine(metaFSM, NULL);
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {
            if (!sharedObject || !metaFSM)
                throw;
        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }
        void* sharedObject = NULL;
        refl_metaMachine metaFSM = NULL;
        create_meta_f createFunc = NULL;
        char buffer[40];
        unsigned int bufferLen = 40;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_CPingPongTests, CpingPongStructure)
    {
        ASSERT_EQ(4, refl_getNumberOfStates(metaFSM, NULL));
        unsigned int numTransForEachState[] = { 1, 2, 1, 0 };
        for (unsigned int i = 0; i < 4; i++)
        {
            refl_metaState *states = refl_getMetaStates(metaFSM, NULL);
            ASSERT_EQ(numTransForEachState[i],
                        refl_getNumberOfTransitions(states[i], NULL)) <<
                        "State " << i << endl;
        }
    }

    TEST_F(ReflectAPI_CPingPongTests, executingCPingPong)
    {
        unsigned int currentState = refl_getCurrentState(metaFSM, NULL);
        refl_metaState *states = refl_getMetaStates(metaFSM, NULL);
        while (refl_getNumberOfTransitions(states[currentState], NULL) > 0)
        {
            int previousState = refl_getPreviousState(metaFSM, NULL);
            // Execute on Entry if new state
            if (static_cast<int>(currentState) != previousState)
            {
                refl_invokeOnEntry(metaFSM, currentState, NULL);
                refl_setPreviousState(metaFSM, currentState, NULL);
            }
            //Check for transitions
            unsigned int transNum;
            unsigned int numTransitions = refl_getNumberOfTransitions(states[currentState], NULL);
            for (transNum = 0; transNum < numTransitions; transNum++)
            {
                if (refl_evaluateTransition(metaFSM, currentState, transNum, NULL) == refl_TRUE)
                    break;
            }
            if (transNum != numTransitions)
            {
                //Transition has fired
                refl_invokeOnExit(metaFSM, currentState, NULL);
                refl_setPreviousState(metaFSM, currentState, NULL);
                refl_metaTransition firingTransition =
                        refl_getMetaTransitions(states[currentState], NULL)[transNum];
                unsigned int target = currentState = refl_getMetaTransitionTarget(firingTransition, NULL);
                refl_setCurrentState(metaFSM, target, NULL);
            }
            else
            {
                refl_invokeInternal(metaFSM, currentState, NULL);
            }
        }

    }

}

#pragma clang diagnostic pop
