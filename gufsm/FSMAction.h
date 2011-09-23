/*
 *  FSMAction.h
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
#ifndef gufsm_FSMAction_h
#define gufsm_FSMAction_h

#include <cstdarg>
#include <string>
#include <sstream>
#include <iostream>

enum ActionStage { STAGE_ON_ENTRY, STAGE_ON_EXIT, STAGE_INTERNAL,
        NUM_ACTION_STAGES };
/**
 * Abstract class for FSM actions
 */
class FSMAction
{
public:
        /** virtual destructor */
        virtual ~FSMAction() {}

        /** perform the given action with a vector of parameters */
        virtual void performv(int state, ActionStage stage, int ac, va_list al) = 0;

        /** perform the given action */
        virtual void perform(int state, ActionStage stage, int ac = 0, ...)
        {
                va_list ap;
                va_start(ap, ac);
                performv(state, stage, ac, ap);
                va_end(ap);
        }
};


/**
 * Abstract template class for FSMs actions with simple content
 */
template <typename T> class FSMContentAction: public FSMAction
{
protected:
        T _content;             /// content relevant for this action
public:
        /** default constructor */
        FSMContentAction() {}

        /** designated constructor */
        FSMContentAction(const T &content): _content(content) {}

        /** getter method */
        virtual const T &content() { return _content; }

        /** setter method */
        virtual void setContent(const T &c) { _content = c; }
};


/**
 * Printing action
 */
template <typename T> class FSMPrintingAction: public FSMContentAction<T>
{
public:
        /** printing action default constructor */
        FSMPrintingAction(T val): FSMContentAction<T>(val) {}

        /** print the content of this action */
        virtual void performv(int state, ActionStage stage, int ac, va_list al)
        {
                std::cout << this->_content << std::endl;
        }
};

/**
 * Printing action for strings
 */
typedef FSMPrintingAction<std::string> FSMPrintStringAction;

/**
 * Delay action: specify sleep time in milliseconds
 */
class FSMSleepAction: public FSMContentAction<int>
{
public:
        /** sleep action default constructor */
        FSMSleepAction(int val = 1000): FSMContentAction<int>(val) {}

        /** sleep for the given amount of milliseconds */
        virtual void performv(int state, ActionStage stage, int ac, va_list al);
};
#endif
