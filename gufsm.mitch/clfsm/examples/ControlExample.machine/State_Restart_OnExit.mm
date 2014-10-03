int i = machineNo++;
if (i < numberOfMachines)
{
	const char *machine = name_of_machine_at_index(i);
	cout << "Restarting " << i << ": " << machine << endl;
	restart(machine);
}
else cerr << i << " out of bounds: " << numberOfMachines << endl;
