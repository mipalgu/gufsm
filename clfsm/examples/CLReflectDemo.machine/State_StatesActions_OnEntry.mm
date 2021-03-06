std::cout << " ----- State Information ----- " << std::endl;// Get number of states
CLReflectResult result;
unsigned int numStates = refl_getNumberOfStates(metaMachine, &result);
assert(result == REFL_SUCCESS);
std::cout << "I have " << numStates << " states. " << std::endl;

//Enumerate states
refl_metaState const * states = refl_getMetaStates(metaMachine, NULL);

for (unsigned int i = 0; i < numStates; i++)
{
	std::cout << "State " << i << ": ";
	const char* buffer = refl_getMetaStateName(states[i], NULL);
	std::cout << buffer << std::endl;
}
std::cout << "   ------------------------- " << std::endl;
