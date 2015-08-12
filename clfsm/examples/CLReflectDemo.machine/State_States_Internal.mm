std::cout << "Invoking OnEntry: ";
refl_invokeOnEntry(metaMachine, 3, NULL);

std::cout << "Invoking Internal: ";
refl_invokeInternal(metaMachine, 3, NULL);

std::cout << "Invoking OnExit: ";
refl_invokeOnExit(metaMachine, 3, NULL);
