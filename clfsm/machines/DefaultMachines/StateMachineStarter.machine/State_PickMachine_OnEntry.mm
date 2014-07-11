main_machine = string_from_file("/home/nao/data/state_starter.conf");
std::vector<std::string> ms = components_of_string_separated(main_machine);
int s = (int)ms.size() - 1;

if(machine_index < 0)
	machine_index = s;
if(machine_index > s)
	machine_index = 0;

main_machine = ms.at((unsigned)machine_index);

std::string n = main_machine;

//just gets rid of the SM prefix, this makes speech output sound better
if(n.find(std::string("SM"), 0) != std::string::npos)
	n.erase(n.begin(), n.begin()+2); 

say(n.c_str());

nao_state = nao_state_ptr.get();
