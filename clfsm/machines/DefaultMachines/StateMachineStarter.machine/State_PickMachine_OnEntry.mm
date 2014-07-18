std::string main_machine = string_from_file("/home/nao/data/state_starter.conf");
std::vector<std::string> ms = components_of_string_separated(main_machine);
int s = (int)ms.size() - 1;

if(machine_index < 0)
	machine_index = s;
if(machine_index > s)
	machine_index = 0;

main_machine = ms.at((unsigned)machine_index);

machine = main_machine;
name = main_machine;
if(machine.find(std::string(","), 0) != std::string::npos)
	machine.erase(machine.begin()+machine.find(std::string(","), 0), machine.end()); 
if(name.find(std::string(","), 0) != std::string::npos)
	name.erase(name.begin(), name.begin()+name.find(std::string(","), 0)+1); 
say(name.c_str());

nao_state = nao_state_ptr.get();
