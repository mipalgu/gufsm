main_machine = string_from_file("/home/nao/data/state_starter.conf");
main_machine = components_of_string_separated(main_machine).at(0);

std::string nice_output = main_machine;
nice_output.erase(nice_output.begin(), nice_output.begin()+2); //just gets rid of the SM prefix, this makes speech output sound better

say(std::string("Starting ").append(nice_output).c_str());

restart(main_machine.c_str());
nao_state = nao_state_ptr.get();
