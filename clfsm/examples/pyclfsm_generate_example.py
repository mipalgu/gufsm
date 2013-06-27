import errno
import os

from pyclfsm import State, StateMachine, StateVariable, StateMachineVariable, Visitor

def main(output):
    state_machine_variables = [StateMachineVariable('int', 'currentState', 'state no')]

    state_machine_includes = '''#include <iostream>
#include <cmath>
#include "CLMacros.h"
'''

    ping_includes = '''#include <cstdlib>
#include <Whiteboard.h>
#include <WhiteboardConstants.h>
#include <unistd.h>
'''

    ping_internal = '''{
  using namespace std;
/*
  cerr << "Internal state executed for " << stateName << endl;
  exit(EXIT_FAILURE);
 */
}
'''

    ping_on_entry = '''{
  using namespace std;

        static int count = 0;

  stateName = "Ping";
  currentState = 0;
  cout << stateName << " " << (int)fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
'''

    ping_variables = [StateVariable('const char *', 'stateName', 'name of the current state')]

    pong_includes = '''#include <cstdlib>
#include <unistd.h>
'''

    pong_internal = '''{
  using namespace std;
/*
  cerr << "Internal state executed for " << stateName << endl;
  exit(EXIT_FAILURE);
 */
}
'''

    pong_on_entry = '''{
  using namespace std;

        static int count = 0;

  stateName = "Pong";
  currentState = 1;
        cout << stateName << " " << fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
'''

    pong_variables = [StateVariable('const char *', 'stateName', 'name of the current state')]

    ping_expression = 'after(1)'

    pong_expression = 'after_ms(500)'

    sm = StateMachine('PingPongCLFSM', includes=state_machine_includes, variables=state_machine_variables)
    ping = State('Ping', includes=ping_includes, variables=ping_variables, internal=ping_internal, on_entry=ping_on_entry)
    pong = State('Pong', includes=pong_includes, variables=pong_variables, internal=pong_internal, on_entry=pong_on_entry)
    sm.set_initial_state(ping)
    ping.transition_to(pong, expression=ping_expression)
    pong.transition_to(ping, expression=pong_expression)
    visitor = Visitor(sm)
    visitor.generate(output)

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2:
        print "Usage: %s OUTPUT_DIRECTORY" % sys.argv[0]
        sys.exit(1)
    output = sys.argv[1]
    main(output)
