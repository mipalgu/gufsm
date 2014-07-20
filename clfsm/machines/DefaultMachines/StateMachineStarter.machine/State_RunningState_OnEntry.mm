say(std::string("Starting ").append(mname).c_str());
restart(machine.c_str());
nao_state = nao_state_ptr.get();
