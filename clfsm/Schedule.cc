/*
 * Schedule.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "Schedule.h"

using namespace std;
using namespace FSM;

Schedule::Schedule(
    vector<string> newNames,
    vector<string> newPaths,
    vector<string> newSuspends,
    vector<string> newPreloads,
    vector<int> newPeriods,
    vector<int> newDeadlines,
    vector<unsigned long> scheduled,
    vector<int> times,
    int newSleepTime,
    vector<unsigned long> newPreloadsIndexes,
    vector<unsigned long> newSuspendsIndexes
) {
    this->_names = newNames;
    this->_paths = newPaths;
    this->_suspends = newSuspends;
    this->_preloads = newPreloads;
    this->_periods = newPeriods;
    this->_deadlines = newDeadlines;
    this->_scheduledMachines = scheduled;
    this->_scheduledTimes = times;
    this->_sleepTime = newSleepTime;
    this->_preloadsIndexes = newPreloadsIndexes;
    this->_suspendsIndexes = newSuspendsIndexes;
    //this->_period = this->_periods[min_element(0, this->_periods.size() - 1)];
}

/*void Schedule::refresh() {
    if (!this->_scheduledMachines.empty()) {
        this->_unscheduledMachines.insert(this->_unscheduledMachines.end(), this->_scheduledMachines.begin(), this->_scheduledMachines.end());
    }
    this->_scheduledMachines = this->_unscheduledMachines;
    this->_unscheduledMachines.clear(); 
}*/

string Schedule::description() {
    stringstream str;
    for (unsigned long i = 0; i < this->_scheduledMachines.size(); i++) {
        unsigned long index = this->_scheduledMachines[i];
        str << "\n" << index << " " << this->_paths[index] << " " << this->_scheduledTimes[i] << " " << this->_deadlines[index];
    }
    str << "\n\nSleep Till: " << this->_sleepTime << endl;
    str << "\nSuspended Machines:";
    for (unsigned long j = 0; j < this->_suspends.size(); j++) {
        str << "\n" << this->_suspends[j];
    }
    str << endl << endl;
    str << "Preloads:";
    for (unsigned long k = 0; k < this->_preloads.size(); k++) {
        str << "\n" << this->_preloads[k];
    }
    str << endl << endl;
    return str.str();
}

void Schedule::scheduleMachine(int index) {
    this->_clfsmIndexes.push_back(index);
}
