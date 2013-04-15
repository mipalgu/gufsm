nao_state = nao_state_ptr.get();

fprintf(stderr, "%s\n", (char *)nao_state.description().c_str());
