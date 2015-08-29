int currID = static_cast<int>(currentMachineID) - 1;
if (currID != machine_id())
{
	unloadMachine(currID);
	std::cout << "Unloaded machine " << currID << std::endl;
}
