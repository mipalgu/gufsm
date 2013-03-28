/*
 *  clfsm_wb_vector_factory.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 25/03/13.
 *  Copyright (c) 2013 Rene Hexel. All rights reserved.
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
#include "FSMAsynchronousSuspensibleMachine.h"
#include "FSMachineVector.h"
#include "clfsm_wb_vector_factory.h"
#include "gugenericwhiteboardobject.h"
#include "typeClassDefs/FSM_Control.h"

using namespace FSM;
using namespace guWhiteboard;
using namespace std;

CLFSMWBVectorFactory::CLFSMWBVectorFactory(Context *context, bool deleteOnDestruction): CLFSMVectorFactory(context, deleteOnDestruction), _watcher(),  _wbstatus()
{
//        SUBSCRIBE(&watcher(), FSM_Control, FSM::CLFSMWBVectorFactory, FSM::CLFSMWBVectorFactory::whiteboard_fsm_control);
}


void CLFSMWBVectorFactory::whiteboard_fsm_control(WBTypes t, FSMControlStatus &controlMsg)
{
        FSMControlType command = controlMsg.command();

        switch (command)
        {
                case guWhiteboard::FSMStatus:
                        postMachineStatus();
                        break;
                case guWhiteboard::FSMSuspend:
                        break;
                case guWhiteboard::FSMResume:
                        break;
                case guWhiteboard::FSMRestart:
                        break;
        }
}


void CLFSMWBVectorFactory::postMachineStatus()
{
        FSMControlStatus status;

        status.fsms().reset();

        int i = 0;
        for (MachineVector::const_iterator it = fsms()->machines().begin(); it != fsms()->machines().end(); it++, i++)
        {
                if (i >= int(CONTROLSTATUS_NUM_FSMS-1))
                        break;
                const SuspensibleMachine *machine = *it;
                status.fsms().set(i, machine->isSuspended());
        }
        status.fsms().set(i, true);     // set the high bit to 1

        wbstatus().set(status);         // post to whiteboard
}


void CLFSMWBVectorFactory::suspendMachines(guWhiteboard::FSMControlStatus &suspendControl)
{
        FSMControlStatus status;
        
        status.fsms().reset();

        int i = 0;
        for (MachineVector::iterator it = fsms()->machines().begin(); it != fsms()->machines().end(); it++, i++)
        {
                if (i >= int(CONTROLSTATUS_NUM_FSMS-1))
                        break;
                AsynchronousSuspensibleMachine *machine = static_cast<AsynchronousSuspensibleMachine *>(*it);
                if (suspendControl.fsms()[i])
                {
                        machine->scheduleSuspend();
                        status.fsms().set(i, true);
                }
                else status.fsms().set(i, machine->isSuspended());
        }
        status.fsms().set(i, true);     // set the high bit to 1
        
        wbstatus().set(status);         // post to whiteboard
}


void CLFSMWBVectorFactory::resumeMachines(guWhiteboard::FSMControlStatus &resumeControl)
{
        FSMControlStatus status;

        status.fsms().reset();
        
        int i = 0;
        for (MachineVector::iterator it = fsms()->machines().begin(); it != fsms()->machines().end(); it++, i++)
        {
                if (i >= int(CONTROLSTATUS_NUM_FSMS-1))
                        break;
                AsynchronousSuspensibleMachine *machine = static_cast<AsynchronousSuspensibleMachine *>(*it);
                if (resumeControl.fsms()[i])
                {
                        machine->scheduleResume();
                        status.fsms().set(i, false);
                }
                else status.fsms().set(i, machine->isSuspended());
        }
        status.fsms().set(i, true);     // set the high bit to 1
        
        wbstatus().set(status);         // post to whiteboard
}


void CLFSMWBVectorFactory::restartMachines(guWhiteboard::FSMControlStatus &resumeControl)
{
        FSMControlStatus status;
        
        status.fsms().reset();
        
        int i = 0;
        for (MachineVector::iterator it = fsms()->machines().begin(); it != fsms()->machines().end(); it++, i++)
        {
                if (i >= int(CONTROLSTATUS_NUM_FSMS-1))
                        break;
                AsynchronousSuspensibleMachine *machine = static_cast<AsynchronousSuspensibleMachine *>(*it);
                if (resumeControl.fsms()[i])
                {
                        machine->scheduleRestart();
                        status.fsms().set(i, false);
                }
                else status.fsms().set(i, machine->isSuspended());
        }
        status.fsms().set(i, true);     // set the high bit to 1
        
        wbstatus().set(status);         // post to whiteboard
}
