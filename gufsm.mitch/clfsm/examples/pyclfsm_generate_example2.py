import errno
import os

from pyclfsm import State, StateMachine, StateVariable, StateMachineVariable, Visitor

def main(output):
    state_machine_variables = [StateMachineVariable('int', 'currentState', 'state no')]

    state_machine_includes = '''#include <iostream>
#include <cmath>
#include "CLMacros.h"
'''

    one_includes = '''#include <cstdlib>
#include <Whiteboard.h>
#include <WhiteboardConstants.h>
'''

    one_internal = '''{
  using namespace std;
/*
  cerr << "Internal state executed for " << stateName << endl;
  exit(EXIT_FAILURE);
 */
}
'''

    one_on_entry = '''{
  using namespace std;

        static int count = 0;

  stateName = "One";
  currentState = 0;
  cout << stateName << " " << (int)fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
'''

    one_variables = [StateVariable('const char *', 'stateName', 'name of the current state')]

    one_expression_0 = 'after(1) && (rand() % 10 == 1)'
    one_expression_1 = 'after(1)'

    two_includes = '''#include <cstdlib>
'''

    two_internal = '''{
  using namespace std;
/*
  cerr << "Internal state executed for " << stateName << endl;
  exit(EXIT_FAILURE);
 */
}
'''

    two_on_entry = '''{
  using namespace std;

        static int count = 0;

  stateName = "Two";
  currentState = 1;
        cout << stateName << " " << fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
'''

    two_variables = [StateVariable('const char *', 'stateName', 'name of the current state')]

    two_expression = 'after_ms(500)'

    three_includes = '''#include <cstdlib>
'''

    three_internal = '''{
  using namespace std;
/*
  cerr << "Internal state executed for " << stateName << endl;
  exit(EXIT_FAILURE);
 */
}
'''

    three_on_entry = '''{
  using namespace std;

        static int count = 0;

  stateName = "Two";
  currentState = 1;
        cout << stateName << " " << fmod((double)current_time_in_microseconds() / 1000000.0L, 100) << endl;
}
'''

    three_variables = [StateVariable('const char *', 'stateName', 'name of the current state')]

    three_expression = 'after_ms(500)'

    sm = StateMachine('RandomDispatcher', includes=state_machine_includes, variables=state_machine_variables)
    one = State('One', includes=one_includes, variables=one_variables, internal=one_internal, on_entry=one_on_entry)
    two = State('Two', includes=two_includes, variables=two_variables, internal=two_internal, on_entry=two_on_entry)
    three = State('Three', includes=three_includes, variables=three_variables, internal=three_internal, on_entry=three_on_entry)
    sm.set_initial_state(one)
    one.transition_to(two, expression=one_expression_0)
    one.transition_to(three, expression=one_expression_1)

    two.transition_to(one, expression=two_expression)

    three.transition_to(one, expression=three_expression)

    visitor = Visitor(sm)
    visitor.generate(output)

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2:
        print "Usage: %s OUTPUT_DIRECTORY" % sys.argv[0]
        sys.exit(1)
    output = sys.argv[1]
    main(output)
