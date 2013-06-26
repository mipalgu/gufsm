{
  using namespace std;

        static int count = 0;

  stateName = "Two";
  currentState = 1;
        cout << stateName << " " << fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
