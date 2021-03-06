/*
 *  FSMANTLRMachineVector.cc
 *  gufsm
 *
 *  Created by Rene Hexel on 3/08/12.
 *  Copyright (c) 2012, 2013, 2014 Rene Hexel and Vlad Estivill-Castro.
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

#include <iostream>
#include <sstream>
#include <cassert>
#include "FSMANTLRMachineVector.h"
#include "FSMState.h"

#include "stringConstants.h"

#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"
#pragma clang diagnostic ignored "-Wc++98-compat"
#pragma clang diagnostic ignored "-Wshorten-64-to-32"
#pragma clang diagnostic ignored "-Wsign-compare"
#pragma clang diagnostic ignored "-Wvla"

#define NO_SELF
const int LOW_RANGE = 0;
//const int HIGH_RANGE = 1;

using namespace FSM;
using namespace std;

static std::string variableNRange(string varName, DATA_TYPES isBoolean)
{
        stringstream ss;
        ss << varName<< " : " ;
        ss << "{" << LOW_RANGE<< ",";

        int high_range = isBoolean== TYPE_BOOLEAN ? 1 : PATERN_BITS;
        for (int i= LOW_RANGE+1;  i<high_range-1; i++)
                ss << i << "," ;
        ss<<  high_range << "};" << std::endl;

        return ss.str();

}

static std::string variableWithMachineID(string varName, int machineID)
{
        stringstream ss;
        ss << varName<< "M"<<machineID ;

        return ss.str();

}

string ANTLRMachineVector::generate_from( KripkeState &s, list<KripkeState> &kstates, size_t n, std::string **names, bool verbose)
{
        stringstream ss;

#ifndef NO_SELF
        {ss << kripkeToString(s, n, names, verbose) << ":\n";

        }
#endif
        /* RULE 1 :  Advance the Machien whose turn is it (its pc must be
         (OnEntry, or AfterOnEntry). The new machine in turn is
         incremented by one module the number of machine.
         */

        /* It is OnEntry, when we arrived here after a transition fired */
        KripkeState next = s;
        KripkeFreezePointVector *freeze = new KripkeFreezePointVector(*next.freeze_point);
        next.freeze_point = freeze;
        int machineToRunOnce= s.whose_turn;
        int stateToRun = (*s.freeze_point)[machineToRunOnce].stateID;

        bool debug_vlad=false;

        if (debug_vlad)
        {
                DBG(outputList(kstates, n, names, verbose));
        }

        Machine * m = machines()[machineToRunOnce];

        if ((*s.freeze_point)[machineToRunOnce].ringletStage == Epcbefore )
        { /*evaluate the expresion */
                kripkeToANTLRContext (s,n,names);
                m->setPreviousState(NULLPTR);
                m->setCurrentState(m->stateForID(stateToRun));
                m->executeOnEntry();
                /* place values in next*/
                next.variable_combination=ANTLRContextToVariableCombination(n, names);
                (*next.freeze_point)[machineToRunOnce].ringletStage=EpcAfterOnEntry;

                /* output a derived state */
                ss << "\t" << kripkeToString(next, n, names, verbose, true) << ";";
                DBG(cerr << "\t" << kripkeToString(next, n, names, verbose, true) << ";");

                ss << "\t-- machine :"<< machineToRunOnce << " executes OnEntry \n";
                DBG(cerr << "\t-- machine :"<< machineToRunOnce << " executes OnEntry \n");

                /* check next is not in the list, and if so, push it and output to the SMV output
                 */
                if (! inList(kstates,next))
                {
                        kstates.push_back(next);
                }
                else delete next.freeze_point;
        }
        else if ((*s.freeze_point)[machineToRunOnce].ringletStage == EpcAfterOnEntry )
        { /*evaluate the expresion */
                vector<int> ext_offs;
                unsigned long long vars=s.variable_combination;
                unsigned long long ext_comb; /* =  */ AllToExtVariableCombination(vars, n, names, ext_offs);
                size_t num_ext = ext_offs.size();
                /// external are always BOOLEAN
                unsigned long long n_comb = (1ULL << (num_ext));
                ss << "\t -- machine: "<< machineToRunOnce << " finished on Entry, generating * " << n_comb << " * combinations of external variables --\n";
                DBG(cerr << "\t -- machine: "<< machineToRunOnce << " finished on Entry, generating * " << n_comb << " * combinations of external variables --\n");

                for (ext_comb = 0; ext_comb < n_comb; ext_comb++)
                {
                        KripkeState current = s;
                        current.variable_combination = extVarToKripke(vars, ext_comb, ext_offs);
                        kripkeToANTLRContext (current,n,names);
                        next = current;
                        next.freeze_point = freeze;
                        m->setPreviousState(NULLPTR);
                        m->setCurrentState(m->stateForID(stateToRun));
                        if (m->numberOfTransitionsInCurrentState())
                        {
                                bool result = m->evaluateTransitionWithIndex(0);
                                ///* place values in next*/
                                (*next.freeze_point)[machineToRunOnce].ringletStage=result ? EtransitionTrue : EtransitionFalse;
                                (*next.freeze_point)[machineToRunOnce].transition_id=0;
                                /* output a derived state */
                                ss << "\t" << kripkeToString(next, n, names, verbose, true) << ( (ext_comb < n_comb-1 )? " |" : ";" );
                                ss << "\t-- machine :"<< machineToRunOnce << " evaluates Transition 0 with result " << result << " \n";
                                DBG(cerr << "\t" << kripkeToString(next, n, names, verbose, true) << ( (ext_comb < n_comb-1 )? " |" : ";" ));
                                DBG(cerr << "\t-- machine :"<< machineToRunOnce << " evaluates Transition 0 with result " << result << " \n");
                        }
                        else
                        {
                                m->executeInternal();
                                /* place values in next*/
                                next.variable_combination=ANTLRContextToVariableCombination(n, names);
                                (*next.freeze_point)[machineToRunOnce].ringletStage=EpcAfterOnEntry;
                                /* sequential scheduler pauses this FSM here and moves to next */
                                next.whose_turn = (next.whose_turn + 1) % machines().size();
                                /* output a derived state */
                                ss << "\t" << kripkeToString(next, n, names, verbose, true) <<( (ext_comb < n_comb-1 )? "|" : ";" );
                                ss << "\t-- machine :"<< machineToRunOnce << " execute internal \n";
                                DBG(cerr<< "\t" << kripkeToString(next, n, names, verbose, true) <<( (ext_comb < n_comb-1 )? "|" : ";" ));
                                DBG(cerr << "\t-- machine :"<< machineToRunOnce << " execute internal \n");
                        }


                        /* check next is not in the list, and if so, push it and output to the SMV output
                         */
                        if (! inList(kstates,next))
                        {
                                kstates.push_back(next);
                        }
                        else delete next.freeze_point;

                        if (ext_comb < n_comb - 1)
                        {
                                freeze = new KripkeFreezePointVector(*s.freeze_point);
                                next.freeze_point = freeze;
                        }
                }
                ss << "\t -- machine: "<< machineToRunOnce << " DONE WITH * " << n_comb << " * combinations of external variables --\n";
        }
        else if ((*s.freeze_point)[machineToRunOnce].ringletStage == EtransitionFalse )
        { /*evaluate the expresion */
                kripkeToANTLRContext (s,n,names);
                m->setPreviousState(NULLPTR);
                m->setCurrentState(m->stateForID(stateToRun));
                int tid = (*next.freeze_point)[machineToRunOnce].transition_id + 1;
                /*
                 * while there are further transitions to go, evaluate them
                 */
                if (tid < static_cast<int>(m->numberOfTransitionsInCurrentState()))
                {
                        bool result = m->evaluateTransitionWithIndex(tid);
                        ///* place values in next*/
                        //next.variable_combination=ANTLRContextToVariableCombination(n, names);
                        (*next.freeze_point)[machineToRunOnce].ringletStage=result ? EtransitionTrue : EtransitionFalse;
                        (*next.freeze_point)[machineToRunOnce].transition_id=tid;
                        ss << "\t" << kripkeToString(next, n, names, verbose, true) <<  ";" ;
                        ss << "\t-- machine : "<< machineToRunOnce << "evaluates Transition " << tid <<" with result " << result << " \n";
                        DBG(cerr << "\t" << kripkeToString(next, n, names, verbose, true) <<  ";") ;
                        DBG(cerr << "\t-- machine : "<< machineToRunOnce << "evaluates Transition " << tid <<" with result " << result << " \n");
                }
                else    /* all transitions exhausted, execute internal state */
                {
                        m->executeInternal();
                        /* place values in next*/
                        next.variable_combination=ANTLRContextToVariableCombination(n, names);
                        (*next.freeze_point)[machineToRunOnce].ringletStage=EpcAfterOnEntry;
                        // reset transition id
                        (*next.freeze_point)[machineToRunOnce].transition_id=0;
                        /* sequential scheduler pauses this FSM here and moves to next */
                        next.whose_turn = (next.whose_turn + 1) % machines().size();

                        /* output a derived state */
                        ss << "\t" << kripkeToString(next, n, names, verbose, true) << ";" ;
                        ss << "\t-- machine : "<< machineToRunOnce << "execute internal \n";
                        DBG(cerr<< "\t" << kripkeToString(next, n, names, verbose, true)<<";" );
                        DBG(cerr << "\t-- machine : "<< machineToRunOnce << "execute internal \n");
                }


                /* check next is not in the list, and if so, push it and output to the SMV output
                 */
                if (! inList(kstates,next))
                {
                        kstates.push_back(next);
                }
                else delete next.freeze_point;
        }
        else if ((*s.freeze_point)[machineToRunOnce].ringletStage == EtransitionTrue )
        { /*evaluate the expresion */
                kripkeToANTLRContext (s,n,names);
                m->setPreviousState(NULLPTR);
                m->setCurrentState(m->stateForID(stateToRun));
                m->executeOnExitForTransitionWithIndex((*next.freeze_point)[machineToRunOnce].transition_id);
                /* place values in next*/
                next.variable_combination=ANTLRContextToVariableCombination(n, names);
                (*next.freeze_point)[machineToRunOnce].ringletStage=Epcbefore;
                (*next.freeze_point)[machineToRunOnce].stateID = m->currentStateID();
                (*next.freeze_point)[machineToRunOnce].stateName = m->currentState()->name();
                next.whose_turn = (next.whose_turn + 1) % machines().size();

                /* output a derived state */
                ss << "\t" << kripkeToString(next, n, names, verbose, true) <<";";
                ss << "\t-- machine : "<< machineToRunOnce << " executes OnExit \n";
                DBG( cerr << "\t" << kripkeToString(next, n, names, verbose, true) <<";" );
                DBG(cerr  << "\t-- machine : "<< machineToRunOnce << " executes OnExit \n");
                /* check next is not in the list, and if so, push it and output to the SMV output
                 */
                if (! inList(kstates,next))
                {
                        kstates.push_back(next);
                }
                else delete next.freeze_point;
        }

        return ss.str();
}

