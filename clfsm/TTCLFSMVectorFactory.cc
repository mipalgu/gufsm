/*
 * TTCLFSMVectorFactory.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "TTCLFSMVectorFactory.h"

using namespace FSM;

bool TTCLFSMVectorFactory::executeOnceTT(
    visitor_f should_execute_machine,
    vector<long> times,
    vector<string> names,
    void *context,
    visitor_f accepting_action
) {
    bool fired = false;
    this->accepting = true;
    long start = this->getTimeMS();
    for (unsigned long i = 0; i < names.size(); i++) {
        int id = this->index_of_machine_named(names[i].c_str());
        CLMachine *wrapper = this->machine_at_index(id);
        SuspensibleMachine *machine = dynamic_cast<SuspensibleMachine*>(wrapper->machineContext());
        if (!machine || (should_execute_machine != NULLPTR && !should_execute_machine(context, machine, int(id))))
            continue;
        bool mfire = false;
        bool a = !machine->executeOnce(&mfire);
        if (a && accepting_action)
            accepting_action(context, machine, int(id)); //Execute function if machine in accepting state
        if (mfire) fired = true;
        long end = this->getTimeMS();
        this->accepting = a && accepting;
        if (end > times[i+1] + start) {
            cerr << names[i] << " Failed to execute by t = " << times[i+1] + start << "ms." << endl;
            continue;
        }
        long now = this->getTimeMS();
        if (now < times[i+1] + start) {
            usleep(int(times[i+1] + start - now) * 1000); // sleep till start time of next machine.
        }
    }
    return fired;
}

void TTCLFSMVectorFactory::executeTT(
    visitor_f should_execute_machine,
    vector<int> times,
    vector<string> names,
    void *context,
    visitor_f accepting_action
) {
    do
    {
        if (!this->executeOnceTT(should_execute_machine, this->createStartTimes(times), names, context, accepting_action))
            fsms()->noTransitionFired();
    }
        while (!this->accepting);
}

long TTCLFSMVectorFactory::getTimeMS() {
    clock_gettime(CLOCK_REALTIME, &this->spec);
    return lround(this->spec.tv_nsec / 1.0e6);
}

vector<long> TTCLFSMVectorFactory::createStartTimes(vector<int> times) {
    int carry = 0;
    vector<long> startTimes;
    startTimes.push_back(0);
    for (unsigned long i = 0; i < times.size(); i++) {
        startTimes.push_back(long(carry + times[i]));
        carry += times[i];
    }
    return startTimes;
}
