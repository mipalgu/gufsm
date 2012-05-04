/*
 *  FSMWBSubMachine.cc
 *  
 *  Created by René Hexel on 22/11/11.
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
#include <iostream>
#include <Whiteboard.h>
#include "FSMWBSubMachine.h"
#include "FSMWBContext.h"

using namespace FSM;
using namespace std;
using namespace guWhiteboard;

WBSubMachine::WBSubMachine(State *initialState, 
                           WBContext *ctx, 
                           int mid, 
                           State *s, 
                           bool del, 
                           ExecCom_Struct * execCom)
             : SuspensibleMachine(execCom, 
                                  initialState, 
                                  ctx, 
                                  mid, 
                                  s, 
                                  del), 
               _deleteContext(false),
               _scheduleSuspend(false), 
               _scheduleResume(false), 
               _scheduleRestart(false)
{
        if (!ctx)
        {
                setContext(new WBContext());
                _deleteContext = context() != NULL;
        }

        /*
         * subscribe to suspend/resume/restart type messages
         */
        string wb_name = "suspend";
        Whiteboard *wb = ctx->whiteboard();
        Whiteboard::WBResult r;
        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_suspend), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;

        wb_name += "_";
        wb_name += name();

        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_suspend_me), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;

        wb_name = "resume";
        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_resume), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;
        
        wb_name += "_";
        wb_name += name();
        
        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_resume_me), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;
        
        wb_name = "restart";
        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_restart), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;
        
        wb_name += "_";
        wb_name += name();
        
        wb->subscribeToMessage(wb_name, WB_BIND(WBSubMachine::wb_restart_me), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;
        
}


WBSubMachine::~WBSubMachine()
{
        string wb_name = "suspend";
        Whiteboard *wb = ((WBContext *)context())->whiteboard();
        Whiteboard::WBResult r;
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;
        
        wb_name += "_";
        wb_name += name();
        
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;

        wb_name = "resume";
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;
        
        wb_name += "_";
        wb_name += name();
        
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;
        
        wb_name = "restart";
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;
        
        wb_name += "_";
        wb_name += name();
        
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;
        
        if (_deleteContext && context()) delete (WBContext *) context();
}


bool WBSubMachine::executeOnce(bool *fired)
{
        if (_scheduleSuspend) suspend();
        else if (_scheduleRestart) restart();
        else if (_scheduleResume) resume();

        return SuspensibleMachine::executeOnce(fired);
}


void WBSubMachine::restart()
{
        SuspensibleMachine::restart();
        _scheduleRestart = false;
}


void WBSubMachine::initialise()
{
        Whiteboard *wb = ((WBContext *)context())->whiteboard();
        string wb_name = name() + "IsSuspended";
        
        wb->addMessage(wb_name, WBMsg(false));

        SuspensibleMachine::initialise();

        wb_name = name() + "IsRunning";
        
        wb->addMessage(wb_name, WBMsg(true));
}


void WBSubMachine::suspend()
{
        Whiteboard *wb = ((WBContext *)context())->whiteboard();
        string wb_name = name() + "IsRunning";

        wb->addMessage(wb_name, WBMsg(false));

        SuspensibleMachine::suspend();

        wb_name = name() + "IsSuspended";

        wb->addMessage(wb_name, WBMsg(true));

        _scheduleSuspend = false;
}


void WBSubMachine::resume()
{
        Whiteboard *wb = ((WBContext *)context())->whiteboard();
        string wb_name = name() + "IsSuspended";

        wb->addMessage(wb_name, WBMsg(false));

        SuspensibleMachine::resume();

        wb_name = name() + "IsRunning";

        wb->addMessage(wb_name, WBMsg(true));

        _scheduleResume = false;
}
