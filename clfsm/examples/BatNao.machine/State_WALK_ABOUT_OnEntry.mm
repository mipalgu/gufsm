#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
say("Bat Man");
nao_state = nao_state_ptr.get();

walk_post(WALK_Ready); protected_msleep(15);
walk_post(WALK_ControlStatus(WALK_Run, 35, 0, 0, 50));
