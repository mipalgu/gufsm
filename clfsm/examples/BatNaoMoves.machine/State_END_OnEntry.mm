#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
say("The End");
nao_state = nao_state_ptr.get();
