#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

head.GoToWithTime(53, 10, time*1.5);
head_ptr.set(head);
