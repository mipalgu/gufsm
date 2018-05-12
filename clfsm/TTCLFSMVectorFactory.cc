/*
 * TTCLFSMVectorFactory.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "TTCLFSMVectorFactory.h"

using namespace FSM;

bool TTCLFSMVectorFactory::executeOnceTT(visitor_f should_execute_machine, vector<long> times, vector<string> names, void *context) {
    long start = this->getTimeMS();
    for (unsigned long i = 0; i < names.size(); i++) {
        int id = this->index_of_machine_named(names[i].c_str());
        CLMachine *wrapper = this->machine_at_index(id);
        Machine *machine = wrapper->machineContext();
        machine->executeOnce();
        long end = this->getTimeMS();
        if (end > times[i+1] + start) {
            cerr << names[i] << " Failed to execute by t = " << times[i+1] + start << "ms." << endl;
            continue;
        }
        long now = this->getTimeMS();
        if (now < times[i+1] + start) {
            usleep(int(times[i+1] + start - now) * 1000); // sleep till start time of next machine.
        }
    }
    return true;
}

void TTCLFSMVectorFactory::executeTT(visitor_f should_execute_machine, vector<int> times, vector<string> names, void *context) {
    do
    {
        if (!this->executeOnceTT(should_execute_machine, this->createStartTimes(times), names, context))
            fsms()->noTransitionFired();
    }
        while (!fsms()->accepting());
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
