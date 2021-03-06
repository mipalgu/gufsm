/*
 *  FSMActivity.cc
 *
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011, 2014, 2019 Rene Hexel.
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
#include <iostream>
#include <sstream>

#include "FSMActivity.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wswitch-enum"

using namespace FSM;

void Activity::perform(Machine *m, ActionStage stage)
{
        switch (stage)
        {
                case STAGE_ON_ENTRY:
                        perform(m, stage, _onEntryActions);
                        break;
                case STAGE_ON_EXIT:
                        perform(m, stage, _onExitActions);
                        break;
                case STAGE_INTERNAL:
                        perform(m, stage, _internalActions);
                        break;
                case STAGE_ON_SUSPEND:
                        perform(m, stage, _onSuspendActions);
                        break;
                case STAGE_ON_RESUME:
                        perform(m, stage, _onResumeActions);
                        break;
                default:
                        assert(false);
        }
}

using namespace std;

string Activity::description() const
{
        return description(STAGE_ON_ENTRY) + description(STAGE_ON_EXIT) +
                description(STAGE_INTERNAL);
}


string Activity::description(ActionStage stage) const
{
        stringstream ss;
        switch (stage)
        {
                case STAGE_ON_ENTRY:
                        ss << "On Entry:\n" << description(_onEntryActions)
                                << endl;
                        break;
                case STAGE_ON_EXIT:
                        ss << "On Exit:\n" << description(_onExitActions)
                        << endl;
                        break;
                case STAGE_INTERNAL:
                        ss << "Internal:\n" << description(_internalActions)
                        << endl;
                        break;
                case STAGE_ON_SUSPEND:
                        ss << "On Suspend:\n" << description(_onSuspendActions)
                           << endl;
                        break;
                case STAGE_ON_RESUME:
                        ss << "On RESUME:\n" << description(_onResumeActions)
                           << endl;
                break;
                default:
                        ss << "<invalid stage " << static_cast<int>(stage) << ">"
                           << endl;
        }

        return ss.str();
}


string Activity::description(const ActionVector &actions) const
{
        string s;
        for (ActionVector::const_iterator it = actions.begin();
             it != actions.end(); it++)
        {
                Action *action = *it;
                if (action) s += action->description();
                else cerr << "nil action pointer" << endl;
        }

        return s;
}

#pragma clang diagnostic pop
