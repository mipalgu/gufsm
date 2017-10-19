HeadTrg.GoToWithTime(0,13,1000000);
HeadMsg.set(HeadTrg);
MOTION_Commands motion(true,false,true);
motion.GoToStance(Motions::Kneeling_stance, Motions::Standing_stance);
MotMsg.set(motion);
