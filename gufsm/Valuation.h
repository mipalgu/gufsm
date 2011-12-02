/*
 *  Valuatioon.h
 *  
 *  Created by Vlad Estivill-castro om 1/12/11.
 *  Copyright (c) 2011 Vlad Estivill-Castro.
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


#include <string>
#include <utility>
#include <iostream>
#include <gu_util.h>
using namespace std;

/*
 *
 * This Class just has a variable and its value. Maybe can be eliminated by using the C++ reference map
 * 
*/
class Valuation: public std::pair<std::string, int>
{
	public :
        Valuation (std::string name, int value): std::pair<std::string, int>(name, value) {}

		const std::string &getName() { return first;}
		int getValue() { return  second;}

		void setName (const std::string &name)  { first = name;}
		void setValue(int value)  { second=value;}

		void debugPrint()  { 
                        DBG(std::cerr  << "(" << getName() << "," << getValue() <<")" );
		   }

};

/*
	A vector of valautions
*/
class KripkeContext {

	private :
		vector <Valuation*> thePairs;
		vector <Valuation*>::iterator InternalPairIterator;

	public :
		KripkeContext (Valuation* val1)
			{  thePairs.push_back(val1);}

		void addPair (Valuation* val1)
			{  thePairs.push_back(val1);}

		int evaluateName (std::string aVarName)
			{
			     vector<Valuation*>::iterator it;
			     for (it=thePairs.begin();  it!= thePairs.end(); it++)
				{
				    Valuation* current = (*it);
				    if ( 
                                     0==(current->getName()).compare(aVarName)
					)
					{ return current->getValue();
				          //std::cerr <<"Updating:"<< current->getName() << " to:" << val1->getName() << ":=" << val1->getValue () << std::endl;
                                        }
				}	
			     return 0;
			}

		void updatePair (Valuation* val1)
			{
			     vector<Valuation*>::iterator it;
			     for (it=thePairs.begin();  it!= thePairs.end(); it++)
				{
				    Valuation* current = (*it);
				    if ( 
                                     0==(current->getName()).compare(val1->getName())
					)
					{ current->setValue(val1->getValue ());
				          //std::cerr <<"Updating:"<< current->getName() << " to:" << val1->getName() << ":=" << val1->getValue () << std::endl;
                                        }
				}	
			}

		Valuation* theFirstPair(){
			   if ( 0 < thePairs.size())
	      			{ InternalPairIterator=thePairs.begin();
				  return (*InternalPairIterator);
	      			}
	    		  else
				return NULL;
		     }

		Valuation* theNextPair() { InternalPairIterator++;
	    			if (InternalPairIterator  != thePairs.end() ) 
				{
					return (*InternalPairIterator);
				}
	    			else
				return NULL;
		   }
		
		  //cloning a contex
		KripkeContext (KripkeContext* oldContex)
			{
			    Valuation* navigateValautuion = oldContex->theFirstPair();

			    if (NULL!= navigateValautuion)
				{
			             Valuation* clonedValaution = new Valuation (navigateValautuion -> getName(), navigateValautuion->getValue() );
			             thePairs.push_back(clonedValaution);

				      navigateValautuion = oldContex -> theNextPair();

				      while (NULL!= navigateValautuion)
			              {
			                 clonedValaution = new Valuation (navigateValautuion -> getName(), navigateValautuion->getValue() );
			                 thePairs.push_back(clonedValaution);
				         navigateValautuion = oldContex -> theNextPair();
				      }
				}
			     
			}
		void debugPrint()  { 
			    std::cerr << "** CONTEXT : ";
			    Valuation* navigateValautuion = theFirstPair();
			    if (NULL!= navigateValautuion)
				{ navigateValautuion->debugPrint();
				  navigateValautuion = theNextPair();
				  while (NULL!= navigateValautuion)
			              { navigateValautuion -> debugPrint();
				        navigateValautuion = theNextPair();
                                      }
			      
				}
			    std::cerr << " ";
                      }

};

