#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

head.GoToWithTime(-90, 0, time*2);
head_ptr.set(head);