void ANTLRMachineVector:: add_if_not_seen(KripkeState &x, std::list<KripkeState> &kstates )
{
        bool found = false;
        for (std::list<KripkeState>::iterator it = kstates.begin();
             it != kstates.end(); it++)
        {
                const KripkeState &t = *it;
                if (x == t) { found = true; break; }
        }
        if (!found) kstates.push_back(x);
}

string ANTLRMachineVector:: kripkeToString(KripkeState &s, size_t n, string **names, bool verbose, bool derived)
{
        stringstream ss;
        static const char * next ="next(";

        ss << (derived? next : "") << "turn " << (derived? ")" : "" )<< " = " << s.whose_turn << " & ";

        for (int i = 0; i < static_cast<int>(n); i++)
        {
                unsigned long long j = (PATERN_BITS << (i*BITS)); /*shifted left as much as i blocks of BITS */

                ss << (derived? next : "") << *names[i] << (derived? ")" : "" ) <<"=" << ((s.variable_combination & j) >> (i*BITS)) << " & ";
        }
        ss << (derived? next : "") << "pc" << (derived? ")" : "" ) << "="<< descriptionSMVformat (*s.freeze_point, verbose);


        return ss.str();
}

void ANTLRMachineVector:: kripkeToANTLRContext (KripkeState &s, size_t n, string **names)
{
        ANTLRContext* antrlContext = static_cast<ANTLRContext *>(context());

        for (int i = 0; i < static_cast<int>(n); i++)
        {

                unsigned long long j = 0;   /* a block of BITS set to 1 */

                j = (PATERN_BITS << (i*BITS)); /*shifted left as much as i blocks of BITS */

                unsigned long long value=(s.variable_combination & j) >> (i*BITS);
                antrlContext->set_variable(*names[i], int(value));
        }
        //ss << "pc="<< descriptionSMVformat (*s.freeze_point);

}

