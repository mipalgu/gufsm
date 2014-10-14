/*
 *  clfsm_machine_loader.h
 *  clfsm
 *  A class for the loading and unloading of state machines.
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
#pragma clang diagnostic ignored "-Wweak-vtables"
#pragma clang diagnostic ignored "-Wpadded"
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"


 #include <vector>
 #include <string>


namespace FSM
{
	class CLFSMWBVectorFactory;
	class MachineWrapper;
	class SuspensibleMachine;
	class CLMachine;



	/* Instance methods */
	class CLFSMMachineLoader
	{
	private:
		/// The vectory factory
		CLFSMWBVectorFactory *_vector_factory;

		/// The vector of machine wrappers
		std::vector<MachineWrapper *> _machineWrappers;

		/// The vector of machine paths
		std::vector<const std::string> _machinePaths;

        /// The vector of machine names - retained for CLMachine
        std::vector<const std::string> _machineNames;

		///Private constructor for the singleton
		CLFSMMachineLoader();

		int findIndexForNewMachine(const std::string machinePath);


	public:
			static CLFSMMachineLoader* getMachineLoaderSingleton();

			~CLFSMMachineLoader();

            SuspensibleMachine *loadAndAddMachineAtPath(const std::string machine,                      std::vector<std::string> compiler_args = std::vector<std::string>(),
std::vector<std::string> linker_args = std::vector<std::string>());

			void unloadMachineAtIndex(int index);

            /// Vector factory getter
			CLFSMWBVectorFactory *vector_factory() const { return _vector_factory; }

			///Machine Wrapper getter
			std::vector<MachineWrapper *> machineWrappers() const { return _machineWrappers; }

	};

	/* Global methods */
	SuspensibleMachine *loadAndAddMachine(const std::string machine);


	SuspensibleMachine *loadAndAddMachineAtPath(const std::string machine,
			             std::vector<std::string> compiler_args = std::vector<std::string>(),
			             std::vector<std::string> linker_args = std::vector<std::string>());

    /// Unloads the machine at the given index
	void unloadMachineAtIndex(int index);
}

#pragma clang diagnostic pop
