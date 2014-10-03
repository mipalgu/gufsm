int i = machineNo++;
if (i < numberOfMachines)
{
	const char *machine = name_of_machine_at_index(i);
	cout << "Suspending " << i << ": " << machine << endl;
	suspend(machine);
}
else cerr << i << " out of bounds (suspend): " << numberOfMachines << endl;
