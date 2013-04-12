int i = machineNo++;
const char *machine = name_of_machine_at_index(i);
cout << "Restarting " << i << ": " << machine << endl;
restart(machine);
