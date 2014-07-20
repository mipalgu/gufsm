std::string main_machine = string_from_file("/home/nao/data/state_starter.conf");
std::vector<std::string> ms = components_of_string_separated(main_machine);
int s = static_cast<int>(ms.size()) - 1;

if(machine_index < 0)
	machine_index = s;
if(machine_index > s)
	machine_index = 0;

main_machine = ms.at(static_cast<unsigned>(machine_index));

machine = main_machine;
mname = main_machine;
if(machine.find(std::string(","), 0) != std::string::npos)
	machine.erase(machine.begin()+static_cast<long>(machine.find(std::string(","), 0)), machine.end()); 
if(mname.find(std::string(","), 0) != std::string::npos)
	mname.erase(mname.begin(), mname.begin()+static_cast<long>(mname.find(std::string(","), 0)+1)); 
say(mname.c_str());

nao_state = nao_state_ptr.get();
