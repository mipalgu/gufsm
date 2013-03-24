/*
 *  clfsm_vector_factory.cc
 *  clfsm
 *
 *  Created by Rene Hexel on 5/09/12.
 *  Copyright (c) 2012 Rene Hexel. All rights reserved.
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
#include "FSMachineVector.h"
#include "clfsm_factory.h"
#include "clfsm_vector_factory.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-parameter"

using namespace std;
using namespace FSM;

CLFSMVectorFactory::CLFSMVectorFactory(Context *context, bool del): _context(context), _clmachines(), _clfactories(), _delete(del)
{
        _fsms = new StateMachineVector(context);
}


CLFSMVectorFactory::~CLFSMVectorFactory()
{
        if (_delete) delete _fsms;
}


SuspensibleMachine *CLFSMVectorFactory::addMachine(CLMachine *clm, int index, bool resume)
{
        int n = int(_clmachines.size());
        if (index < 0) index = n;
        else if (index > n) throw "invalid index";

        CLFSMFactory *factory = machine_factory(clm, index);

        if (index < n)
        {
                _clmachines[index] = clm;
                if (_clfactories[index]) delete _clfactories[index];
                _clfactories[index] = factory;
        }
        else
        {
                _clmachines.push_back(clm);
                _clfactories.push_back(factory);
        }

        SuspensibleMachine *m = factory->machine();
        _fsms->addMachine(m, index);

        return m;
}


CLFSMFactory *CLFSMVectorFactory::machine_factory(CLMachine *clm, int index)
{
        return new CLFSMFactory(_context, clm, index, _delete);
}

#pragma clang diagnostic pop
