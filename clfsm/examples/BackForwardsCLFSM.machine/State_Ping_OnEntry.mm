{
  using namespace std;
  using namespace guWhiteboard;

  string strL = "B,50";
  string strR = "C,50";
  WBMsg msgL(strL);
  WBMsg msgR(strR);

  stateName = "Ping";
  currentState = 1;
  cout << string( stateName ) << endl;
  wb-> addMessage(kDifferentialMotorForward, msgL);
  wb-> addMessage(kDifferentialMotorForward, msgR);
}
