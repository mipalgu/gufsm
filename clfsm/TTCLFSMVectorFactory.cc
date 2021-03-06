/*
 * TTCLFSMVectorFactory.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "TTCLFSMVectorFactory.h"

using namespace FSM;
using namespace std;

bool TTCLFSMVectorFactory::executeOnceTT(
    visitor_f should_execute_machine,
    Schedule* schedule,
    void *context,
    visitor_f accepting_action
) {
    bool fired = false;
    this->_accepting = true;
    vector<int> ids = schedule->clfsmIndexes();
    vector<SuspensibleMachine*> machines = this->fetchMachines(ids);
    vector<unsigned long> scheduledMachines = schedule->scheduledMachines();
    for (unsigned long i = 0; i < scheduledMachines.size(); i++) {
        unsigned long m = scheduledMachines[i];
        SuspensibleMachine *machine = machines[m];
        if (!machine || (should_execute_machine != NULLPTR && !should_execute_machine(context, machine, int(ids[m]))))
            continue;
        bool mfire = false;
        long long scheduledTime = this->start + schedule->scheduledTimes()[i];
        long long scheduledEnd = scheduledTime + schedule->deadlines()[m];
        this->sleepTillTimeslot(scheduledTime);
        bool a = !machine->executeOnce(&mfire);
        if (a && accepting_action)
            accepting_action(context, machine, int(ids[i])); //Execute function if machine in accepting state
        if (mfire) fired = true;
        long long end = this->getTimeUS();
        this->_accepting = a && this->_accepting;
        if (end > scheduledEnd) {
#ifdef DEBUG
            cerr << "Failed to execute machine " << m << " by timeslot t = " << scheduledEnd - this->start
                << "us. Overran by " << end - scheduledEnd << "us." << endl;
#endif
        }
        if (i == scheduledMachines.size() - 1) {
            this->start = scheduledTime + schedule->sleepTime();
            continue;
        }
    }
    return fired;
}

void TTCLFSMVectorFactory::executeTT(
    visitor_f should_execute_machine,
    Schedule *schedule,
    void *context,
    visitor_f accepting_action
) {
    cout << "Schedule:" << schedule->description() << endl;
    this->start = this->getTimeUS();
    do
    {
        if (
            !this->executeOnceTT(
                should_execute_machine,
                schedule,
                context,
                accepting_action
            )
        )
            fsms()->noTransitionFired();
    }
        while (!this->_accepting);
}

long long TTCLFSMVectorFactory::getTimeUS() {
    return get_utime();
}

/*
vector<long long> TTCLFSMVectorFactory::createStartTimes(vector<int> times) {
    long long carry = 0;
    vector<long long> startTimes;
    startTimes.push_back(0);
    for (unsigned long i = 0; i < times.size(); i++) {
        startTimes.push_back(carry + times[i]);
        carry += times[i];
    }
    return startTimes;
}*/

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

long long TTCLFSMVectorFactory::sleepTillTimeslot(long long scheduled) {
    long long now = this->getTimeUS();
    if (now < 0LL) {
        return 0LL;
    }
    if (scheduled <= now) {
        return now;
    }
    unsigned int t = static_cast<unsigned int>(scheduled - now);
    if (t > 5000 || t == 0) {
        std::cout << "\n\n\nt was: " << t << " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n\n" << std::endl;
        t = 5000;
    }
    protected_usleep(t);
    return this->getTimeUS();
}

/*
vector<long long> TTCLFSMVectorFactory::toLongLong(vector<int> ints) {
    vector<long long> longLongs;
    for (unsigned long i = 0; i < ints.size(); i++) {
        longLongs.push_back(static_cast<long long>(ints[i]));
    }
    return longLongs;
}*/
