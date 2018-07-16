/*
 * DispatchScheduler.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "DispatchScheduler.h"

using namespace std;
using namespace FSM;

Schedule* DispatchScheduler::createSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines, vector<unsigned long> is) {
    vector<unsigned long> schedule;
    vector<int> scheduleTimes;
    for (unsigned long i = 0; i < is.size(); i++) {
        schedule.push_back(is[i]);
        scheduleTimes.push_back(periods[i]);
    }
    return new Schedule(paths, periods, deadlines, schedule, scheduleTimes, 0);
}
