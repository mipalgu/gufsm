#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif
say("Sonar values");

MOTION_Commands motion;
motion.GoToStance(Motions::Kneeling_stance, Motions::Standing_stance);
motion_ptr.set(motion);
