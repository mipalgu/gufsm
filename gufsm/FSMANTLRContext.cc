/*
 *  FSMANTLRContext.cc
 *  
 *  Created by René Hexel on 8/12/11.
 *  Copyright (c) 2011, 2019 Rene Hexel.
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
#include <Whiteboard.h>

#pragma clang diagnostic ignored "-Wold-style-cast"

using namespace guWhiteboard;
using namespace FSM;
using namespace std;

std::string ANTLRContext::description()
{
        std::stringstream ss;
        ss << "Context with WB: " << (long) whiteboard() << std::endl;
        for (std::map<std::string, int>::iterator i = variables().begin();
             i != variables().end(); i++ )
        {
                const std::pair<std::string, int> &p = *i;
                ss << p.first << " -> " << p.second << std::endl;
        }
        return ss.str();
}


std::string ANTLRContext::allNames()
{
        std::stringstream ss;
        for (std::map<std::string, int>::iterator i = variables().begin();
             i != variables().end(); i++ )
        {
                const std::pair<std::string, int> &p = *i;
                ss << p.first << " ";
        }
        return ss.str();
}

int ANTLRContext::internal_variable_mid(const std::string &name) 
{
	// Minimum internal name is 'M0$$'.
	if (exists(name)) {
		if (name.length() >= 4) {
			const char * cstr = name.c_str();
			int mid = atoi(cstr + 1);
			if (mid >= 0)
				return mid;
		}
	}
	
	return -1;
}


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wswitch-enum"


static int wbIntValue(Whiteboard *wb, const string &name)
{
        WBMsg msg = wb->getMessage(name);

        switch (msg.getType())
        {
                case WBMsg::TypeInt:
                        return msg.getIntValue();

                case WBMsg::TypeFloat:
                        return int(msg.getFloatValue());

                case WBMsg::TypeBool:
                        return msg.getBoolValue();

                case WBMsg::TypeString:
                        return atoi(msg.getStringValue().c_str());

                default:
                        cerr << "FSM warning: whiteboard content for '" << name 
                             << "(" << (int) msg.getType() << ") is not an int"
                             << endl;
                        break;
        }
        return 0;
}

#pragma clang diagnostic pop


void ANTLRContext::take_snapshot()
{
        for (std::map<std::string, int>::iterator i = variables().begin();
             i != variables().end(); i++ )
        {
                const std::pair<std::string, int> &p = *i;
                if (name_is_external_variable(p.first))
                        set_variable(p.first, wbIntValue(whiteboard(), visible_variable_name_for_extern(p.first)));
        }
}

