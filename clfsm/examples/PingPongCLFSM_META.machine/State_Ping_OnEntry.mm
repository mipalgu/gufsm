{
  using namespace std;
  using namespace CLReflect;
        static int count = 0;

    //Get meta machine test
    shared_ptr<CLMetaMachine> metaMachine = API::getMetaMachineWithName("PingPongCLFSM_META");

    shared_ptr<CLMetaState> currentStateptr = API::getCurrentStateDefinition("PingPongCLFSM_META");
    if (currentStateptr)
        cout << currentStateptr->getName() << " " <<  static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100))<< endl;

    shared_ptr<CLBoundProperty> prop = metaMachine->getState("Ping")->getProperty("stateName")->bind(_machine);
    prop->setValue("test");
    std::cout << prop->getValue() << std::endl;

}
