/*
 *  FSMActivity.h
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
#ifndef gufsm_FSMActivity_h
#define gufsm_FSMActivity_h

#include <vector>
#include "FSMAction.h"

/**
 * An activity is a set of actions for onEntry, onExit, and internal stages
 */
class FSMActivity
{
        std::vector <FSMAction *> _onEntryActions;   /// on entry actions
        std::vector <FSMAction *> _internalActions;  /// internal actions
        std::vector <FSMAction *> _onExitActions;    /// on exit actions
        
        /** perform actions */
        void perform(int state, ActionStage stage,
                     const std::vector <FSMAction *> &actions)
        {
                for (FSMAction *a: actions)
                        a->perform(state, stage);
        }
        
public:
        /** return the std::vector of actions that happen on entry */
        std::vector <FSMAction *> &onEntryActions() { return _onEntryActions; }

        /** set the on entry actions */
        void setOnEntryActions(const std::vector <FSMAction *> &av) { _onEntryActions = av; }

        /** add an on entry action */
        void addOnEntryAction(FSMAction *a) { _onEntryActions.push_back(a); }

        /** return the std::vector of actions that happen internally */
        std::vector <FSMAction *> &internalActions() { return _internalActions; }
        
        /** set the on entry actions */
        void setInternalActions(const std::vector <FSMAction *> &av) { _internalActions = av; }

        /** add an internal action */
        void addInternalAction(FSMAction *a) { _internalActions.push_back(a); }
        
        /** return the std::vector of actions that happen on exit */
        std::vector <FSMAction *> &onExitActions() { return _onExitActions; }

        /** set the on exit actions */
        void setOnExitActions(const std::vector <FSMAction *> &av) { _onExitActions = av; }

        /** add an on exit action */
        void addOnExitAction(FSMAction *a) { _onExitActions.push_back(a); }

        /** perform actions for state and stage */
        void perform(int state, ActionStage stage);
        
        /** perform actions for state and stage */
        void performOnEntry(int state) { perform(state, STAGE_ON_ENTRY, _onEntryActions); }

        /** perform actions for state and stage */
        void performInternal(int state) { perform(state, STAGE_INTERNAL, _internalActions); }

        /** perform actions for state and stage */
        void performOnExit(int state) { perform(state, STAGE_ON_EXIT, _onExitActions); }
};


#endif
