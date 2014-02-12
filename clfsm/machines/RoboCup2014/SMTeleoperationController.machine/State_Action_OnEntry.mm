MOTION_Commands motion;
motion.DoAction(Motions::Standing_stance, remoteControl.action());
motionPtr->post(motion);
