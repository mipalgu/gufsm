{
  using namespace std;
  using namespace CLReflect;

        static int count = 0;

  stateName = "Ping";
  currentState = 0;
  cout << stateName << " " << static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100)) << endl;
}
