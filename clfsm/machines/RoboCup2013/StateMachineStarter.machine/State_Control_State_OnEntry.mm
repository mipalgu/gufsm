say("Starter Control");


nao_state = nao_state_ptr.get();
#ifdef DEBUG
fprintf(stderr, "State Starter: %s\n", state_name());
printf("State Starter: %s\n", state_name());
#endif
