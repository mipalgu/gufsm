#include "MachineCreator.h"
#include "DeadlinedMachine.h"
#include <iostream>
#include <fstream>
#include <regex>

using namespace std;

namespace FSM {
    class DeadlinedMachineCreator : MachineCreator<DeadlinedMachine> {
        private:

            int id = 0;

            vector<string> readLine(ifstream file) {
                string sum = "";
                vector<string> data(4);
                char x;
                string name = "";
                string raw = "";
                while (true) {
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

            DeadlinedMachine* createMachine(vector<string> data) {
                string name = data[0];
                string path = data[1];
                int t  << data[2];
                return new DeadlinedMachine(t, this->id++, name.c_str());
            }
        
        public:
            virtual vector<DeadlinedMachine*> createMachines(string path) {
                ifstream file;
                file.open(path.c_str());
                vector<DeadlinedMachine*> machines;
            }
    };
}
