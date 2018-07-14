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
    vector<string> lines = components_of_string_separated(this->_contents, '\n', false);
    for (unsigned long i = 0; i < lines.size(); i++) {
        if (!this->parseLine(lines[i])) {
            return false;
        }
    }
    return true;
}

bool FileParser::parseLine(string line) {
    if (!this->isValid(line)) {
        cerr << "Invalid Syntax in dispatch table for line:\n" <<  line << "\n\n";
        return false;
    }
    this->_raws.push_back(line);
    this->_indexes.push_back(this->parseIndex(line));
    this->_paths[this->last(this->_indexes)] = this->parsePath(line);
    this->_names[this->last(this->_indexes)] = this->parseName(line);
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

string FileParser::parsePeriod(string line) {
    return components_of_string_separated(line, '\t', false)[2];
}

string FileParser::parseDeadline(string line) {
    return components_of_string_separated(line, '\t', false)[3];
}

string FileParser::parsePath(string line) {
    return components_of_string_separated(line, '\t', false)[1];
}

string FileParser::parseIndex(string line) {
    string index = components_of_string_separated(line, '\t', false)[0];
    if (this->hasValue(this->_indexes, index)) {
        if (this->_paths[this->getIndex(this->_indexes, index)] != this->parsePath(line)) {
            cerr << "Index mismatch for line:\n" << line << endl;
        }
    }
    return index;
}

bool FileParser::isValid(string data) {
    return regex_match(data, regex("[0-9]{1,3}\\t[\\/~\\.\\w][\\w\\/\\.:\\-]+[\\w\\.\\-]+\\.machine\\t\\d+\\t\\d+"));
}

bool FileParser::hasValue(vector<string> vec, string data) {
    for (unsigned long i= 0; i < vec.size(); i++) {
        if (vec[i] == data) {
            return true;
        }
    }
    return false;
}

unsigned long FileParser::getIndex(vector<string> vec, string data) {
    for (unsigned long i = 0; i < vec.size(); i++) {
        if (vec[i] == data) {
            return i;
        }
    }
    return -1;
}

int FileParser::last(vector<string> vec) {
    return atoi(vec[vec.size() - 1].c_str());
}
