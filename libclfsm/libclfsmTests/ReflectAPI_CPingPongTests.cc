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

typedef void (*onEntryFunc)();

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
            
        }

        virtual ~ReflectAPI_CPingPongTests()
        {
            refl_destroyMetaMachine(metaFSM, NULL);
        }

        // If the constructor and destructor are not enough for setting up
        // and cleaning up each test, you can define the following methods:

        virtual void SetUp()
        {
            if (!sharedObject)
                throw;
        }

        virtual void TearDown()
        {
            // Code here will be called immediately after each test (right
            // before the destructor).
        }
        void* sharedObject = NULL;
        refl_metaMachine metaFSM = NULL;
        onEntryFunc func = NULL;
        char buffer[40];
        unsigned int bufferLen = 40;
        CLReflectResult result;
    };

    TEST_F(ReflectAPI_CPingPongTests, executingCPingPong)
    {

    }

}

#pragma clang diagnostic pop
