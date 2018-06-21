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
    vector<string> newPaths,
    vector<int> newPeriods,
    vector<int> newDeadlines,
    vector<unsigned long> scheduled,
    vector<int> times,
    int newSleepTime
) {
    this->_paths = newPaths;
    this->_periods = newPeriods;
    this->_deadlines = newDeadlines;
    this->_scheduledMachines = scheduled;
    this->_scheduledTimes = times;
    this->_sleepTime = newSleepTime;
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
        str << "\n" << this->_paths[index] << " " << this->_deadlines[index];
    }
    str << "\nSleep For: " << this->_sleepTime << endl;
    return str.str();
}
