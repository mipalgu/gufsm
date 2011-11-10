/*
 *  FSMWBQueryPredicate.cpp
 *  
 *  Created by Rene Hexel on 22/10/11.
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
#include <cassert>
#include <Whiteboard.h>
#include <WhiteboardConstants.h>
#include "FSMWBQueryPredicate.h"
#include "FSMWBContext.h"

using namespace std;
using namespace FSM;
using namespace guWhiteboard;

WBQueryPredicate::WBQueryPredicate(const std::string &p, bool neg, Whiteboard *wb): WBPredicate(p, neg)
{
        pthread_mutexattr_t mattr;

        pthread_mutexattr_init(&mattr);
        pthread_mutexattr_settype(&mattr, PTHREAD_MUTEX_RECURSIVE);
        pthread_mutex_init(&_lock, NULL);
        pthread_mutexattr_destroy(&mattr);

        pthread_cond_init(&_receivedProof, NULL);

        setWhiteboard(wb);
}

void WBQueryPredicate::setWhiteboard(guWhiteboard::Whiteboard *wb)
{
        Whiteboard::WBResult result = Whiteboard::WBResult::METHOD_OK;
        if (whiteboard()) whiteboard()->unsubscribeToMessage(name(), result);

        WBPredicate::setWhiteboard(wb);
        if (wb) wb->subscribeToMessage(name(), WB_BIND(WBQueryPredicate::callback), result);

        assert(result == Whiteboard::WBResult::METHOD_OK);
}


bool WBQueryPredicate::evaluate(Machine *m)
{
        Whiteboard *wb = whiteboard();

        if (!wb)
        {
                if (!m) return false;
                
                WBContext *context = (WBContext *) m->context();
                
                if (!context) return false;
                
                wb = context->whiteboard();
                
                if (!wb) return false;
        }
        
        /*
         * post a message to update proof for output
         */
        pthread_mutex_lock(&_lock);
        _waiting = true;
        wb->addMessage(kUpdateProof, WBMsg(name()));

        /*
         * wait for response
         */
        pthread_cond_wait(&_receivedProof, &_lock);
        bool value = Predicate::evaluate();
        pthread_mutex_unlock(&_lock);

        return value;
}


void WBQueryPredicate::callback(std::string dataName, WBMsg *msg)
{
        assert(dataName == name());

        pthread_mutex_lock(&_lock);
        if (_waiting)
        {
                Predicate::setValue(WBPredicate::evaluate(*msg));
                pthread_cond_signal(&_receivedProof);
        }
        pthread_mutex_unlock(&_lock);
}
