say(std::string("Starting ").append(main_machine).c_str());
restart(main_machine.c_str());
nao_state = nao_state_ptr.get();
