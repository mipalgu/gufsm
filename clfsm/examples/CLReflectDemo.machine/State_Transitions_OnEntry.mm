std::cout << " ---------- Transitions ---------------" << std::endl;
unsigned int numStates = refl_getNumberOfStates(metaMachine, NULL);
refl_metaState const * states = refl_getMetaStates(metaMachine, NULL);
for (unsigned int i = 0; i < numStates; i++)
{
	unsigned int numTransitions = refl_getNumberOfTransitions(states[i], NULL);
	char *stateName = refl_getMetaStateName(states[i], NULL);
	std::cout << stateName << " has " << numTransitions << " transition(s)." << std::endl;
	free(stateName);
	refl_metaTransition const * transitions = refl_getMetaTransitions(states[i], NULL);
	for (unsigned int t = 0; t < numTransitions; t++)
	{
		char * expression = refl_getMetaTransitionExpression(transitions[t], NULL);
		std::cout << "Transition " << t << ": " << expression << std::endl;
		free(expression);
	}
		
}
std::cout << " -------------------------------------" << std::endl;
