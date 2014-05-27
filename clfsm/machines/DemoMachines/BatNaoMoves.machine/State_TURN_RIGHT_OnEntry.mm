#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
nao_state = nao_state_ptr.get();

walk_post(WALK_Ready); protected_msleep(15);
walk_post(WALK_ControlStatus(WALK_Run, 0, 0, 1, 50));
