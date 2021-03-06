/*
 *  FSMWBPostAction.h
 *
 *  Created by René Hexel on 15/12/11.
 *  Copyright (c) 2011, 2019 Rene Hexel.
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
#ifndef gufsm_FSMWBPostAction_h
#define gufsm_FSMWBPostAction_h

#include "FSMachine.h"
#include "FSMAction.h"
#include "FSMWBContext.h"
#include <Whiteboard.h>
#include <gu_util.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wold-style-cast"

namespace FSM
{
        class Machine;

        /**
         * FSM Whiteboard posting actions
         */
        template <typename C> class WBPostAction: public ContentAction<C>
        {
        protected:
                std::string _type;              /// whiteboard message type
        public:
                /** default constructor */
                WBPostAction(): ContentAction<C>() {}
                
                /** designated constructor */
                WBPostAction(std::string type, const C &content): ContentAction<C>(content), _type(type) {}

                /** setting any parameter sets the context */
                virtual void add_parameter(int idx, long long value) OVERRIDE
                {
                        if (idx) ContentAction<C>::setContent((C) value);
                        else _type = (const char *) value;
                }

                /** post to the whiteboard */
                virtual void performv(Machine *m, ActionStage, int, va_list) OVERRIDE
                {
                        WBContext *c = (WBContext *) m->context();
                        c->whiteboard()->addMessage(_type, WBMsg(ContentAction<C>::content()));
                }
        };

        /**
         * FSM Whiteboard getting actions
         */
        class WBGetAction: public ContentAction<std::string>
        {
        public:
                /** setting any parameter sets the message content */
                virtual void add_parameter(int, long long value) OVERRIDE
                {
                        setContent((const char *) value);
                }

                /** get a whiteboard message */
                WBMsg getMessage(Machine *m) const
                {
                        WBContext *c = (WBContext *) m->context();
                        return c->whiteboard()->getMessage(content());
                }

                /** read an int from the whiteboard */
                virtual int evaluate(Machine *m) OVERRIDE
                {
                        return getMessage(m).intValue();
                }

                /** get from the whiteboard and throw away */
                virtual void performv(Machine *m, ActionStage, int, va_list) OVERRIDE
                {
                        evaluate(m);
                }
        };
}

#pragma clang diagnostic pop

#endif
