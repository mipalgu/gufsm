{
  using namespace std;
        
        static int count = 0;
        
  stateName = "Pong";
  currentState = 1;
    cout << stateName << " " << static_cast<int>(fmod(static_cast<double>(current_time_in_microseconds() / 1000000.0L), 100)) << endl;
}
