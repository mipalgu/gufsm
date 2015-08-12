CLReflectResult res;
char* buffer = refl_getMetaMachineName(metaMachine, &res);
assert(res == REFL_SUCCESS);
assert(std::string(buffer).compare("CLReflectDemo") == 0);
std::cout << "My name is: " << buffer << std::endl;
free(buffer);