unsigned long long ANTLRMachineVector:: ANTLRContextToVariableCombination(size_t n, string **names)
{
        ANTLRContext* antrlContext = static_cast<ANTLRContext *>(context());

        unsigned long long j = 0;
        unsigned long long binary_value;

        for (int i = 0; i < static_cast<int>(n); i++)
        {
                binary_value = PATERN_BITS & antrlContext->value(*names[i]);
                j |= (binary_value << (i*BITS));
        }
        return j;
}


unsigned long long ANTLRMachineVector::AllToExtVariableCombination(unsigned long long all_vars, size_t n, string **names, vector<int> &posOfExternals)
{
        unsigned long long j = 0;
        int k = 0;                                      // ext var offset
        for (int i = 0; i < static_cast<int>(n); i++)
        {
                const string &name = *names[i];

                // has a $ and starts with E is external
                if (  (name.find('$')!=string::npos) && ('E'==name[0]) ){
                        posOfExternals.push_back(i);            // this ext is at index i
                        if (all_vars & (1ULL << (i*BITS)))             // external var TRUE?
                                j |= (1ULL << (k*BITS));               // set bit if ext var is true
                        k++;

                }

        }
        return j;
}


unsigned long long ANTLRMachineVector::extVarToKripke(unsigned long long all_vars, unsigned long long ext, const vector<int> &ext_offsets)
{
        size_t n = ext_offsets.size();
        for (int i = 0; i < static_cast<int>(n); i++)
                if (ext & (1ULL << i ))  // ext is a combiantion of single bits
                        all_vars |= (1ULL << (ext_offsets[i]*BITS) );
                else
                        all_vars &= ~(1ULL << (ext_offsets[i]*BITS) );
        return all_vars;
}


