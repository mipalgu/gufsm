MOTION_Commands motion;
if(remoteControl.new_action())
	motion.DoAction(Motions::Standing_stance, remoteControl.action());
else if(remoteControl.new_stance())
	motion.GoToStance(Motions::Standing_stance, remoteControl.stance());
motionPtr->post(motion);
