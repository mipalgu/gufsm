/*
 * Scheduler.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "Scheduler.h"

using namespace std;
using namespace FSM;

vector<Schedule*> Scheduler::createSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    vector<int> unscheduled;
    return this->generateSchedule(paths, periods, deadlines);
}

int Scheduler::smallest(vector<int> vec) {
    int small = vec[0];
    for (unsigned long i = 0; i < vec.size(); i++) {
        if (vec[i] < small) {
            small = vec[i];
        }
    }
    return small;
}

vector<Schedule*> Scheduler::generateSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    vector<int> scheduled;
    vector<int> timesScheduled(paths.size(), 0);
    int smallestPeriod = this->smallest(periods); 
    int time = 0;
    int initialTime = time;
    unsigned long i = 0;
    vector<Schedule*> schedule;
    vector<int> emptyVector;
    while (true) {
        if (time / periods[i] > timesScheduled[i]) {
            time += deadlines[i];
            scheduled.push_back(static_cast<int>(i));
            i = 0;
            continue;
        }
        i++;
        if (i >= paths.size()) {
            time = smallestPeriod * (time / smallestPeriod) + smallestPeriod;
            schedule.push_back(new Schedule(paths, periods, deadlines, scheduled, emptyVector, initialTime, time));
            scheduled = emptyVector;
            initialTime = time;
        }
        if (this->smallest(timesScheduled) > 0) {
            if (!scheduled.empty()) {
                time = smallestPeriod * (time / smallestPeriod) + smallestPeriod;
                schedule.push_back(new Schedule(paths, periods, deadlines, scheduled, emptyVector, initialTime, time));
            }
            return schedule;
        }
    }
}