string ANTLRMachineVector::kripkeInSVMformat(bool verbose)
{
        stringstream ss;
        ANTLRContext* antlr_context = static_cast<ANTLRContext *>(context());

        /* Write the preamble */

        ss << "MODULE main" << endl;
        ss << endl;
        /* We need to find all the variables */

        /* Do we have variables? */
        int number_of_variables=0;
        if (!antlr_context->isEmpty())
        {
                ss <<"VAR" << endl;
                ss <<"     -- variables used in the example FSM have a simple range" << endl;

                /* print variables of this machine in smv fromat*/
                /* ALL BOOLEAN, TODO, make integer values */
                for (map<string, int>::iterator it = antlr_context->variables().begin();
                     it != antlr_context->variables().end(); it++)
                {
                        const pair<string, int> &p = *it;
                        if (antlr_context->external_variable_exists(p.first))
                                continue;

                        DATA_TYPES the_type=antlr_context->theVariableType(p.first);
                        ss << variableNRange(p.first,the_type);
                        number_of_variables++;
                }
        }
        // range of the variable turn */
        ss << "turn : {" ;

        for (int i=0; i < static_cast<int>(machines().size())-1; i++)
        {  ss << i <<"," ;
        }
        ss << machines().size() -1 << "};\n" << std::endl;

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
        vector<int>  indexesPerFSM(machines().size() );
        vector<int>  maxIndexesPerFSM(machines().size() );
        for (MachineVector::iterator it = machines().begin();
             it != machines().end(); it++)
        {
                SuspensibleMachine *m = *it;
                m->localKripkeStateNames(true);
                maxIndexesPerFSM[i]= int(m->sizeLocalKripkeStateNames())-1;
                indexesPerFSM[i]=0;

                i++; // increment the Machine coutner
        }


        /* We generate all combinatios of states as pc positions for the
         global Kripke structure, in fact we expect many of this never
         to happen
         */
        vector<KripkeFreezePointVector> kripkePCValues;
        bool all_at_max=false;
        bool first=true;
        while (! all_at_max)
        {   //bool carryOn=false;
                i = 0;
                if (!first) ss<<",\n";
                first = false;

                KripkeFreezePointVector pcKripkeValue;

                for (MachineVector::iterator it = machines().begin();
                     it != machines().end(); it++)
                {
                        SuspensibleMachine *m = *it;
//                        KripkeFreezePointOfMachine freezePoint;
//                        freezePoint.machine=m;
//                        (void)freezePoint;  // really?

                        pcKripkeValue.push_back(m->localKripkeStateNames() [indexesPerFSM[i]]);
                        i++;
                }
                /* DEBUGGING */
                DBG(cout <<descriptionSMVformat(pcKripkeValue) << endl);


                int column =0;
                for (MachineVector::iterator it = machines().begin();
                     it != machines().end(); it++)
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
                ss << descriptionSMVformat ( pcKripkeValue, verbose) ;
                kripkePCValues.push_back( pcKripkeValue );
        }// while




        ss << "};" << std::endl;
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
        int firstMachine=0;
        ss  << "turn = " << firstMachine << " & " << "pc=" << descriptionSMVformat (kripkePCValues[firstMachine], verbose);

        /* Write the TRANS states section */
        ss << "\nTRANS"  << std::endl;
        ss << " case"  << std::endl;
        ss << "\t\t-- each state has a loop transition, Kripke structures are total"  << std::endl;

        /* all combinations of valuations of variables (internal and extrenal */
        /* generate a context  */
        /* initial Kripke states will be palced in a queue              */

        size_t n = number_of_variables;
        string *names[n];
        i = 0;
        int totalBits=0;
        _typeBoolMask=0;
        for (map<string, int>::iterator it = antlr_context->variables().begin();
             it != antlr_context->variables().end(); it++)
        {
                const pair<string, int> &p = *it;
                if (antlr_context->external_variable_exists(p.first))
                        continue;
                names[i++] = new string(p.first);

                DATA_TYPES aVariableType = antlr_context->theVariableType(*names[i-1]);
                if (TYPE_BOOLEAN ==aVariableType)
                {   _typeBoolMask |=  (1ULL << (i-1));
                        totalBits++;
                }
                else{
                        totalBits+=BITS;
                }

                DBG( std::cerr << " Variable " << names[i-1]->c_str() << " has type : " << aVariableType << std::endl; )


        }
        assert(i == static_cast<int>(n));
        assert(totalBits < 64); // memory word is a limit

        list<KripkeState> kstates;
        unsigned long long combinations = (1ULL << (totalBits));
        for (unsigned long long k = 0; k < combinations; k++)
        {
                unsigned long long regularPack =0;
                int positionInCombiantion=0;
                for (int varNumber=0; varNumber < static_cast<int>(n); varNumber++)
                {
                        if (_typeBoolMask & (1ULL << varNumber))
                                //copyBit
                        { unsigned long long oneBit = (k & (1ULL << positionInCombiantion) ) != 0 ? 1ULL : 0;
                                positionInCombiantion++;
                                regularPack |= oneBit << (BITS*varNumber);
                        }
                        else //copyBITS;
                        { unsigned long long theBits = PATERN_BITS & (k >> positionInCombiantion) ;
                                regularPack |= theBits << (BITS*varNumber);
                                positionInCombiantion+=BITS;
                        }
                }
                kstates.push_back(KripkeState(regularPack, &kripkePCValues[0]));
        }

        for (std::list<KripkeState>::iterator it = kstates.begin();
             it != kstates.end(); it++)
        {       /* printing a Kiprke state  */
                /* as source */
                KripkeState &s = *it;
                ss << kripkeToString(s, n, names, verbose) << ":\n";
                DBG(cerr << kripkeToString(s, n, names, verbose) << ":\n");

                ss << generate_from(s, kstates,n,names, verbose);
        }

        /* Write the exhaustive condition  */
        ss << "TRUE:"  << kripkeToString(kstates.front(), n, names, verbose, true) << ";"<< std::endl;
        /* Write the closing ESAC  */
        ss << "esac"  << std::endl;

        for (i = 0; i < static_cast<int>(n); i++)
                delete names[i];

        return ss.str();

}

