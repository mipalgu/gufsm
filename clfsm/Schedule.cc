/*
 * Schedule.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "Schedule.h"

using namespace std;

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
    if (!this->_scheduled.empty()) {
        this->_unscheduled.insert(this->_unscheduled.end(), this->_scheduled.begin(), this->_scheduled.end());
    }
    this->_scheduled = this->_unscheduled;
    this->_unscheduled.clear(); 
}

string Schedule::description() {
    stringstream str;
    str << "Start at: " << this->_start;
    for (unsigned long i = 0; i < this->_scheduled.size(); i++) {
        int index = this->_scheduled[i];
        str << "\n" << this->_paths[index] << " " << this->_deadlines[index];
    }
    str << "End at: " << this->_end << endl;
    return str.str();
}
