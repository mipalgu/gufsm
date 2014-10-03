machineNo = 0;
const char *machine = name_of_machine_at_index(machineNo);
cout << "Restarting Myself (" << machineNo << "): " << machine << endl;
restart(machine);
