char buffer[30];
assert(refl_getMetaMachineName(metaMachine, buffer, 30) == REFL_SUCCESS);
assert(std::string(buffer).compare("CLReflectDemo") == 0);
std::cout << "My name is: " << buffer << std::endl;
