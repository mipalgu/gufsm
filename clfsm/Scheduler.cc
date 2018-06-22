/*
 * Scheduler.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "Scheduler.h"

using namespace std;
using namespace FSM;

Schedule* Scheduler::createSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    return this->generateSchedule(paths, periods, deadlines);
}

Schedule* Scheduler::generateSchedule(vector<string> paths, vector<int> periods, vector<int> deadlines) {
    //vector<unsigned long> orderedMachines = this->orderByLowestFrequency(periods, deadlines);
    //int timeslot = this->getSmallestTimeslot(periods);
    vector<int> lastScheduled(paths.size(), 0); 
    int maxTime = this->getHighestValue(periods);
    vector<unsigned long> schedule;
    vector<int> scheduleTimes;
    int sleepTime = maxTime;
    for (int t = 0; t <= maxTime; t++) {
        for (unsigned long i = 0; i < periods.size(); i++) {
            if (t - lastScheduled[i] >= periods[i]) {
                schedule.push_back(i);
                scheduleTimes.push_back(t);
                if (t == maxTime) {
                    sleepTime += deadlines[i];
                }
            }
        }
    }
    return new Schedule(paths, periods, deadlines, schedule, scheduleTimes, sleepTime);
    
    
    /*vector<int> scheduled;
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
    }*/
}

/*vector<unsigned long> Scheduler::findSchedulableMachines(
    vector<int> lastScheduled,
    vector<int> periods,
    int time
) {
    vector<unsigned long> indexes;
    for (unsigned long i = 0; i < periods.size(); i++) {
        if (time - lastScheduled[i] > periods[i]) {
            indexes.push_back(i);
        }
    }
    return indexes;
}*/
/*
vector<unsigned long> Scheduler::orderByLowestFrequency(vector<int> periods, vector<int> deadlines) {
    vector<unsigned long> indexes;
    indexes.push_back(0);
    for (unsigned long i = 1; i < periods.size(); i++) {
        for (unsigned long j = 0; j < indexes.size(); j++) {
            if (periods[i] == periods[indexes[j]]) {
                if (deadlines[i] <= deadlines[indexes[j]]) {
                    //insert
                }
                continue;
            }
            if (periods[i] < periods[indexes[j]]) {
                //insert
            }
        }
    }
    return indexes;
}*/

/*int Scheduler::getSmallestTimeSlot(vector<int> periods) {
    int timeslot = periods[0];
    for (unsigned long i = 0; i < periods.size(); i++) {
        for (unsigned long j = 0; j < periods.size(); j++) {
            if (i == j) {
                continue;
            }
            int dt = abs(periods[j] - periods[i]);
            if (dt < timeslot) {
                timeslot = dt;
            }
        }
    }
    return timeslot;
}*/

int Scheduler::getHighestValue(vector<int> vec) {
    int high = vec[0];
    for (unsigned long i = 1; i < vec.size(); i++) {
        if (vec[i] > high) {
            high = vec[i];
        }
    }
    return high;
}














