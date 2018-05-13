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
    vector<string> lines = components_of_string_separated(this->_contents, '\n', false);
    for (unsigned long i = 0; i < lines.size(); i++) {
        this->parseLine(lines[i]);
    }
}

void FileParser::parseLine(string line) noexcept {
    if (!this->isValid(line)) {
        throw ("Invalid Syntax in dispatch table for line:\n" + line + "\n\n");
    }
    this->_raws.push_back(line);
    this->_paths.push_back(this->parsePath(line));
    this->_names.push_back(this->parseName(line));
    this->_durations.push_back(this->parseDuration(line));
}


string FileParser::parseName(string line) {
    vector<string> nameVec = components_of_string_separated(line, '/', false);
    string nameWithMachine = components_of_string_separated(nameVec[nameVec.size()-1], '\t', false)[0];
    vector<string> splitNameWithMachine = components_of_string_separated(nameWithMachine, '.', false);
    return splitNameWithMachine[splitNameWithMachine.size() - 2];
}

string FileParser::parseDuration(string line) {
    return components_of_string_separated(line, '\t', false)[1];
}

string FileParser::parsePath(string line) {
    return components_of_string_separated(line, '\t', false)[0];
}

bool FileParser::isValid(string data) {
    return regex_match(data, regex("[\\/~\\.\\w][\\w\\/\\.:\\-]+[\\w\\.\\-]+\\.machine\\t\\d+"));
}
