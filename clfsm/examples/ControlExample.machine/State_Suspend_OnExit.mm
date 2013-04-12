int i = machineNo++;
const char *machine = name_of_machine_at_index(i);
cout << "Suspending " << i << ": " << machine << endl;
suspend(machine);
