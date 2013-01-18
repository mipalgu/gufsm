{
  using namespace std;
  using namespace guWhiteboard;

  string strL = "B,50";
  string strR = "C,50";
  WBMsg msgL(strL);
  WBMsg msgR(strR);

  stateName = "Pong";
  currentState = 2;
  cout << stateName << endl;
  wb-> addMessage(kDifferentialMotorBackward,msgL);
  wb-> addMessage(kDifferentialMotorBackward,msgR);
}
