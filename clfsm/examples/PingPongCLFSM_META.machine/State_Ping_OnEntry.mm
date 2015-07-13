{
  using namespace std;
  using namespace CLReflect;
        static int count = 0;

  stateName = "Ping";
  currentState = 0;
  cout << stateName << " " << static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100)) << endl;

  //Get meta machine test
  shared_ptr<CLReflect::CLMetaMachine> thisMetaMachine = CLReflect::API::getMetaMachineWithName("PingPongCLFSM_META");
  if (thisMetaMachine)
  {
      cout << "Metamachine name: " << thisMetaMachine->getName() << std::endl;
      vector<shared_ptr<CLMetaState> > states = thisMetaMachine->getStates();
      cout << "Number of States: " << states.size() << endl;
      for (vector<shared_ptr<CLMetaState> >::iterator it = states.begin();
            it != states.end(); it++)
        {
            cout << "State name: " << (*it)->getName() << endl;
        }
  }

}
