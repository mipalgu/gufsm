{
  using namespace std;

        static int count = 0;

  stateName = "Ping";
  currentState = 0;
  cout << stateName << " " << (int)fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
