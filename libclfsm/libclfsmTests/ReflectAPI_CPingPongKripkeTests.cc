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
    class VariableInternalParent
    {
    public:
        void* value;

        virtual ~VariableInternalParent() {}
    };

    template<typename T>
    class VariableInternalConcrete : public VariableInternalParent
    {
    public:
        T typedVariable;
        VariableInternalConcrete(void* val)
        {
            typedVariable = *static_cast<unsigned char*>(val);
            value = static_cast<void *>(&typedVariable);
        }

        virtual ~VariableInternalConcrete() {}

    };

    class Variable
    {
    public:
        VariableInternalParent* var;

        Variable(void *val, refl_type t)
        {
            if (t == REFL_UNSIGNED_CHAR)
            {
                this->var = new VariableInternalConcrete<unsigned char>(val);
            }
        }

        virtual ~Variable() { delete(var); }

    };



    // The fixture for testing clfsm.
    class ReflectAPI_CPingPongKripkeTests: public ::testing::Test
    {
    public:
        const char * TEST_FSM_PATH = "../ReflectTestMachines/CPingPongKripke.machine";
        const string SO_PATH = "../ReflectTestMachines/CPingPongKripke.machine/build.host-local/CPingPongKripke.machine";

    protected:
        // You can remove any or all of the following functions if its body
        // is empty.

        ReflectAPI_CPingPongKripkeTests()
        {
            sharedObject = dlopen((SO_PATH + ".so").c_str(), RTLD_NOW|RTLD_GLOBAL);
            if (!sharedObject)
            {
                sharedObject = dlopen((SO_PATH + ".dylib").c_str(), RTLD_NOW|RTLD_GLOBAL);
            }
            createFunc = create_meta_f(dlsym(sharedObject, "Create_MetaMachine"));
            if (!createFunc)
            {
                createFunc = create_meta_f(dlsym(sharedObject, "_Create_MetaMachine"));
            }

        }

        virtual ~ReflectAPI_CPingPongKripkeTests()
        {
            refl_destroyMetaMachine(metaFSM, NULL);
            if (sharedObject)
                dlclose(sharedObject);
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {
            ASSERT_TRUE(sharedObject != NULL && createFunc != NULL);
            metaFSM = createFunc();
        }

        virtual void TearDown()
        {

        }
        void* sharedObject = NULL;
        refl_metaMachine metaFSM = NULL;
        create_meta_f createFunc = NULL;
        char buffer[40];
        unsigned int bufferLen = 40;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_CPingPongKripkeTests, CpingPongKripkeStructure)
    {
        ASSERT_EQ(2, refl_getNumberOfStates(metaFSM, NULL));
        ASSERT_EQ(1, refl_getNumberOfMachineProperties(metaFSM, NULL));
        unsigned int numTransForEachState[] = { 1, 1 };
        for (unsigned int i = 0; i < 2; i++)
        {
            refl_metaState *states = refl_getMetaStates(metaFSM, NULL);
            ASSERT_EQ(numTransForEachState[i],
                        refl_getNumberOfTransitions(states[i], NULL)) <<
                        "State " << i << endl;
        }
    }

    TEST_F(ReflectAPI_CPingPongKripkeTests, verifyingCPingPongKripke)
    {
        unsigned int currentState = refl_getCurrentState(metaFSM, NULL);
        refl_metaState *states = refl_getMetaStates(metaFSM, NULL);
        unsigned int stateChanges = 0;
        string pcHistory[10];
        unsigned int pcCount = 0;
        while (stateChanges < 2)
        {
            int previousState = refl_getPreviousState(metaFSM, NULL);
            // Execute on Entry if new state
            if (static_cast<int>(currentState) != previousState)
            {
                // *** Take snapshopt *** //
                string pcBeforeEntry = "M0S" + to_string(currentState) + "R0";
                pcHistory[pcCount++] = pcBeforeEntry;
                refl_invokeOnEntry(metaFSM, currentState, NULL);
                // *** Take snapshopt *** //
                string pcAfterEntry = "M0S" + to_string(currentState) + "R1";
                pcHistory[pcCount++] = pcAfterEntry;
                refl_setPreviousState(metaFSM, currentState, NULL);
            }

            //Check for transitions
            unsigned int transNum;
            unsigned int numTransitions = refl_getNumberOfTransitions(states[currentState], NULL);
            for (transNum = 0; transNum < numTransitions; transNum++)
            {
                if (refl_evaluateTransition(metaFSM, currentState, transNum, NULL) == refl_TRUE)
                {
                    // *** Take snapshopt *** //
                    string pcAfterEvaluateTrue = "M0S" + to_string(currentState) + "R3T" + to_string(transNum);
                    pcHistory[pcCount++] = pcAfterEvaluateTrue;
                    break;
                }
                // *** Take snapshopt *** //
                string pcAfterEvaluateFalse = "M0S" + to_string(currentState) + "R4T" + to_string(transNum);
                pcHistory[pcCount++] = pcAfterEvaluateFalse;
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
                stateChanges++;
            }
            else
            {
                refl_invokeInternal(metaFSM, currentState, NULL);
                // *** Take snapshopt *** //
                string beforeEvaluate = "M0S" + to_string(currentState) + "R2";
                pcHistory[pcCount++] = beforeEvaluate;
            }
        }
        //Check pc trace
        //string pcHistoryCheck[] = {"M0S0R0", "M0S0R1", "M0S0R2", "M0S1R0", "M0S1R1", "M0S1R2" };
        for (unsigned int i = 0; i < pcCount; i++)
        {
            //ASSERT_STREQ(pcHistoryCheck[i].c_str(), pcHistory[i].c_str());
            std::cout << pcHistory[i] << ",";
        }
        std::cout << std::endl;

    }

    TEST_F(ReflectAPI_CPingPongKripkeTests, variableTest)
    {
        unsigned char test = 1;
        Variable testVar(static_cast<void*>(&test), REFL_UNSIGNED_CHAR);
        unsigned char stored = *static_cast<unsigned char*>(testVar.var->value);
        ASSERT_EQ(test, stored);
        test = 2;
        ASSERT_NE(test, stored);
    }
}

#pragma clang diagnostic pop
