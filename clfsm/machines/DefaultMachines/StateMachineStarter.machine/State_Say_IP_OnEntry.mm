stringstream ss;
PlayerNumber_t myPlayerNumber;

ss << "Player " << int(myPlayerNumber()) << ": ";

say << ss.str();


if(!file_exists(SPOKE_FILE)) 
{
	int const file = open(SPOKE_FILE, O_WRONLY | O_CREAT, S_IWRITE | S_IREAD);
	if(file != -1) 
		close(file);
}

system("say `hostname` at `/sbin/ifconfig -a | grep 'inet addr' | grep -v 127.0.0.1 | cut -d: -f2 | cut -d' ' -f1`");
spokeIP = true;
