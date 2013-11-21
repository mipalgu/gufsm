suspend("SMHeadScanner");
suspend("SMWalkScanner");
suspend("SMFindGoalOnSpot");

QSay_t say;
say("Seeker");
spinCount=0;

PlayerNumber_t player_ptr;
playerNumber = player_ptr.get();
