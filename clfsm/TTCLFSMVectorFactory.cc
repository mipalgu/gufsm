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
    this->_accepting = true;
    for (unsigned long i = 0; i < names.size(); i++) {
        long scheduledStart = times[i] + this->start;
        long scheduledEnd = times[i+1] + this->start;
        int id = this->index_of_machine_named(names[i].c_str());
        if (id == -1) {
            cerr << "Failed to index machine: " << names[i] << endl;
            continue;
        }
        SuspensibleMachine *machine = this->fsms()->machines()[id];
        if (!machine || (should_execute_machine != NULLPTR && !should_execute_machine(context, machine, int(id))))
            continue;
        bool mfire = false;
        long startOfMachine = this->getTimeMS(); 
        while (startOfMachine < scheduledStart) {
            //usleep(int(scheduledEnd - startOfMachine) * 1000);
            usleep(100);
            startOfMachine = this->getTimeMS();
        }
        if (startOfMachine > scheduledStart) {
            cerr << "Machine " << names[i] << " starting late. Scheduled Time: "
                << scheduledStart << ". Actual Time: " << startOfMachine << endl;
        } 
        bool a = !machine->executeOnce(&mfire);
        if (a && accepting_action)
            accepting_action(context, machine, int(id)); //Execute function if machine in accepting state
        if (mfire) fired = true;
        long end = this->getTimeMS();
        this->_accepting = a && this->_accepting;
        if (end > scheduledEnd) {
            cerr << names[i] << " Failed to execute by timeslot t = " << scheduledEnd << "ms." << endl;
            continue;
        }
    }
    this->start = times[times.size() - 1] + this->start;
    return fired;
}

void TTCLFSMVectorFactory::executeTT(
    visitor_f should_execute_machine,
    vector<int> times,
    vector<string> names,
    void *context,
    visitor_f accepting_action
) {
    this->start = this->getTimeMS();
    do
    {
        if (!this->executeOnceTT(should_execute_machine, this->createStartTimes(times), names, context, accepting_action))
            fsms()->noTransitionFired();
    }
        while (!this->_accepting);
}

long TTCLFSMVectorFactory::getTimeMS() {
    struct timespec spec;
    clock_gettime(CLOCK_REALTIME, &spec);
    return lround(spec.tv_nsec / 1.0e6);
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
