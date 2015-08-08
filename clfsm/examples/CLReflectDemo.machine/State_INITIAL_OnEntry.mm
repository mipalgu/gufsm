unsigned int id = static_cast<unsigned int>(_m->machineID()); //Get the id of this machine
assert(refl_getMetaMachine(id, &metaMachine) == REFL_SUCCESS); //Use it to get the meta-machine
