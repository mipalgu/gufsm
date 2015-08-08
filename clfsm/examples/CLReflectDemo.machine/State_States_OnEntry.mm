std::cout << " ----- State Information ----- " << std::endl;// Get number of states
int numStates;
int result = refl_getNumberOfStates(metaMachine, &numStates);
assert(result == REFL_SUCCESS);
std::cout << "I have " << numStates << " states. " << std::endl;

//Enumerate states
refl_metaState const * states;
refl_getMetaStates(metaMachine, &states);
char buffer[30];
for (int i = 0; i < numStates; i++)
{
	std::cout << "State " << i << ": ";
	refl_getMetaStateName(states[i], buffer, 30);
	std::cout << buffer << std::endl;
}
std::cout << "   ------------------------- " << std::endl;
