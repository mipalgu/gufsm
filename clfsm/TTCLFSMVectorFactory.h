/*
 * TTCLFSMVectorFactory.h 
 * clfsm 
 *
 * Created by Morgan McColl on 11/05/2018.
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

#ifndef TTCLFSMVECTORFACTORY_H
#define TTCLFSMVECTORFACTORY_H

#include "clfsm_wb_vector_factory.h"
#include <time.h>
#include <math.h>
#include <inttypes.h>
#include <unistd.h>
#include "CLMachine.h"
#include "FSMachineVector.h"
#include "FSMSuspensibleMachine.h"
#include "gu_util.h"
#include "Schedule.h"

namespace FSM {
    
    using namespace std;

    class TTCLFSMVectorFactory : public CLFSMWBVectorFactory {
        private:

            long long getTimeUS();

            //vector<long long> createStartTimes(vector<int> times);

            bool _accepting;

            long long start;

            vector<int> fetchIds(vector<string> names);

            vector<SuspensibleMachine*> fetchMachines(vector<int> ids);

            long long sleepTillTimeslot(long long);

            //vector<long long> toLongLong(vector<int>);


        public:
            TTCLFSMVectorFactory(bool accepting, Context *context, bool del = true, useconds_t timeout = 10000L)
                : CLFSMWBVectorFactory(context, del, timeout) {
                    this->_accepting = accepting;
                }

            /**
             * Execute a Schedule Once.
             */
            bool executeOnceTT(
                visitor_f should_execute_machine,
                Schedule*,
                void *context = NULLPTR,
                visitor_f accepting_action = NULLPTR
            );

            /**
             * Continuously execute a schedule.
             */
            void executeTT(
                visitor_f should_execute_machine,
                Schedule*,
                void *context = NULLPTR,
                visitor_f accepting_action = NULLPTR
            ); 
    };
}

#endif  /* TTCLFSMVECTORFACTORY_H */
