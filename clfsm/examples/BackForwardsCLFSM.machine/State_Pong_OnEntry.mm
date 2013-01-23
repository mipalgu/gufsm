{
  using namespace std;
  using namespace guWhiteboard;

  string strL = "1,-50";
  string strR = "0,-50";
  WBMsg msgL(strL);
  WBMsg msgR(strR);

  stateName = "Pong";
  currentState = 2;
  cout << stateName << endl;
  wb-> addMessage(kDifferentialMotorPower,msgL);
  wb-> addMessage(kDifferentialMotorPower,msgR);
}
