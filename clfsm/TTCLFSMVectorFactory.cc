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
    vector<long long> times,
    vector<string> names,
    void *context,
    visitor_f accepting_action
) {
    bool fired = false;
    this->_accepting = true;
    vector<int> ids = this->fetchIds(names);
    vector<SuspensibleMachine*> machines = this->fetchMachines(ids);
    for (unsigned long i = 0; i < machines.size(); i++) {
        SuspensibleMachine *machine = machines[i];
        if (!machine || (should_execute_machine != NULLPTR && !should_execute_machine(context, machine, int(ids[i]))))
            continue;
        bool mfire = false; 
        long long scheduledEnd = times[i+1] + this->start;
        long long scheduledStart = times[i] + this->start;
        long long startOfMachine = this->sleepTillTimeslot(scheduledStart, this->getTimeUS());
        if (startOfMachine - scheduledStart > 200) {
            cerr << "Machine " << names[i] << " starting late. Scheduled Time: "
                << scheduledStart << "us. Actual Time: " << startOfMachine << "us. Overran by: "
                << startOfMachine - scheduledStart << "us." << endl;
        } 
        //cout << "Scheduled Start: " << scheduledStart - this->start << "\nActual Start: " << startOfMachine - this->start << endl;
        bool a = !machine->executeOnce(&mfire);
        if (a && accepting_action)
            accepting_action(context, machine, int(ids[i])); //Execute function if machine in accepting state
        if (mfire) fired = true;
        long long end = this->getTimeUS();
        this->_accepting = a && this->_accepting;
        if (end > scheduledEnd) {
            cerr << names[i] << " Failed to execute by timeslot t = " << scheduledEnd - this->start
                << "us. Overran by " << end - scheduledEnd << "us." << endl;
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
    this->start = this->getTimeUS();
    do
    {
        if (!this->executeOnceTT(should_execute_machine, this->createStartTimes(times), names, context, accepting_action))
            fsms()->noTransitionFired();
    }
        while (!this->_accepting);
}

long long TTCLFSMVectorFactory::getTimeUS() {
    struct timespec spec;
    clock_gettime(CLOCK_REALTIME, &spec);
    return (spec.tv_sec * 1000000) + (spec.tv_nsec / 1000);
}

vector<long long> TTCLFSMVectorFactory::createStartTimes(vector<int> times) {
    long long carry = 0;
    vector<long long> startTimes;
    startTimes.push_back(0);
    for (unsigned long i = 0; i < times.size(); i++) {
        startTimes.push_back(carry + times[i]);
        carry += times[i];
    }
    return startTimes;
}

vector<int> TTCLFSMVectorFactory::fetchIds(vector<string> names) {
    vector<int> ids;
    for (unsigned long i = 0; i < names.size(); i++) {
        int id = this->index_of_machine_named(names[i].c_str());
        if (id == -1) {
            cerr << "Failed to index machine: " << names[i] << endl;
            ids.clear();
            return ids;
        } 
        ids.push_back(id);
    }
    return ids;
}

vector<SuspensibleMachine*> TTCLFSMVectorFactory::fetchMachines(vector<int> ids) {
    vector<SuspensibleMachine*> machines;
    for (unsigned long i = 0; i < ids.size(); i++) {
        SuspensibleMachine *machine = this->fsms()->machines()[ids[i]];
        machines.push_back(machine);
    }
    return machines;
}

long long TTCLFSMVectorFactory::sleepTillTimeslot(long long scheduled, long long now) {
    if (now >= scheduled) {
        return now;
    }
    usleep(100);
    return this->sleepTillTimeslot(scheduled, this->getTimeUS());
}
