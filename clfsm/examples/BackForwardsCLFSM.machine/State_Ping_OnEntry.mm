{
  using namespace std;
  using namespace guWhiteboard;

  string strL = "1,50";
  string strR = "0,50";
  WBMsg msgL(strL);
  WBMsg msgR(strR);

  stateName = "Ping";
  currentState = 1;
  cout << string( stateName ) << endl;
  wb-> addMessage(kDifferentialMotorPower, msgL);
  wb-> addMessage(kDifferentialMotorPower, msgR);
}
