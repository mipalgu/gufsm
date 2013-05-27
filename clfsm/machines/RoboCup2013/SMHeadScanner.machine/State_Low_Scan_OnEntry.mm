#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

head.GoToWithTime(-53, 10, transition_time);
head_ptr.set(head);
