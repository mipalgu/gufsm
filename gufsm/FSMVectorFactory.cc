/*
 *  FSMVectorFactory.cc
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
#include "FSMANTLRContext.h"

#include <dispatch/dispatch.h>
#include <iostream>
#include <gu_util.h>

#include "FSMVectorFactory.h"
#include "FSMWBSubMachine.h"
#include "FSMWBSubMachineFactory.h"

using namespace FSM;
using namespace std;
using namespace guWhiteboard;

StateMachineVectorFactory::StateMachineVectorFactory(ANTLRContext *context,
                                                     const vector<string> &names_of_machines_to_build)
{
        _context = context;
        _fsms = new ANTLRMachineVector(context);
        _queue_semaphore = dispatch_semaphore_create(1);

        Whiteboard *wb = context->whiteboard();
        Whiteboard::WBResult r;
        string wb_name;

        int mid=0;
        if (_fsms) for (vector<string>::const_iterator it = names_of_machines_to_build.begin(); it != names_of_machines_to_build.end(); it++)
        {
                const string &file = *it;
                addMachine(file, mid++);

                wb_name = "reload_" + file;
                wb->subscribeToMessage(wb_name, WB_BIND(StateMachineVectorFactory::wb_reload_specific), r);
                if (r != Whiteboard::METHOD_OK)
                        cerr << "Failed to subscribe to '" << wb_name << "'" << endl;

                wb_name = "reread_" + file;
                wb->subscribeToMessage(wb_name, WB_BIND(StateMachineVectorFactory::wb_reread_specific), r);
                if (r != Whiteboard::METHOD_OK)
                        cerr << "Failed to subscribe to '" << wb_name << "'" << endl;

        }

        wb_name = "reload";
        wb->subscribeToMessage(wb_name, WB_BIND(StateMachineVectorFactory::wb_reload), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;

        wb_name = "reread";
        wb->subscribeToMessage(wb_name, WB_BIND(StateMachineVectorFactory::wb_reread), r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to subscribe to '" << wb_name << "'" << endl;
}

StateMachineVectorFactory::StateMachineVectorFactory() {
        return;
}

StateMachineVectorFactory::~StateMachineVectorFactory()
{
        Whiteboard::WBResult r;
        Whiteboard *wb = _context->whiteboard();
        string wb_name("reload");

        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;

        wb_name = "reread";
        wb->unsubscribeToMessage(wb_name, r);
	if (r != Whiteboard::METHOD_OK)
                cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;

        for (MachineVector::iterator i = fsms()->machines().begin();
             i != fsms()->machines().end(); i++ )
        {
                WBSubMachine *wbm = (WBSubMachine *) *i;
                wb_name = "reload_" + wbm->name();
                wb->unsubscribeToMessage(wb_name, r);
                if (r != Whiteboard::METHOD_OK)
                        cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;

                wb_name = "reread_" + wbm->name();
                wb->unsubscribeToMessage(wb_name, r);
                if (r != Whiteboard::METHOD_OK)
                        cerr << "Failed to un-subscribe from '" << wb_name << "'" << endl;

                delete wbm;
        }

        delete _fsms;
}


SuspensibleMachine *StateMachineVectorFactory::addMachine(std::string name, int index, bool resume)
{
        WBSubMachineFactory machine_factory(_context, name, index);
        SuspensibleMachine *machine = machine_factory.machine();
        machine->initialise();
        fsms()->addMachine(machine, index, resume);
        DBG(cout << _context->description() << endl);

        return machine;
}


int StateMachineVectorFactory::index_of_machine_named(string machine_name)
{
        int i = 0;
        for (MachineVector::iterator it = fsms()->machines().begin();
             it != fsms()->machines().end(); it++ )
        {
                WBSubMachine *wbm = (WBSubMachine *) *it;
                if (wbm->name() == machine_name)
                        break;
                i++;
        }
        if (fsms()->machines().size() <= i) return -1;

        return i;
}


void StateMachineVectorFactory::reloadMachine(string name)
{
        int i = index_of_machine_named(name);

        addMachine(name, i);
}


void StateMachineVectorFactory::rereadMachine(string name)
{
        int i = index_of_machine_named(name);
        
        addMachine(name, i, true);
}

void StateMachineVectorFactory::wb_reload(string, WBMsg *machinemsg)
{
#ifdef __APPLE__
        string *s = new string(machinemsg->getStringValue());
        dispatch_async(dispatch_get_main_queue(), ^{ reloadMachine(*s); delete s; });
#else
        dispatch_semaphore_wait(_queue_semaphore, DISPATCH_TIME_FOREVER);
        _reload_queue.push(machinemsg->getStringValue());
        dispatch_semaphore_signal(_queue_semaphore);
#endif
}


void StateMachineVectorFactory::wb_reread(string, WBMsg *machinemsg)
{
#ifdef __APPLE__
        string *s = new string(machinemsg->getStringValue());
        dispatch_async(dispatch_get_main_queue(), ^{ rereadMachine(*s); delete s; });
#else
        dispatch_semaphore_wait(_queue_semaphore, DISPATCH_TIME_FOREVER);
        _reload_queue.push(machinemsg->getStringValue());
        dispatch_semaphore_signal(_queue_semaphore);
#endif
}


void StateMachineVectorFactory::wb_reload_specific(string, WBMsg *machinemsg)
{
        string msg = machinemsg->getStringValue();
        size_t pos = msg.find('_');
        if (pos != string::npos && pos < msg.length() - 1)
                reloadMachine(msg.substr(pos+1));
}


void StateMachineVectorFactory::wb_reread_specific(string, WBMsg *machinemsg)
{
        string msg = machinemsg->getStringValue();
        size_t pos = msg.find('_');
        if (pos != string::npos && pos < msg.length() - 1)
                rereadMachine(msg.substr(pos+1));
}


void StateMachineVectorFactory::execute(void)
{
        do
        {
                dispatch_semaphore_wait(_queue_semaphore, DISPATCH_TIME_FOREVER);
                while (!_reload_queue.empty())
                {
                        reloadMachine(_reload_queue.front());
                        _reload_queue.pop();
                }
                while (!_reread_queue.empty())
                {
                        reloadMachine(_reread_queue.front());
                        _reread_queue.pop();
                }
                dispatch_semaphore_signal(_queue_semaphore);

                if (!fsms()->executeOnce())
#if 0
                        fsms()->noTransitionFired();
#else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wempty-body"
                        ;
#pragma clang diagnostic pop
                protected_usleep(19500);
#endif
        }
        while (!fsms()->accepting());
}