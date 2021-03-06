/*
*  clfsm_machine_loader.cc
*  clfsm
*  An interface for the loading and unloading of state machines.
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
#pragma clang diagnostic ignored "-Wc++98-compat"

#include <iostream>
#include <sstream>
#include <string.h>
#include <memory>

#pragma clang diagnostic pop

#include "clfsm_machine_loader.h"
#include "clfsm_wb_vector_factory.h"
#include "clfsm_machine.h"
#include "CLMachine.h"

#ifdef WANT_FSM_REFLECTION
#include <CLReflect/CLReflectAPI.h>
#endif

using namespace FSM;


/// The loader singleton object
static CLFSMMachineLoader *loader_singleton;

useconds_t CLFSMMachineLoader::idle_timeout = 10000;     ///< idle timeout


/* ---- Global Access Methods ---- */


bool FSM::abandonMachineAtIndex(int index)
{
    if (!loader_singleton) return false;
    return loader_singleton->abandonMachineAtIndex(index);
}

/// Loads a machine into the vector given its name
int FSM::loadAndAddMachineAtPath(const std::string machine, bool initiallySuspended, std::vector<std::string> compiler_args, std::vector<std::string> linker_args)
{
    if (!loader_singleton)
        return -1;
    else
        return loader_singleton->loadAndAddMachineAtPath(machine, compiler_args, linker_args, initiallySuspended);
}

int FSM::loadAndAddMachine(const std::string machine, bool initiallySuspended)
{
    return loadAndAddMachineAtPath(machine, initiallySuspended);
}

void *FSM::preloadMachine(const std::string machine)
{
    return preloadMachineAtPath(machine);
}

void *FSM::preloadMachineAtPath(const std::string machine, std::vector<std::string> compiler_args, std::vector<std::string> linker_args)
{
    if (!loader_singleton)
        return NULLPTR;
    else
        return static_cast<void *>(loader_singleton->loadMachineAtPath(machine, compiler_args, linker_args));
}

int FSM::scheduleMachine(void * context, bool initiallySuspended)
{
    MachineWrapper * wrapper = static_cast<MachineWrapper *>(context);
    if (!wrapper || !loader_singleton)
        return -1;
    else
        return loader_singleton->scheduleMachine(wrapper, initiallySuspended);
}

bool FSM::unscheduleMachineAtIndex(int index)
{
    if (!loader_singleton) return false;
    return loader_singleton->unscheduleMachineAtIndex(index);
}

bool FSM::unloadMachineAtIndex(int index)
{
    if (!loader_singleton) return false;
    return loader_singleton->unloadMachineAtIndex(index);
}


/// Gets the loader singleton
CLFSMMachineLoader* CLFSMMachineLoader::getMachineLoaderSingleton()
{
    if (!loader_singleton) loader_singleton = new CLFSMMachineLoader();
    return loader_singleton;
}





/* ---- Instance methods ---- */

CLFSMMachineLoader::CLFSMMachineLoader()
{
    if (!loader_singleton) loader_singleton = this;
    _vector_factory = new TTCLFSMVectorFactory(false, NULLPTR, false, idle_timeout);
}

CLFSMMachineLoader::~CLFSMMachineLoader()
{
    //Delete all machine wrapper pointers
    for (std::vector<MachineWrapper *>::const_iterator it = _machineWrappers.begin(); it != _machineWrappers.end(); it++)
    if (*it) delete *it;

    delete _vector_factory;

}

bool CLFSMMachineLoader::abandonMachineAtIndex(int index)
{
    int numWrappers = int(_machineWrappers.size());
    if (index < 0 || index >= numWrappers) return false;
    CLMachine* clmachine = _vector_factory->machine_at_index(index);
    if (!clmachine) return false;
    Machine* machine = clmachine->machineContext();
    if (!machine) return false;
    SuspensibleMachine* suspensibleMachine = static_cast<SuspensibleMachine *>(machine);
    if (!suspensibleMachine) return false;
    suspensibleMachine->abandon();
    return true;
}


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

MachineWrapper *CLFSMMachineLoader::loadMachineAtPath(const std::string machine,
                                  std::vector<std::string> compiler_args,
                                  std::vector<std::string> linker_args)
{
    MachineWrapper *wrapper = new MachineWrapper(machine);
    wrapper->setCompilerArgs(compiler_args);
    wrapper->setLinkerArgs(linker_args);
    if (!wrapper->preload())
    {
        return NULLPTR;
    }
    return wrapper;
}

int CLFSMMachineLoader::scheduleMachine(MachineWrapper *wrapper, bool initiallySuspended)
{
    const std::string machine = wrapper->path();
    //Leave ids as unique - Not reusing based on index position
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
        }
        int index = findIndexForNewMachine(machine);
        
        //Create c string to retain for CLMachine
        char* c_name = new char[strlen(name.c_str()) + 1];
        
        if (index == CLError)
        {
            index = static_cast<int>(_machineWrappers.size());
            _machineWrappers.push_back(wrapper);
            _machinePaths.push_back(machine);
            _machineNames.push_back(c_name);
        }
        else
        {
            _machineWrappers[index] = wrapper;
            _machineNames[index] = c_name;
        }
        strcpy(c_name, name.c_str());
        clm->setMachineName(c_name);
        
#ifdef WANT_FSM_REFLECTION
        // Load and register meta machine
        refl_metaMachine meta = wrapper->instantiateMetaMachine(clm);
        if (meta)
        {
            refl_registerMetaMachine(meta, id, NULLPTR);
        }
#endif // WANT_FSM_REFLECTION
        
        SuspensibleMachine *fsm = _vector_factory->addMachine(clm, index);
        if (initiallySuspended) fsm->suspend();
        
        return index;
    }
    else std::cerr << "Could not add machine " << id << ": '" << machine << "'" << std::endl;
    
    return -1;
}

bool CLFSMMachineLoader::unscheduleMachineAtIndex(int index)
{
    int numWrappers = int(_machineWrappers.size());
    if (index >= 0 && index < numWrappers)
    {
        return _vector_factory->removeMachineAtIndex(index);
    }
    return false;
}

int CLFSMMachineLoader::loadAndAddMachineAtPath(const std::string machine,
                                        std::vector<std::string> compiler_args,
                                        std::vector<std::string> linker_args,
                                                bool initiallySuspended)
{
    MachineWrapper * wrapper;
    if (!(wrapper = this->loadMachineAtPath(machine, compiler_args, linker_args)))
    {
        return -1;
    }
    return this->scheduleMachine(wrapper, initiallySuspended);
}

bool CLFSMMachineLoader::unloadMachineAtIndex(int index)
{
    int numWrappers = int(_machineWrappers.size());
    if (index >= 0 && index < numWrappers)
    {
        bool success = _vector_factory->removeMachineAtIndex(index);
        if (success)
        {
            MachineWrapper* wrapper = _machineWrappers.at(index);
            delete wrapper;
            _machineWrappers[index] = NULLPTR;

            return true;
        }

    }
    return false;
}


int CLFSMMachineLoader::findIndexForNewMachine(const std::string machinePath)
{
    size_t i;
    for (i = 0; i < _machinePaths.size(); i++)
    {
        const std::string pathAtIndex = _machinePaths.at(i);
        if (machinePath.compare(pathAtIndex) == 0 &&
        _machineWrappers.at(i) == NULLPTR)
        {
            return i;
        }
    }
    return CLError;
}
