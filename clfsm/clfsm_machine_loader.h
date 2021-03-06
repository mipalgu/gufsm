/*
 *  clfsm_machine_loader.h
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
#include <vector>
#include <string>
#include "TTCLFSMVectorFactory.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-macros"
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#undef __block
#define __block _xblock
#include <unistd.h> // useconds_t
#undef __block
#define __block __attribute__((__blocks__(byref)))
#pragma clang diagnostic pop

namespace FSM
{
	class CLFSMWBVectorFactory;
	class MachineWrapper;
	class CLMachine;



	/* Instance methods */
	class CLFSMMachineLoader
	{
	private:
		/// The vectory factory
		TTCLFSMVectorFactory *_vector_factory;

		/// The vector of machine wrappers
		std::vector<MachineWrapper *> _machineWrappers;

		/// The vector of machine paths
		std::vector<std::string> _machinePaths;

                /// The vector of machine names - retained for CLMachine
                std::vector<char *> _machineNames;

		///Private constructor for the singleton
		CLFSMMachineLoader();

                /// Finds an open spot for the machine type in the vector
                /// Returns CLERROR if no spot is available.
		int findIndexForNewMachine(const std::string machinePath);


	public:
        static useconds_t idle_timeout;     ///< idle timeout in microseconds
		static CLFSMMachineLoader* getMachineLoaderSingleton();

		~CLFSMMachineLoader();
        
        bool abandonMachineAtIndex(int index);
        
        /// Creates the machine's MachineContext and preloads the shared object.
        MachineWrapper *loadMachineAtPath(const std::string machine,
            std::vector<std::string> compiler_args = std::vector<std::string>(),
            std::vector<std::string> linker_args = std::vector<std::string>());
        
        int scheduleMachine(MachineWrapper *wrapper, bool initiallySuspended = false);
        
        bool unscheduleMachineAtIndex(int index);
        
        /// Loads the machine's shared object and inserts it into the
        /// execution queue. Returns -1 on error
        int loadAndAddMachineAtPath(const std::string machine,
            std::vector<std::string> compiler_args = std::vector<std::string>(),
            std::vector<std::string> linker_args = std::vector<std::string>(),
            bool initiallySuspended = false);

        /// Unloads the machine at the given index.
        /// Returns true if successful, otherwise false.
		bool unloadMachineAtIndex(int index);

        /// Vector factory getter
		TTCLFSMVectorFactory *vector_factory() const { return _vector_factory; }

		///Machine Wrapper getter
		std::vector<MachineWrapper *> machineWrappers() const { return _machineWrappers; }

	};

	/* Global FSM:: methods */

    /// Simplified method for CLMacros
    
    bool abandonMachineAtIndex(int index);
    
	/**
	 Load and add a machine

	 @param machine name of the machine to load and add
	 @param initiallySuspended `true` to suspend the machine immediately
	 @return index of the machine, -1 on error
	 */
	int loadAndAddMachine(const std::string machine, bool initiallySuspended = false);

    /// Calls the singleton instance method of the same name.
    int loadAndAddMachineAtPath(const std::string machine,
                                bool initiallySuspended = false,
        std::vector<std::string> compiler_args = std::vector<std::string>(),
        std::vector<std::string> linker_args = std::vector<std::string>());

    void *preloadMachine(const std::string machine);
    
    void *preloadMachineAtPath(const std::string machine,
        std::vector<std::string> compiler_args = std::vector<std::string>(),
        std::vector<std::string> linker_args = std::vector<std::string>());
    
    int scheduleMachine(void * context, bool initiallySuspended = false);
    
    bool unscheduleMachineAtIndex(int index);
    
    /// Unloads the machine at the given index. Returns true if successful.
	bool unloadMachineAtIndex(int index);
}
