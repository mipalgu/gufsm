/*
 *  FSMExpression.h
 *  
 *  Created by René Hexel on 23/09/11.
 *  Copyright (c) 2011, 2013-2014, 2018, 2021 Rene Hexel.
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
#ifndef gufsm_FSMExpression_h
#define gufsm_FSMExpression_h

#include <string>
#include <sstream>
#include <gu_util.h>

#ifdef bool
#undef bool
#endif

#ifdef true
#undef true
#undef false
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wshorten-64-to-32"
#pragma clang diagnostic ignored "-Wweak-vtables"
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"
#pragma clang diagnostic ignored "-Wunused-parameter"

namespace FSM
{
        class Machine;

        /**
         * Abstract expression class
         */
        class Expression
        {
        public:
                /** destructor */
                virtual ~Expression() {}

                /** evaluation needs to be performed by sublcasses */
                virtual int evaluate(Machine *m = NULLPTR) = 0;

                /** print abstract expression */
                virtual std::string description()
                {
                        std::stringstream ss;
                        ss << "Abstract Expression " << reinterpret_cast<long>(this);
                        return ss.str();
                }
                /** add a parameter (abstract method, does nothing) */
                virtual void add_parameter(int, long long) {}
        };
        
        /**
         * Simple boolean predicate representation
         * This still needs to be subclassed to do anything useful
         * such as querying a Whiteboard
         */
        class Predicate: public Expression
        {
                std::string _name;              /// name of the predicate
                int _value;                    /// value of the predicate
                bool _negation;                 /// is this a negation?
        public:
                /** default constructor */
                Predicate(const std::string &p = "TRUE", bool v = true, bool neg = false):
                                _name(p), _value(v), _negation(neg) {}

                /** destructor */
                virtual ~Predicate() OVERRIDE {}

                /** return the predicate name */
                const std::string &name() { return _name; }
                
                /** set the predicate name */
                void setName(const std::string &n) { _name = n; }
                
                /** return the predicate value */
                bool value() { return _value; }

                /** set the predicate value */
                void setValue(int v) { _value = ( v != false ); }

                /** return the predicate value */
                bool isNegation() { return _negation; }

                /** set the predicate value */
                void setNegation(bool n = true) { _negation = ( n != false ); }

                /** return the value, negated if necessary */
                virtual int evaluate(Machine *m = NULLPTR) OVERRIDE { return _value ^ _negation; }

                /** print abstract expression */
                virtual std::string description() OVERRIDE;

        };

        class TimeoutPredicate: public Expression
        {
                long _timeout;                  /// microseconds to time out
        public:
                /** default constructor */
                TimeoutPredicate(long t = 1000): _timeout(t) {}

                /** destructor */
                virtual ~TimeoutPredicate() OVERRIDE {}

                /** getter */
                long timeout() { return _timeout; }

                /** setter */
                void setTimeout(long t=1000) { _timeout = t; }

                /** return true if state timeout has been reached */
                virtual int evaluate(Machine *m = NULLPTR) OVERRIDE;

                /** print abstract expression */
                virtual std::string description() OVERRIDE;

                /** add a parameter (sets the time for the last parameter) */
                virtual void add_parameter(int index, long long value) OVERRIDE
                {
                        setTimeout(value);
                }

        };
}

#pragma clang diagnostic pop

#endif
