#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

head.GoToWithTime(-46, 21, transition_time);
head_ptr.set(head);