std:: string ANTLRMachineVector ::descriptionSMVformat(const KripkeFreezePointVector &data, bool verbose)
{
        stringstream ss;
        for (KripkeFreezePointVector::const_iterator it = data.begin();
             it != data.end(); it++)
        {
                const KripkeFreezePointOfMachine &machineRingletState = *it;

                ss << "M"<< machineRingletState.machine->id();
                ss << "S"<< machineRingletState.stateID;
                if (verbose)
                {
                        ss << machineRingletState.stateName << "R";
                        switch (machineRingletState.ringletStage) {
                                case Epcbefore:
                                        ss << "beforeOnEntry";
                                        break;
                                case EpcAfterOnEntry:
                                        ss << "afterOnEntry";
                                        break;
                                case EBeforeTransition:
                                        ss << "beforeTransition";
                                        break;
                                case EtransitionFalse:
                                        ss << "transitionFalse";
                                        break;
                                case EtransitionTrue:
                                        ss << "transitionTrue";
                                        break;
                                case ETOTAL_NUM_VALUES:
                                        ss << "invalid";
                                        break;
                        }
                }
                else
                {
                        ss << "R" << machineRingletState.ringletStage;
                }
                if (EpcAfterOnEntry < machineRingletState.ringletStage)
                        ss << "T" << machineRingletState.transition_id;
        }
        return ss.str();
}

