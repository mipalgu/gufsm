// Suspend myself.
int myIndex = machine_index();
control_machine_at_index(myIndex, CLSuspend);

printf("Kick Finished!\n");
