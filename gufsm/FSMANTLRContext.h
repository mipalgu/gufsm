/*
 *  FSMWBMachine.h
 *  
 *  Created by René Hexel on 18/10/11.
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
#ifndef gufsm_FSANTLRContext_h
#define gufsm_FSANTLRContext_h

#include <map>
#include <string>
#include <sstream>
#include <antlr3.h>
#include "FSMWBContext.h"

namespace FSM
{
        class ANTLRContext: public WBContext
        {
                std::map<std::string, int> _internal_variables; /// our own state-machine internal variables
                std::map<std::string, int>::iterator it; // the iterator in the map
        public:
                /**
                 * default constructor
                 * @param wb pointer to an already opened whiteboard
                 * @param deletewb delete wb pointer when destructed (only relevant if wb is non-NULL, otherwise the whiteboard will always be deleted in the destructor
                 */
                ANTLRContext(guWhiteboard::Whiteboard *wb = NULL, bool deletewb = false): _internal_variables(), WBContext(wb, deletewb) {}
                /** variable getter */
                std::map<std::string, int> &internal_variables() { return _internal_variables; }
                /** set internal variable */
                void set_internal_variable(std::string name, int val = 0)
                {
                        internal_variables()[name] = val;
                }
                /** get internal variable value */
                int value(std::string name)
                {
                        return internal_variables()[name];
                }
                /** find variable */
                bool exists(std::string name)
                {
                        return internal_variables().count(name) != 0;
                }
                
                /** all names of internal variables */
                std::string allNames ()
                {
                        std::stringstream ss;
                        
                        for ( it=_internal_variables.begin() ; it != _internal_variables.end(); it++ )
                                ss << (*it).first << " " ;
                        return ss.str();
                }
                
                /** do we have internal variables */
                bool isEmpty()
                {
                        return internal_variables().empty();
                }
                
                /** give me the first internal variable */
                std::string firstName()
                {
                        std::string s;
                        
                        it=_internal_variables.begin();
                        if (it != _internal_variables.end())
                                return(*it).first;
                        else return s;
                        
                }
                
                /** give me the next internal variable (or NULL if not any more */
                std::string nextName()
                {       std::string s;
                        it++;
                        if (it != _internal_variables.end())
                                return(*it).first;
                        else return s;
                        
                }
        };
}

#endif
