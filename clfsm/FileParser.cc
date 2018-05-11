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
    cout << "Got Contents." << endl;
    vector<string> lines = components_of_string_separated(this->_contents, '\n', false);
    cout << "Got Lines" << endl;
    for (unsigned long i = 0; i < lines.size(); i++) {
        cout << "Parsing line " << i << endl;
        this->parseLine(lines[i]);
    }
}

void FileParser::parseLine(string line) {
    this->_raws.push_back(line);
    cout << "Pushed back raw" << endl;
    this->_paths.push_back(this->parsePath(line));
    cout << "Pushed back paths." << endl;
    this->_names.push_back(this->parseName(line));
    cout << "Pushed back name" << endl;
    this->_durations.push_back(this->parseDuration(line));
    cout << "Pushed back duration." << endl;
}


string FileParser::parseName(string line) {
    vector<string> nameVec = components_of_string_separated(line, '/', false);
    return components_of_string_separated(nameVec[nameVec.size()-1], '\t', false)[0];
}

string FileParser::parseDuration(string line) {
    return components_of_string_separated(line, '\t', false)[1];
}

string FileParser::parsePath(string line) {
    return components_of_string_separated(line, '\t', false)[0];
}
