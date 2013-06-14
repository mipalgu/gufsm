say("Second shot");

motion.set_head_stiffness(false);
motion.set_head_stiffness_mask(true);
motion_ptr.set(motion);

vision.set_openChallengeStep(3);
vision_ptr.set(vision);


if(control == 2)
{
	control = 4;
}
else
{
	control = 4;
}
