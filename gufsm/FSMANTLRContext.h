/*
 *  FSMANTLRContext.h
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

extern "C"
{
#include <antlr3.h>
#undef false
#undef true
}
#include <map>
#include <string>
#include <sstream>
#include<iostream>
#include "FSMWBContext.h"

#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshorten-64-to-32"
#pragma clang diagnostic ignored "-Wsign-compare"
#pragma clang diagnostic ignored "-Wpadded"

enum DATA_TYPES {TYPE_BOOLEAN, TYPE_NON_NEGATIVE_INT};

namespace FSM
{
        class Expression;
        class ANTLRContext: public WBContext
        {
                std::map<std::string, int> _variables; /// our own state-machine internal variables
                std::map<std::string, DATA_TYPES> _variable_type; /// the type of a variable
                std::map<std::string, Expression *> _functions; /// well known functions
        public:
                /**
                 * default constructor
                 * @param wb pointer to an already opened whiteboard
                 * @param deletewb delete wb pointer when destructed (only relevant if wb is non-NULL, otherwise the whiteboard will always be deleted in the destructor
                 */
                ANTLRContext(guWhiteboard::Whiteboard *wb = NULL, bool deletewb = false): WBContext(wb, deletewb), _variables() {}
                ANTLRContext(const ANTLRContext &orig): _variables(((ANTLRContext &)orig).variables()) {}

                /** variable getter */
                std::map<std::string, int> &variables() { return _variables; }
                /** set internal variable */
                void set_variable(std::string name, int val = 0)
                {
                        variables()[name] = val;
                }
                /** variable type getter */
        std::map<std::string, DATA_TYPES> &variablesType() { return _variable_type; }
        /** set type of internal variable */
        void set_variable_type(std::string name, DATA_TYPES val = TYPE_BOOLEAN)
        {
        variablesType()[name] = val;
        }
        
                /** return the qualfied name for an internal variable for a given machine */
                std::string internal_variable_name(const std::string &name, int mid)
                {
                        std::stringstream ss;
                        ss << "M" << mid << "$$" << name;
                        return ss.str();
                }
               /** set internal variable */
                void set_internal_variable(const std::string &name, int mid, int val = 0)
                {
                        variables()[internal_variable_name(name, mid)] = val;
                }
                /** set internal variable and type*/
                void set_internal_variable_and_type(const std::string &name, int mid, int val = 0, DATA_TYPES theType=TYPE_BOOLEAN)
                {
                        variables()[internal_variable_name(name, mid)] = val;
                        variablesType()[internal_variable_name(name, mid)] = theType;
                        
                        
                }
                /** get internal variable value */
                int value(const std::string &name)
                { // don't think this is right,
                  //needs mapping an M$$ infront
                        return variables()[name];
                }
                
                std::string external_variable_name(const std::string &name)
                {
                        std::stringstream ss;
                        ss << "E$$" << name;
                        return ss.str();
                }
                /** set external variable */
                void set_external_variable(const std::string &name, int val = 0, DATA_TYPES theType=TYPE_BOOLEAN)
                {
                        const std::string &ext_name = external_variable_name(name);
                        variables()[ext_name] = val;
                        variablesType()[ext_name] = theType;
                        
                        
                }
                /**
                 * remove leading E$$ from external variable name
                 */
                std::string visible_variable_name_for_extern(const std::string &name)
                {
                        return name.substr(3);
                }
                

                /**
                 * check if name is an external variable name
                 */
                bool name_is_external_variable(const std::string &name)
                {
                        return name.substr(0,2) == "E$";
                }
		
		/**
		 * check if name is an internal variable name
		 */
		bool name_is_internal_variable(const std::string &name)
		{
			return name.substr(0, 1) == "M" &&
			       name.find("$$") != -1;
			
		}
                
                
            /** get internal variable type */
            DATA_TYPES theVariableType(const std::string &name)
            {
                return variablesType()[name];
            }
        
                /** find variable */
                bool exists(const std::string &name)
                {
                        return variables().count(name) != 0;
                }
                
                /** find external variable */
                bool external_variable_exists(const std::string &name)
                {
                        return exists(external_variable_name(name));
                }
                
                /** find internal variable for given machine ID */
                bool internal_variable_exists(int mid, const std::string &name)
                {
                        return exists(internal_variable_name(name, mid));
                }

                /** get cached external variable  */
                int external_cached_variable_value(const std::string &name)
                {
                        return value(external_variable_name(name));
                }
                
                /** find internal variable for given machine ID */
                int internal_variable_value(int mid, const std::string &name)
                {
                        return value(internal_variable_name(name, mid));
                }
		
		/** Extract the machine id from the given variable name. 
		    Returns -1 if name is not the name of an internal 
		    variable. */
		int internal_variable_mid(const std::string &name);
                
                /** all names of internal variables */
                std::string allNames();

                /** description of the context's internal variables */
                std::string description();

                /** do we have internal variables */
                bool isEmpty()
                {
                        return variables().empty();
                }

                /** take a current snapshot from the whiteboard */
                virtual void take_snapshot();

                /*
                 * functions
                 */
                /** variable getter */
                std::map<std::string, Expression *> &functions() { return _functions; }
                /** set internal variable */
                void set_function(std::string name, Expression *e)
                {
                        functions()[name] = e;
                }

                /** get internal variable value */
                Expression *expression_for_function(const std::string &name)
                {
                        return functions()[name];
                }
                /** find function */
                bool function_exists(const std::string &name)
                {
                    //std::cout << functions().count(name) << std::endl;
                        return functions().count(name) != 0;
                }
                
        
        };
}

#pragma clang diagnostic pop

#endif
