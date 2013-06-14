std::string ss_filename = getenv("HOME");
ss_filename += "/data/OpenChallenge/TS_goal.arff";
if(file_exists((char *)ss_filename.c_str()))
{
	remove( (char *)ss_filename.c_str() );
}

	
ss_filename = getenv("HOME");
ss_filename += "/data/OpenChallenge/SS_unknown.arff";
if(file_exists((char *)ss_filename.c_str()))
{
	remove( (char *)ss_filename.c_str() );
}
