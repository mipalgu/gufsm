CLReflectResult res;
char* buffer = refl_getMetaMachineName(metaMachine, &res);
assert(res == REFL_SUCCESS);
std::cout << "My name is: " << buffer << std::endl;
free(buffer);
