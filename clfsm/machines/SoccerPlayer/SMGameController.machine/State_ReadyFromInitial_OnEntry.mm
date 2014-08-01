MOTION_Commands motion;
motion.GoToStance(Motions::Kneeling_stance, Motions::Standing_stance);
motion_ptr.set(motion);


resetParticleFilter(PF_New_Game);
readyFromInitial=true;
