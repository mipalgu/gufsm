head.GoToWithTime(0,0, 1000);

head_ptr.set(head);


std::string ss_filename = getenv("HOME");
ss_filename += "/data/OpenChallenge/SS_teamA.arff";
if(file_exists((char *)ss_filename.c_str()))
{
	remove( (char *)ss_filename.c_str() );
}

	

ss_filename = getenv("HOME");
ss_filename += "/data/OpenChallenge/SS_teamB.arff";
if(file_exists((char *)ss_filename.c_str()))
{
	remove( (char *)ss_filename.c_str() );
}
