playerNumber = wb_playerNumber.get();

suspend("SMSeeker");
suspend("SMBallFollower");
suspend("SMHeadBallTracker");
suspend("SMKicker");

using namespace std;

stringstream ss;
ss << "SMPlayer";
ss << playerNumber;
playerMachineName = ss.str();
playerMachine = index_of_machine_named(playerMachineName.c_str());

DBG(cout << machine_name() << ", player " << playerNumber << endl);
