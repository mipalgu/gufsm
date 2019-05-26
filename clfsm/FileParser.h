/*
 * FileParser.h 
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

#ifndef FILEPARSER_H 
#define FILEPARSER_H

#include <iostream>
#include <fstream>
#include <vector>
#include "gu_util.h"
#include <regex>
#include <stdlib.h>
#include "Schedule.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"
#pragma clang diagnostic ignored "-Wc++98-compat"

namespace FSM {

    using namespace std;
    
    /**
     * FileParser
     *
     * The FileParser parses a dispatch table provided in the constructor into a Schedule object. The dispatch table is broken up into a requirements
     * section and a Schedule section. The sections are separated by a blank line. The top section is the requirements section and designates the
     * machines to be scheduled and their required periods and deadlines. The scheduling section indicates the entire cycle of when the
     * machines are scheduled. This consists of the machine index based on the list of machines provided in the requirements section
     * starting at 0 and the scheduled time after schedule start. All times including periods, start times and deadlines are represented
     * in microseconds. The schedule will repeat indefinitely. The dispatch table is to be formatted using the following style:
     *
     * PATH_TO_MACHINE0\tPERIOD\tDEADLINE
     * PATH_TO_MACHINE1\tPERIOD\tDEADLINE
     * ...\n\n
     * MACHINE_INDEX\tSCHEDULED_TIME
     * ...
     */
    class FileParser {
        private:
            string _contents;
            vector<string> _paths;
            vector<string> _names;
            vector<int> _periods;
            vector<int> _deadlines;
            vector<string> _raws;
            vector<string> _bottom;
            vector<string> _top;
            vector<string> _suspends;

            /**
             * A function to set the members to their respective values for a single machine.
             *
             * @param line The line in the dispatch table representing the machine to be parsed.
             */
            bool parseLine(string line);

            /**
             * A function to retrieve the name of the machine from the dispatch table.
             * @param line The line to be parsed.
             *
             * @return The name of the machine.
             */
            string parseName(string line);

            /**
             * A function to retrieve the period a machine takes to execute a ringlet from the dispatch table.
             * @param line The line to be parsed.
             *
             * @return The period of the machine.
             */
            int parsePeriod(string line);

            /**
             * A function to retrieve the deadline of the machine
             * @param line The line to be parsed.
             *
             * @return This deadline of the machine.
             */
            int parseDeadline(string line);

            /**
             * A function to retrieve the path of the machine from the dispatch table.
             * @param line The line to be parsed.
             *
             * @return The path of the machine.
             */
            string parsePath(string line);

            unsigned long parseIndex(string line);

            /**
             * Checks if a line from the requirements table has valid syntax.
             *
             * @param data The line from the requirements table.
             *
             * @return Whether the string is valid syntax.
             */
            bool isValid(string data);

            bool isSuspended(string data);

            bool hasValue(vector<string>, string);

            int last(vector<string>);

            vector<vector<string>> seperateTable(string);

            bool parse();

            bool isDispatchValid(string);

            int parseScheduledTime(string);

        public:
            /**
             * The constructor opens the dispatch table located at path and parses the contents.
             */
            FileParser(string path);

            vector<string> paths() {return this->_paths;}

            vector<string> names() {return this->_names;}

            vector<int> periods() {return this->_periods;}

            vector<int> deadlines() {return this->_deadlines;}

            vector<string> raws() {return this->_raws;}

            vector<string> suspends() {return this->_suspends;}

            /**
             * Creates a Schedule object from the table specified in the constructor.
             *
             * @return The Schedule.
             */
            Schedule* createSchedule();
    };
}

#pragma clang diagnostic pop

#endif  /* FILEPARSER_H */ 
