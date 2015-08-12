unsigned int id = static_cast<unsigned int>(_m->machineID()); //Get the id of this machine
CLReflectResult result;
metaMachine = refl_getMetaMachine(id, &result);
assert(result == REFL_SUCCESS); //Use it to get the meta-machine
