/*
 *  FSMachineVector.cc
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
#include <sstream>
#include "FSMachineVector.h"
#include "FSMANTLRContext.h"

const bool  NO_SELF =true;

const int LOW_RANGE =0;
const int HIGH_RANGE =1;


using namespace FSM;

static void default_idle_sleep(useconds_t t)
{
        usleep(t);
}


StateMachineVector::StateMachineVector(Context *ctx, useconds_t timeout,
                                       idle_f default_idle_function):
        _context(ctx), _machines(), _idle_timeout(timeout), _accepting(false)
{
        if (!default_idle_function) default_idle_function = default_idle_sleep;
        _no_transition_fired = default_idle_function;
}


bool StateMachineVector::executeOnce()
{
        bool fired = false;

        setAccepting(true);

        for (SuspensibleMachine *m: machines()) if (!m->isSuspended())
        {
                bool a = !m->executeOnce();
                setAccepting(a && accepting());

                if (m->previousState() != m->currentState()) fired = true;
        }

        return fired;
}


void StateMachineVector::execute()
{
        do
        {
                if (!executeOnce() && _no_transition_fired)
                        _no_transition_fired(_idle_timeout);
        }
        while (!accepting());
}


void StateMachineVector::initialise()
{
        for (SuspensibleMachine *m: machines())
                m->initialise();
}


void StateMachineVector::restart()
{
        for (SuspensibleMachine *m: machines())
                m->restart();
}

using namespace std;

static std::string variableNRange(string varName)
{
        stringstream ss;
        ss << varName << " : " ;
        ss << "{" << LOW_RANGE<< ",";
        for (int i= LOW_RANGE+1;  i<HIGH_RANGE-1; i++)
                ss << i << "," ;
        ss<<  HIGH_RANGE << "};" << std::endl;
        
        return ss.str();
        
}

string StateMachineVector::description()
{
        stringstream ss;
        int i = 0;
        for (Machine *m: machines())
                ss << "\nVector Machine " << i++ << ":\n" <<
                m->description() << endl;

        return ss.str();
}

string StateMachineVector::kipkeInSVMformat()
{
        stringstream ss;
        
        /* Write the preamble */
        
        bool haveExternalVariables = false;
        bool haveInternalVariables = false;
        
        ss << "MODULE main" << endl;
        ss << endl;
        /* We need to find all the variables */
        
        /* Do we have internal variables */
        
        int i = 0;
        for (Machine *m: machines())
        {       /* Accumulate wheather ther are  variables declared in each FSM */
                ANTLRContext *antlr_context = (ANTLRContext *) m->context();
                haveInternalVariables = haveInternalVariables || (!antlr_context->isEmpty());
        }
        
        /* Do we have external variables */
         
        if (haveExternalVariables || haveInternalVariables)
        {
        ss <<"VAR" << endl;
        ss <<"     -- variables used in the example FSM have a simple range" << endl;
        
                /* the internal variables first */
        i = 0;
        for (Machine *m: machines())
                {
                ANTLRContext *antlr_context = (ANTLRContext *) m->context();
                if (!( antlr_context->isEmpty()) )
                    /* print internal variables of this machine in svn fromat*/
                    /* ALL BOOLEAN, TODO, make integer values */
                { ss << variableNRange( antlr_context->firstName() );
                            
                  string aName =antlr_context->nextName();
                  while (aName.compare(""))
                            {ss   << variableNRange( aName);                                  
                            }
                            
                }
                
                //m->kipkeInSVMformat() << endl;
                }
        }
        return ss.str();
        
}
