#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
say("Game Over");
suspend("SMButtonChest");

walk_post(WALK_ControlStatus(WALK_Disconnect));
protected_usleep(30000);

MOTION_Commands motion;
motion.GoToStance(Motions::Standing_stance, Motions::Kneeling_stance);
motion_ptr.set(motion);

protected_usleep(2000000);

MOTION_Commands motion2(false, false, true);
motion_ptr.set(motion2);
