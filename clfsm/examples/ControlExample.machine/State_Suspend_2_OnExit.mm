int i = machineNo++;
const char *machine = name_of_machine_at_index(i);
suspend(machine);
cout << "Suspending (again) " << i << ": " << machine << endl;
