/*
 *  FSMState.h
 *  
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011 Rene Hexel.
 *  All rights reserved.
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
 *        This product includes software developed by Rene Hexel.
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
#include "FSMWBSubMachineFactory.h"
#include "FSMTransition.h"
#include "FSMState.h"
#include "ActivityFactory.h"
#include "TransitionFactory.h"
#include "gu_util.h"

using namespace FSM;
using namespace std;

WBSubMachineFactory::WBSubMachineFactory(WBContext *context, const string &machine_name, int mid)
{
        setMachine(new WBSubMachine(NULL, context, mid));

        string a_file_name = machine_name + string(".acsl");
        string t_file_name = machine_name + string(".tcsl");

        ActivityFactory afactory(machine(), a_file_name.c_str(), NULL);
        TransitionFactory tfactory(machine(), t_file_name.c_str());
        if (!determineSuspendState())
                determineSuspendState(NULL);
        machine()->setName(machine_name);
        machine()->initialise();
}


bool WBSubMachineFactory::determineSuspendState(const char *name)
{
        if (machine()->suspendState()) return true;

        for (StateVector::const_iterator i = machine()->states().begin(); i != machine()->states().end(); i++)
        {
                if ((*i)->transitions().size()) // nonempty, cannot be suspend
                        continue;
                if (name && (*i)->name() != name)
                        continue;               // non-matching name
                bool transitionsFound = false;
                StateVector::const_iterator j = machine()->states().begin();
                for (; j != machine()->states().end(); j++)
                {
                        if (j == i) continue;   // ignore the tested state
                        for (TransitionVector::const_iterator k = (*j)->transitions().begin(); k != (*j)->transitions().end(); k++)
                        {
                                if ((*k)->target() == *i)
                                {
                                        transitionsFound = true;
                                        break;
                                }
                        }
                        if (transitionsFound) break;
                }
                if (!transitionsFound)          // found my suspend state
                {
                        machine()->setSuspendState(*i);
                        DBG(cout << "Found suspend state " << (*i)->name() << endl);
                        return true;
                }
        }
        return false;                           // no suspend state foujnd
}
