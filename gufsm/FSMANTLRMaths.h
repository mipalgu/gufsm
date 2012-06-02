/*
 *  FSMANTLRMaths.h
 *
 *  Created by René Hexel on 29/12/11.
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
#ifndef _FSMANTLRMaths_h
#define _FSMANTLRMaths_h
#endif

#ifndef COMPLEX_CONTENT_ACTION
#define COMPLEX_CONTENT_ACTION

#include <cstdlib>
#include <cmath>
#include <climits>
#include <vector>
#include "FSMAction.h"

#define FIXED_FACTOR    100

namespace FSM
{
        class Machine;

        /**
         * abstract Maths class
         */
        template <typename T> class ANTLRMaths: public ContentAction<T>
        {
        public:
                ANTLRMaths(): ContentAction<T>() {}
                ANTLRMaths(T cont): ContentAction<T>(cont) {}

                virtual const char *name(void) = 0;
                virtual int evaluate(Machine *m = NULL) = 0;
                virtual void performv(Machine *m, ActionStage, int, va_list)
                {
                        evaluate(m);
                }
        };

        /**
         * FSM ANTLR math class for functions with single arguments
         */
        class ANTLRMathsSingle: public ANTLRMaths<int>
        {
        public:
                /** default constructor */
                ANTLRMathsSingle(): ANTLRMaths<int>(0) {}

                /** setting any parameter sets the content */
                virtual void add_parameter(int index, long long value)
                {
                        setContent(static_cast<int>(value));
                }
        };

        /**
         * abs()
         */
        class ANTLRMathsAbs: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "abs"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        return abs(content());
                }
        };

        /**
         * sign()
         */
        class ANTLRMathsSign: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "sign"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        int v = content();
                        return v == 0 ? 0 : ( v < 0 ? -1 : 1);
                }
        };

        /**
         * random()
         */
        class ANTLRMathsRandom: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "random"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        return random();
                }
        };

        /**
         * srandom()
         */
        class ANTLRMathsSRandom: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "srandom"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        srand(content());
                        return random();
                }
        };

        /**
         * fixed point sin()
         */
        class ANTLRMathsSin: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "sin"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float angle = content() * M_PI / 180.0;
                        return sinf(angle) * FIXED_FACTOR;
                }
        };

        /**
         * fixed point cos()
         */
        class ANTLRMathsCos: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "cos"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float angle = content() * M_PI / 180.0;
                        return cosf(angle) * FIXED_FACTOR;
                }
        };
        
        /**
         * fixed point tan()
         */
        class ANTLRMathsTan: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "tan"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float angle = content() * M_PI / 180.0;
                        return tanf(angle) * FIXED_FACTOR;
                }
        };

        /**
         * fixed point cot()
         */
        class ANTLRMathsCot: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "cot"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float angle = content() * M_PI / 180.0;
                        return (1.0 / tanf(angle)) * FIXED_FACTOR;
                }
        };

        /**
         * fixed point atan()
         */
        class ANTLRMathsATan: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "atan"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return atanf(value) * 180.0 / M_PI;
                }
        };
        
        /**
         * fixed point asin()
         */
        class ANTLRMathsASin: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "asin"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return asinf(value) * 180.0 / M_PI;
                }
        };

        /**
         * fixed point acos()
         */
        class ANTLRMathsACos: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "acos"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return acosf(value) * 180.0 / M_PI;
                }
        };

        /**
         * fixed point log() (natural logarithm)
         */
        class ANTLRMathsLog: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "log"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return logf(value) * FIXED_FACTOR;
                }
        };

        /**
         * fixed point ld() (logarithmus dualis)
         */
        class ANTLRMathsLd: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "ld"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return log2f(value) * FIXED_FACTOR;
                }
        };

        /**
         * fixed point lg() (logarithmus decimalis)
         */
        class ANTLRMathsLg: public ANTLRMathsSingle
        {
        public:
                virtual const char *name(void) { return "lg"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        float value = (float) content() / (float) FIXED_FACTOR;
                        return log10f(value) * FIXED_FACTOR;
                }
        };

#pragma mark - printing fixed-point values
        class PrintFixedAction: public PrintIntAction
        {
                /** print the content of this action */
                virtual void performv(Machine *, ActionStage, int, va_list)
                {
                        double value = (double) content() / (double) FIXED_FACTOR;
                        std::cout << value << std::endl;
                }
        };
#pragma mark - functions with multiple parameters
        /**
         * FSM ANTLR math class for functions with any number of arguments
         */
        class ANTLRMathsVector: public ANTLRMaths<std::vector<int> >
        {
        public:
                /** default constructor */
                ANTLRMathsVector(): ANTLRMaths<std::vector<int> >() {}
                
                /** setting any parameter sets the content */
                virtual void add_parameter(int index, long long value)
                {
                        if (index >= _content.size())
                                _content.push_back(value);
                        else
                                _content[index] = value;
                }
        };

        /**
         * min()
         */
        class ANTLRMathsMin: public ANTLRMathsVector
        {
        public:
                virtual const char *name(void) { return "min"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        if (!content().size()) return 0;
                        std::vector<int>::const_iterator i = content().begin();
                        int result = *i;
                        while (++i != content().end())
                                if (*i < result) result = *i;
                        return result;
                }
        };

        /**
         * max()
         */
        class ANTLRMathsMax: public ANTLRMathsVector
        {
        public:
                virtual const char *name(void) { return "max"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        if (!content().size()) return 0;
                        std::vector<int>::const_iterator i = content().begin();
                        int result = *i;
                        while (++i != content().end())
                                if (*i > result) result = *i;
                        return result;
                }
        };

        static inline int vec_average(const std::vector<int> &v)
        {
                int n = v.size();
                if (!n) return 0;
                int sum = 0;
                for (std::vector<int>::const_iterator i = v.begin(); i != v.end(); i++)
                        sum += *i;
                return sum / n;
        }

        /**
         * avg()
         */
        class ANTLRMathsAvg: public ANTLRMathsVector
        {
        public:
                virtual const char *name(void) { return "avg"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        return vec_average(content());
                }
        };
        
        /**
         * fta() -- fault-tolerant average
         */
        class ANTLRMathsFTA: public ANTLRMathsVector
        {
        public:
                virtual const char *name(void) { return "fta"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        int n = content().size();
                        if (n < 3) return vec_average(content());
                        int sum = 0, mi = INT_MAX, ma = INT_MIN;
                        for (std::vector<int>::const_iterator i = content().begin(); i != content().end(); i++)
                        {
                                if (*i > ma) ma = *i;
                                if (*i < mi) mi = *i;
                                sum += *i;
                        }
                        return (sum - mi - ma) / (n-2);
                }
        };

        /**
         * gavg() -- geometric average (geometric mean)
         */
        class ANTLRMathsGAvg: public ANTLRMathsVector
        {
        public:
                virtual const char *name(void) { return "gavg"; }
                virtual int evaluate(Machine *m = NULL)
                {
                        if (!content().size()) return 0;
                        double total = 1.0;
                        for (std::vector<int>::const_iterator i = content().begin(); i != content().end(); i++)
                                total *= *i;
                        return pow(total, 1.0 / content().size());
                }
        };
}

#endif // _FSMANTLRMaths_h
