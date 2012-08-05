/*
 *  FSMANTLRMachineVector.h
 *  gufsm
 *
 *  Created by Rene Hexel on 3/08/12.
 *  Copyright (c) 2012 Rene Hexel and Vlad Estivill-Castro. All rights reserved.
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
#ifndef __gufsm__FSMANTLRMachineVector__
#define __gufsm__FSMANTLRMachineVector__

#include "FSMachineVector.h"

const int BITS = 3;
const unsigned long long PATERN_BITS = (1ULL << (const unsigned long long) BITS)-1ULL; // BITS all set to 1

namespace FSM
{
        class ANTLRContext;

        /**
         * State machine vector using ANTLR ASTs
         */
        class ANTLRMachineVector: public StateMachineVector
        {
                unsigned long long   _typeBoolMask; // i-th bit is 1 if variable is Boolean, 0 if is non-negative integer of BITS
                unsigned long long   _externKripkeMask; // i-th bit is 1 if variable is external, that is can be changed outside all the machines in the vector
        public:
                /// Default constructor
                ANTLRMachineVector(ANTLRContext *context): StateMachineVector((Context *)context), _typeBoolMask(0ULL), _externKripkeMask(0ULL) {}

                /// generate Kripke String
                std::string generate_from(KripkeState &, std::list<KripkeState> &, size_t n, std::string **names);
                /// convert Kripke state to a string
                std::string kripkeToString(KripkeState &s, size_t n, std::string **names, bool derived=false);

                void add_if_not_seen(KripkeState &, std::list<KripkeState> &);
                void  kripkeToANTLRContext (KripkeState &s, size_t n, std:: string **names);
                unsigned long long  ANTLRContextToVariableCombination(size_t n, std:: string **names);
                unsigned long long  AllToExtVariableCombination(unsigned long long v, size_t n, std:: string **names, std::vector<int> &posOfExternals);
                unsigned long long extVarToKripke(unsigned long long all_vars, unsigned long long ext, const std::vector<int> &ext_offsets);
                bool inList( const std::list<KripkeState>  & , const KripkeState &);
                void outputList (  std::list<KripkeState>  & , size_t n, std::string **names);

                /**
                 * print the Kripke structure in smv format
                 */
                virtual std::string kripkeInSVMformat();

                /**
                 * Serialise a Kripke Gobal vector in smv format
                 */
                std::string descriptionSMVformat(KripkeFreezePointVector &);
        };
}
#endif /* defined(__gufsm__FSMANTLRMachineVector__) */
