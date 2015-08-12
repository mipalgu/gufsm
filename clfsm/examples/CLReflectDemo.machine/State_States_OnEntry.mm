std::cout << " ----- State Information ----- " << std::endl;// Get number of states
int numStates;
int result = refl_getNumberOfStates(metaMachine, &numStates);
assert(result == REFL_SUCCESS);
std::cout << "I have " << numStates << " states. " << std::endl;

//Enumerate states
refl_metaState const * states = refl_getMetaStates(metaMachine, NULL);

for (int i = 0; i < numStates; i++)
{
	std::cout << "State " << i << ": ";
	char* buffer = refl_getMetaStateName(states[i], NULL);
	std::cout << buffer << std::endl;
	free(buffer);
}
std::cout << "   ------------------------- " << std::endl;
