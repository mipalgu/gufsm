stringstream ss;
PlayerNumber_t myPlayerNumber;

ss << "Player " << int(myPlayerNumber()) << ": ";

say << ss.str();

system("say `hostname` at `/sbin/ifconfig -a | grep 'inet addr' | grep -v 127.0.0.1 | cut -d: -f2 | cut -d' ' -f1`");
