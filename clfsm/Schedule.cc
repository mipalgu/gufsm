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
    vector<int> scheduled,
    vector<int> unscheduled,
    int newStart,
    int newEnd
) {
    this->_paths = newPaths;
    this->_periods = newPeriods;
    this->_deadlines = newDeadlines;
    this->_scheduledMachines = scheduled;
    this->_unscheduledMachines = unscheduled;
    this->_start = newStart;
    this->_end = newEnd;
    //this->_period = this->_periods[min_element(0, this->_periods.size() - 1)];
}

void Schedule::refresh() {
    if (!this->_scheduledMachines.empty()) {
        this->_unscheduledMachines.insert(this->_unscheduledMachines.end(), this->_scheduledMachines.begin(), this->_scheduledMachines.end());
    }
    this->_scheduledMachines = this->_unscheduledMachines;
    this->_unscheduledMachines.clear(); 
}

string Schedule::description() {
    stringstream str;
    str << "Start at: " << this->_start;
    for (unsigned long i = 0; i < this->_scheduledMachines.size(); i++) {
        int index = this->_scheduledMachines[i];
        str << "\n" << this->_paths[index] << " " << this->_deadlines[index];
    }
    str << "End at: " << this->_end << endl;
    return str.str();
}
