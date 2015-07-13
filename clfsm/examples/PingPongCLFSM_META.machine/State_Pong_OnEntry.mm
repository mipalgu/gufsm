{
  using namespace std;
  using namespace CLReflect;
  
  shared_ptr<CLMetaState> currentStateptr = API::getCurrentStateDefinition("PingPongCLFSM_META");
  if (currentStateptr)
    cout << currentStateptr->getName() << " " <<  static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100))<< endl;
}
