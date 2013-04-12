int i = machineNo++;
machine = i < numberOfMachines ? name_of_machine_at_index(i) : "(null)";
cout << i << ": " << machine << endl;
