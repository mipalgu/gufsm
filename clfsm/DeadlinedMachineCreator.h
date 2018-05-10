/*
 * DeadlinedMachineCreator.h 
 * clfsm 
 *
 * Created by Morgan McColl on 10/05/2018.
 * Copyright © 2018 Morgan McColl. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials
 *    provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *        This product includes software developed by Morgan McColl.
 *
 * 4. Neither the name of the author nor the names of contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * -----------------------------------------------------------------------
 * This program is free software; you can redistribute it and/or
 * modify it under the above terms or under the terms of the GNU
 * General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses/
 * or write to the Free Software Foundation, Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

#ifndef DEADLINEDMACHINECREATOR_H
#define DEADLINEDMACHINECREATOR_H

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
#endif  /* DEADLINEDMACHINECREATOR_H */
