head.GoToWithTime(0,PITCH_LIMIT_POS, 1000);

motion.set_body_stiffness(false);
motion.set_body_stiffness_mask(true);
motion_ptr.set(motion);

head_ptr.set(head);

std::string fs_filename = getenv("HOME");
fs_filename += "/data/OpenChallenge/FS_ball.arff";
if(file_exists((char *)fs_filename.c_str()))
{
	remove( (char *)fs_filename.c_str() );
}

	
fs_filename = getenv("HOME");
fs_filename += "/data/OpenChallenge/FS_fieldlines.arff";
if(file_exists((char *)fs_filename.c_str()))
{
	remove( (char *)fs_filename.c_str() );
}
