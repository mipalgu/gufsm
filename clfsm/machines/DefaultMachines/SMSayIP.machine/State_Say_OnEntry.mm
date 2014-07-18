stringstream ss;
PlayerNumber_t myPlayerNumber;

ss << "Player " << int(myPlayerNumber()) << " ";
ss << "`hostname` at `/sbin/ifconfig -a | grep 'inet addr' | grep -v 127.0.0.1 | cut -d: -f2 | cut -d' ' -f1`";

system(("say " + ss.str()).c_str());
system(("echo \"" + ss.str() + "\"").c_str());
