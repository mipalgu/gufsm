/*
 * FileReader.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "FileReader.h"

using namespace std;
using namespace FSM;

FileReader::FileReader() {}

vector<string> FileReader::read(string path) {
    ifstream file;
    file.open(path.c_str());
    vector<vector<string>> machinesData;
    while (!file.eof()) {
        machinesData.push_back(this->readLine(file));
    }
    file.close();
    return machinesData; 
}

vector<string> FileReader::readLine(ifstream file) {
    string sum = "";
    vector<string> data(4);
    char x;
    string name = "";
    string raw = "";
    while (true) {
        if (file.eof()) {
            break;
        }
        file >> x;
        raw += x;
        if (x == '.') {
            data[0] = name;
        }
        if (x == '\t') {
            data[1] = sum;
            sum = "";
            continue;
        }
        if (x == '\n') {
            data[2] = sum;
            break;
        }
        sum += x;
        if (x == '/') {
            name = "";
            continue;
        }
        name += x;
    }
    data[3] = raw;
    return data;
}
