#include "DeadlinedMachine.h"

DeadLinedMachine::DeadlinedMachine(int duration, int mid, const char *name) : CLMachine(mid, *name) {
    this->duration = duration;
}

DeadlinedMachine::duration() {
    return this->duration;
}

DeadlinedMachine::duration(int newDuration) {
    this->duration = newDuration;
}
