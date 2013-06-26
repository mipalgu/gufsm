head.Stop();
head_ptr.set(head);

#ifdef DEBUG
fprintf(stderr, "Suspend %s: %s\n", machine_name(), state_name());
#endif
