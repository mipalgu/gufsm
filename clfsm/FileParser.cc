/*
 * FileParser.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "FileParser.h"

using namespace std;
using namespace FSM;

FileParser::FileParser(string path) {
    this->_contents = string_from_file(path.c_str());
}

bool FileParser::parse() {
    vector<vector<string>> all = this->seperateTable(this->_contents);
    this->_top = all[0];
    this->_bottom = all[1];
    for (unsigned long i = 0; i < this->_top.size(); i++) {
        if (!this->parseLine(this->_top[i])) {
            return false;
        }
    }
    return true;
}

bool FileParser::parseLine(string line) {
    if (!this->isValid(line)) {
        cerr << "Invalid Syntax in machine table for line:\n" <<  line << "\n\n";
        return false;
    }
    this->_raws.push_back(line);
    this->_paths.push_back(this->parsePath(line));
    this->_names.push_back(this->parseName(line));
    this->_periods.push_back(this->parsePeriod(line));
    this->_deadlines.push_back(this->parseDeadline(line));
    return true;
}


string FileParser::parseName(string line) {
    vector<string> nameVec = components_of_string_separated(line, '/', false);
    string nameWithMachine = components_of_string_separated(nameVec[nameVec.size()-1], '\t', false)[0];
    vector<string> splitNameWithMachine = components_of_string_separated(nameWithMachine, '.', false);
    return splitNameWithMachine[splitNameWithMachine.size() - 2];
}

int FileParser::parsePeriod(string line) {
    return atoi(components_of_string_separated(line, '\t', false)[1].c_str());
}

int FileParser::parseDeadline(string line) {
    return atoi(components_of_string_separated(line, '\t', false)[2].c_str());
}

string FileParser::parsePath(string line) {
    return components_of_string_separated(line, '\t', false)[0];
}

bool FileParser::isValid(string data) {
    return regex_match(data, regex("[\\/~\\.\\w][\\w\\/\\.:\\-]+[\\w\\.\\-]+\\.machine\\t\\d+\\t\\d+"));
}

bool FileParser::hasValue(vector<string> vec, string data) {
    for (unsigned long i= 0; i < vec.size(); i++) {
        if (vec[i] == data) {
            return true;
        }
    }
    return false;
}

/*unsigned long FileParser::getIndex(vector<string> vec, string data) {
    for (unsigned long i = 0; i < vec.size(); i++) {
        if (vec[i] == data) {
            return i;
        }
    }
    return -1;
}*/

int FileParser::last(vector<string> vec) {
    return atoi(vec[vec.size() - 1].c_str());
}

vector<vector<string>> FileParser::seperateTable(string raw) {
    vector<string> top;
    vector<string> bottom;
    vector<string> lines = components_of_string_separated(raw, '\n', false);
    bool hasBlankLine = false;
    for (unsigned long i = 0; i < lines.size(); i++) {
        if (!hasBlankLine && lines[i] == "") {
            hasBlankLine = true;
            continue;
        }
        if (hasBlankLine) {
            bottom.push_back(lines[i]);
            continue;
        }
        top.push_back(lines[i]);
    }
    vector<vector<string>> all;
    all.push_back(top);
    all.push_back(bottom);
    return all;
}

Schedule* FileParser::createSchedule() {
    if (!this->parse()) {
        cerr << "Failed to parse file" << endl;
        return NULL;
    }
    vector<unsigned long> scheduledMachines;
    vector<int> scheduledTimes;
    for (unsigned long i = 0; i < this->_bottom.size(); i++) {
        if (!this->isDispatchValid(this->_bottom[i])) {
            cerr << "Invalid syntax in Dispatch Table for line " << i << " in dispatch table:\n" << this->_bottom[i] << endl;
            break;
        }
        scheduledMachines.push_back(this->parseIndex(this->_bottom[i]));
        scheduledTimes.push_back(this->parseScheduledTime(this->_bottom[i]));
    }
    return new Schedule(
        this->_names,
        this->_paths,
        this->_periods,
        this->_deadlines,
        scheduledMachines,
        scheduledTimes,
        0
    );
}

bool FileParser::isDispatchValid(string data) {
    return regex_match(data, regex("\\d{1,3}\\t\\d{1,9}"));
}

int FileParser::parseScheduledTime(string line) {
    return atoi(components_of_string_separated(line, '\t', false)[1].c_str());
}
unsigned long FileParser::parseIndex(string line) {
    return strtoul(components_of_string_separated(line, '\t', false)[0].c_str(), nullptr, 0);
}
