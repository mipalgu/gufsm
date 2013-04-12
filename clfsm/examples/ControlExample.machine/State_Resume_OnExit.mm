int i = machineNo++;
if (i < numberOfMachines)
{
	const char *machine = name_of_machine_at_index(i);
	cout << "Resuming " << i << ": " << machine << endl;
	resume(machine);
}
else cerr << i << " out of bounds (resume): " << numberOfMachines << endl;