bool ANTLRMachineVector :: inList( const std::list<KripkeState>  & list , const KripkeState &theCandidate)
{
        DBG(cerr << list.size() << "\n");
        for (std::list<KripkeState>::const_iterator it = list.begin();
             it != list.end(); it++)
        {
                const KripkeState &kp = *it;

                if ( theCandidate == kp) return true;
        }
        return false;
}

void ANTLRMachineVector ::    outputList ( std::list<KripkeState>  & list , size_t n, string **names, bool verbose)
{
        cerr << list.size() << "\n";
        int i=0;
        for (std::list<KripkeState>::iterator it = list.begin();
             it != list.end(); it++)
        {
                KripkeState &kp = *it;

                cerr <<   i  << " varibale comb: " << kp.variable_combination <<
                " whose turn " << kp.whose_turn <<
                " vector pointer FrezzePointVector " << kp.freeze_point <<std::endl ;
                KripkeFreezePointVector::iterator it2 = kp.freeze_point->begin();
                while (it2 != kp.freeze_point->end())
                {
                        cerr << "    machine ponter: " << it2->machine;
                        cerr << "    stateID: " << it2->stateID;
                        cerr << "    ringletStage: " << it2->ringletStage;
                        cerr << "    transitionID: " << it2->transition_id;
                        *it2++;
                }
                
                cerr << " " <<  kripkeToString (kp,n,names, verbose) << std::endl;
                i++;
        }
        
}

#pragma clang diagnostic pop
