#include "DeadlinedMachine.h"

DeadLinedMachine::DeadlinedMachine(int duration, int mid, const char *name) : CLMachine(mid, *name) {
    this->duration = duration;
}

DeadlinedMachine::createMachineFromCLMachine(int duration, CLMachine* machine) {
    DeadlinedMachine* thisMachine = static_cast<DeadlinedMachine*>(machine);
    thisMachine.setDuration(duration);
    return thisMachine;
}

DeadlinedMachine::duration() {
    return this->duration;
}

DeadlinedMachine::duration(int newDuration) {
    this->duration = newDuration;
}
