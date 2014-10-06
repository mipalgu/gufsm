/*
 *  clfsm_machine_loader.cc
 *  clfsm
 *
 *  Created by Mitch Wenman on 28/09/14.
 *  Copyright (c) 2012 Mitch Wenman. All rights reserved.
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
 * PROCUREMENT OF SUBSTITTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
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

 #include <iostream>
 
 #include "clfsm_machine_loader.h"
 #include "clfsm_wb_vector_factory.h"
 #include "clfsm_machine.h"
 #include "CLMachine.h"

using namespace FSM;


	/// The loader singleton object
	static CLFSMMachineLoader *loader_singleton;



	/* ---- Global Access Methods ---- */

	/// Loads a machine into the vector given its name
	SuspensibleMachine *FSM::loadAndAddMachineAtPath(const std::string machine, 
													std::vector<std::string> compiler_args,
													std::vector<std::string> linker_args)
	{
		if (!loader_singleton) return NULL;
		else return loader_singleton->loadAndAddMachineAtPath(machine, compiler_args, linker_args);
	}

	SuspensibleMachine *FSM::loadAndAddMachine(const std::string machine)
	{
		return loadAndAddMachineAtPath(machine);
	}

	CLFSMMachineLoader::CLFSMMachineLoader()
	{
		if (!loader_singleton) loader_singleton = this;
		_vector_factory = new CLFSMWBVectorFactory();
	}

	/// Gets the loader singleton
	CLFSMMachineLoader* CLFSMMachineLoader::getMachineLoaderSingleton()
	{
		if (!loader_singleton) loader_singleton = new CLFSMMachineLoader();
		return loader_singleton;
	}

	/* ---- Instance methods ---- */

	
	static std::string bumpedName(std::string name)
	{
		size_t len = name.size();
		if (!len || !isdigit(name[len-1]))
		    return name + ".0";
		while (--len && isdigit(name[len-1]))
		       ;
		int i = atoi(name.c_str()+len);
		std::stringstream ss;
		ss << name.substr(0, len) << ++i;

		return ss.str();
	}

	SuspensibleMachine* CLFSMMachineLoader::loadAndAddMachineAtPath(const std::string machine, 
													std::vector<std::string> compiler_args,
													std::vector<std::string> linker_args)
	{
		//if (compiler_args.empty()) compiler_args = MachineWrapper::default_compiler_args();
		//if (linker_args.empty()) linker_args = MachineWrapper::default_linker_args();

		MachineWrapper *wrapper = new MachineWrapper(machine);
		wrapper->setCompilerArgs(compiler_args);
		wrapper->setLinkerArgs(linker_args);	

		//Use the next available space as the id for now
		int id = _vector_factory->number_of_machines();

		CLMachine *clm = wrapper->instantiate(id, machine.c_str());
		if (clm)
		{
			std::string name = wrapper->name();
			if (_vector_factory->index_of_machine_named(name.c_str()) != CLError)
		    {
		        while (_vector_factory->index_of_machine_named(name.c_str()) != CLError)
		            name = bumpedName(name);
		        wrapper->setName(name);
		        clm->setMachineName(name.c_str());
		    }
		    _machineWrappers.push_back(wrapper);

		    return _vector_factory->addMachine(clm);
		    
		}
		else std::cerr << "Could not add machine " << id << ": '" << machine << "'" << std::endl;

		return NULL;
	}

	/// Vector factory getter
	CLFSMWBVectorFactory *CLFSMMachineLoader::vector_factory()
	{
		return _vector_factory;
	}

	///Machine Wrapper getter
	std::vector<MachineWrapper *> CLFSMMachineLoader::machineWrappers()
	{
		return _machineWrappers;
	}


