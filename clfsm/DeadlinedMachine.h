#include "CLMachine.h"

namespace FSM {
    class DeadlinedMachine : CLMachine {
        private:
            int duration;

        public:
            DeadlinedMachine(int, int, const char) : CLMachine(int, const char);
            int duration();
            void duration(int);
    };
}
