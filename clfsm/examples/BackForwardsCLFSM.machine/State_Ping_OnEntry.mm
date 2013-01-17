{
  using namespace std;

  stateName = "Ping";
  currentState = 1;
  cout << stateName << endl;
  wb-> addMessage(kDifferentialMotorForward,WBMsg("B,50"));
  wb-> addMessage(kDifferentialMotorForward,WBMsg("C,50"));
}
