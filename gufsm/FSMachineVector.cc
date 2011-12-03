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
#include <iostream>
#include <sstream>
#include <cassert>
#include "FSMachineVector.h"
#include "FSMANTLRContext.h"
#include "stringConstants.h"


const bool  NO_SELF =true;

const int LOW_RANGE =0;
const int HIGH_RANGE =1;


using namespace FSM;
using namespace std;

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
        ss << varName<< " : " ;
        ss << "{" << LOW_RANGE<< ",";
        for (int i= LOW_RANGE+1;  i<HIGH_RANGE-1; i++)
                ss << i << "," ;
        ss<<  HIGH_RANGE << "};" << std::endl;
        
        return ss.str();
        
}

static std::string variableWithMachineID(string varName, int machineID)
{
        stringstream ss;
        ss << varName<< "M"<<machineID ;
        
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

string StateMachineVector::generate_from( KripkeState &s, list<KripkeState> &kstates, size_t n, std::string **names)
{
        stringstream ss;
        
        if(!NO_SELF)
        {ss << kripkeToString(s, n, names) << ":\n";
                
        }
        
        return ss.str();
        ;
}

void StateMachineVector:: add_if_not_seen(KripkeState &x, std::list<KripkeState> &kstates )
{
        
        bool found = false;
        for (auto t: kstates)
                if (x == t) { found = true; break; }
        if (!found) kstates.push_back(x);
}

string StateMachineVector:: kripkeToString(KripkeState &s, size_t n, string **names)
{
        stringstream ss;
        
        for (int i = 0; i < n; i++)
        {
                unsigned long long j = (1ULL << i);
                ss << *names[i] << "=" << ((s.first & j) ? 1 : 0) << "&";
        }
        ss << "pc="<< descriptionSMVformat (*s.second);
        
        
        return ss.str();
}

string StateMachineVector::kripkeInSVMformat()
{
        stringstream ss;
        ANTLRContext *antlr_context = (ANTLRContext *) context();

        /* Write the preamble */
        
        ss << "MODULE main" << endl;
        ss << endl;
        /* We need to find all the variables */
        
        /* Do we have variables? */
        if (!antlr_context->isEmpty())
        {
                ss <<"VAR" << endl;
                ss <<"     -- variables used in the example FSM have a simple range" << endl;
        
                /* print variables of this machine in smv fromat*/
                /* ALL BOOLEAN, TODO, make integer values */
                for (auto p: antlr_context->variables())
                        ss << variableNRange(p.first);
        }

        /* Write the range of the pc variable using the states */
        ss <<"     -- for each state of each FSM, we have a PC that can be" << std::endl;
        ss <<"     -- a) "  << pcBefore << "arrival to the state (which is After the OnExit of the state)"  << std::endl;
        ss <<"     -- b) "  << pcAfterOnEntry << " (activities of OnEntry section are executed )"  << std::endl;
        ss <<"     -- c) "  << pcBefore << " (a Boolean expression " << pcBeforeEvaluate << " labeling a transition by external variables ) " << std::endl;
        ss <<"     -- d) "  << pcAfterEvaluate << " (a Boolean expression " << pcBoolean << " labeling a transition is evaluted ) and results in " << pcTrue  << std::endl;
        ss <<"     -- e) "  << pcAfterEvaluate << " (a Boolean expression " << pcBoolean << " labeling a transition is evaluted ) and results in " << pcFalse  << std::endl;

        /* TODO: THIS IS WRONG, the pc of the Kripke structure shoud
                be the Cartesian product of the individual machines PCs
         */
                ss << "pc : {"  << std::endl;
                //m->kipkeInSVMformat() << endl;
            
        // For each machine we need the possible (individual) Kripke states
        //
        int i = 0;
        std:vector<int>  indexesPerFSM(machines().size() );
        vector<int>  maxIndexesPerFSM(machines().size() );
        for (Machine *m: machines())
        {  
                
                m->localKripkeStateNames(true);
                maxIndexesPerFSM[i]=(int)m->sizeLocalKripkeStateNames()-1;
                indexesPerFSM[i]=0;
                        
           i++; // increment the Machine coutner
        }
        

        /* We generate all combinatios of states as pc positions for the
           global Kripke structure, in fact we expect many of this never
           to happen
         */
        vector<KripkeFrezzePointVector> kripkePCValues;
        bool all_at_max=false;
        bool first=true;
        while (! all_at_max)
         {   //bool carryOn=false;
                 i = 0;
                 if (!first) ss<<",\n";
                 first = false;
                 
                 KripkeFrezzePointVector pcKripkeValue;
                 
                 for (Machine *m: machines())
                 {      KripkeFrezzePointOfMachine freezePoint;
                         freezePoint.machine=m;
                         
                         pcKripkeValue.push_back(m->localKripkeStateNames() [indexesPerFSM[i]]);
                         i++;
                 }
                 /* DEBUGGING */
                 cout <<descriptionSMVformat(pcKripkeValue) << endl;
                
                 
                 int column =0;
                 for (Machine *m: machines())
                 {
                         if(indexesPerFSM[column]<maxIndexesPerFSM[column])
                         { indexesPerFSM[column]++;
                                 all_at_max=false;
                                 break;}
                         else{
                        indexesPerFSM[column]=0;
                                 if(0==column) all_at_max=true;
                               
                         //carryOn=true;
                         }
                         column++;
                 }
                 ss << descriptionSMVformat ( pcKripkeValue) ;
                 kripkePCValues.push_back( pcKripkeValue );
         }// while
                 

         
        
        ss << "}" << std::endl;
        ss << std::endl;
        
        
        /* Write the initial states section */
        //fsmState* initialState=iniFile->theFirstState();
        
        // A state is an initial Kripke state if
        // it is the combiantion of all initial states of the idnepndent FSM
        // and any combiantion that results in a valuation of the external
        // variables
        
        //The intiailVlaue of the pc for the Kripke structure is
        // detailed first
        
        ss << "INIT"  << std::endl;
        ss << "pc=" << descriptionSMVformat (kripkePCValues[0]);

        /* Write the TRANS states section */
        ss << "TRANS"  << std::endl;
        ss << " case"  << std::endl;
        ss << "\t\t-- each state has a loop transition, Kripke structures are total"  << std::endl;
        
        /* all combinations of valuations of variables (internal and extrenal */
        /* generate a context  */
        /* initial Kripke states will be palced in a queue              */
        
        size_t n = antlr_context->variables().size();
        string *names[n];
        i = 0;
        for (auto p: antlr_context->variables())
                names[i++] = (string *) &p.first;

        assert(i == n);
        assert(n < 64);

        list<KripkeState> kstates;
        unsigned long long combinations = (1ULL << n);
        for (unsigned long long k = 0; k < combinations; k++)
                kstates.push_back(KripkeState(k, &kripkePCValues[0]));

        for (auto s: kstates)
        {       /* printing a Kiprke state  */
                /* as source */
                ss << kripkeToString(s, n, names) << ":\n";
                ss << generate_from(s, kstates,n,names);
        }

        /* construc the first valuation as a the context */
        
        /*
        std::string aVarName = iniFile->theFirst();
        Valuation* val1 = new Valuation (aVarName,LOW_RANGE);
        
        Context* aContext = new Context (val1);
        
        aVarName=iniFile->nextVariable();
        while (aVarName.length() > 0)
        {
                val1 = new Valuation (aVarName,LOW_RANGE);
                aContext->addPair(val1);
                aVarName=iniFile->nextVariable();
        }
        */
        /* write first context and the pc in Initial State(s) */
        /*
        KripkeState* anInitial = new KripkeState(aContext,pcBefore,initialState,0);
         */
        
        return ss.str();
        
}

std:: string StateMachineVector ::descriptionSMVformat(KripkeFrezzePointVector &data)
{       stringstream ss;
        for (auto machineRingletState: data)
        {       
                ss << "M"<< machineRingletState.machine->id();
                ss << "S"<< machineRingletState.stateID;
                ss << "R" << machineRingletState.ringletStage;
                if (EpcAfterOnEntry < machineRingletState.ringletStage)
                        ss << "T" << machineRingletState.transition_id;
        }
        return ss.str();
}


