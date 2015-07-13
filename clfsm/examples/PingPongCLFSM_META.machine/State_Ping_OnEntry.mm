{
  using namespace std;
  using namespace CLReflect;
        static int count = 0;

  //Get meta machine test
  shared_ptr<CLMetaState> currentStateptr = API::getCurrentStateDefinition("PingPongCLFSM_META");
  if (currentStateptr)
    cout << currentStateptr->getName() << " " <<  static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100))<< endl;

}
