fprintf(stderr, "Comenso\n");


head.GoToWithTime(0,PITCH_LIMIT_POS, 1000);
head_ptr.set(head);

motion.set_body_stiffness(false);
motion.set_body_stiffness_mask(true);
motion_ptr.set(motion);

fprintf(stderr, "first file\n");

std::string fs_filename = getenv("HOME");
fs_filename += "/data/OpenChallenge/FS_ball.arff";
fprintf(stderr, "State: %s\n", fs_filename.c_str());
if(file_exists((char *)fs_filename.c_str()))
{
fprintf(stderr, "State: %s\n", (file_exists((char *)fs_filename.c_str()))?"true":"false" );
	remove( (char *)fs_filename.c_str() );

	fprintf(stderr, "done\n");
}

fprintf(stderr, "second file\n");
	
fs_filename = getenv("HOME");
fs_filename += "/data/OpenChallenge/FS_fieldlines.arff";
fprintf(stderr, "State: %s\n", fs_filename.c_str());
if(file_exists((char *)fs_filename.c_str()))
{
fprintf(stderr, "State: %s\n", (file_exists((char *)fs_filename.c_str()))?"true":"false" );
	remove( (char *)fs_filename.c_str() );
	fprintf(stderr, "done\n");
}
