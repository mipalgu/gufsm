std::cout << "Invoking OnEntry: ";
refl_invokeOnEntry(metaMachine, 1, NULL);

std::cout << "Invoking Internal: ";
refl_invokeInternal(metaMachine, 1, NULL);

std::cout << "Invoking OnExit: ";
refl_invokeOnExit(metaMachine, 1, NULL);
std::cout << std::endl;
