#ifdef DEBUG
fprintf(stderr, "Suspend SMHeadScanner: %s\n", state_name());
#endif

head.Stop();
head_ptr.set(head);
