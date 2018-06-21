/*
 * Scheduler.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "Scheduler.h"

using namespace std;

vector<Schedule*> Scheduler::createSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    vector<int> unscheduled;
    return this->generateSchedule(paths, periods, deadlines);
}

vector<Schedule*> Scheduler::generateSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    vector<int> scheduled;
    vector<int> timesScheduled(paths.size(), 0);
    int smallestTimeIndex = min_element(periods.begin(), periods.end());
    int time = periods[smallestTimeIndex] * (time / periods[smallestTimeIndex]) + periods[smallestTimeIndex];
    int initialTime = time;
    int i = 0;
    vector<Schedule*> schedule;
    vector<int> emptyVector;
    while (true) {
        if (time / periods[i] > timesScheduled[i]) {
            time += deadlines[i];
            scheduled.push_back(i);
            i = 0;
            continue;
        }
        i++;
        if (i >= paths.size()) {
            schedule.push_back(new Schedule(paths, periods, deadlines, scheduled, emptyVector, initialTime));
            scheduled = emptyVector;
            time = periods[smallestTimeIndex] * (time / periods[smallestTimeIndex]) + periods[smallestTimeIndex];
            initialTime = time;
        }
        if (timesScheduled[min_element(timesScheduled.begin(), timesScheduled.end())] > 0) {
            if (!scheduled.empty()) {
                schedule.push_back(new Schedule(paths, periods, deadlines, scheduled, emptyVector, initialTime));
            }
            return schedule;
        }
    }
}
