/*
 *  clfsm_machine.h
 *  clfsm
 *
 *  Created by Rene Hexel on 11/10/12.
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
#ifndef __gufsm__clfsm_machine__
#define __gufsm__clfsm_machine__

#include <string>
#include <vector>
#include "clfsm_cc_delegate.h"

namespace FSM
{
        class MachineWrapper
        {
                std::string _fullPath;
                std::string _name;
                class Cc *_compiler;
                bool _delete_compiler;
        public:
                MachineWrapper(std::string path);
                virtual ~MachineWrapper();

                /// return the name of the machine (without path and extension)
                const char *name() const { return _name.c_str(); };

                /// return the full file system path of the machine
                const char *path() const {return _fullPath.c_str(); }

                /// return the full file system path of the binary directory
                std::string binaryDirectory() const;

                /// set the compiler
                virtual void setCompiler(Cc *compiler = nullptr, bool del = false);

                /// get the compiler
                Cc *compiler() const { return _compiler; }

                /// return the states of the given machine
                std::vector<std::string> states() const;

                /// compile the given machine
                virtual bool compile(const std::vector<std::string> &args, const std::vector<std::string> &linker_args);

                /// compile the given machine with same args for compiler and linker
                bool compile(const std::vector<std::string> &args) { return compile(args, args); }
        };
}

#endif /* defined(__gufsm__clfsm_machine__) */
