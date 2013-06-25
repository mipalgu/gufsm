import errno
import os


class Node(object):
    pass


def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


class Visitor(object):

    def __init__(self, output):
        self.output = os.path.abspath(output)
        mkdir_p(self.output)

    def visit(self, node, *args, **kwargs):
        meth = None
        for cls in node.__class__.__mro__:
            meth_name = 'visit_' + cls.__name__
            meth = getattr(self, meth_name, None)
            if meth:
                break

        if not meth:
            meth = self.generic_visit
        return meth(node, *args, **kwargs)

    def generic_visit(self, node, *args, **kwargs):
        print 'generic_visit ' + node.__class__.__name__

    def visit_State(self, node, visited_states=None):
        if node not in visited_states:
            visited_states.append(node)
            print 'visit_State ' + node.__class__.__name__
            for transition in node.transitions:
                self.visit(transition, visited_states)

    def visit_StateMachine(self, node, visited_states=None):
        print 'visit_StateMachine ' + node.__class__.__name__
        if visited_states is None:
            visited_states = []
        self.visit(node.initial_state, visited_states)
        with open(os.path.join(self.output, 'States'), 'w') as f:
            data = "\n".join([state.name for state in visited_states])
            f.write(data)

        with open(os.path.join(self.output, node.name + '.h'), 'w') as f:
            data = node.TEMPLATE_HEADER % {'state_machine': node.name,
                'num_states': len(visited_states)}
            f.write(data)

        with open(os.path.join(self.output, node.name + '_Includes.h'),
            'w') as f:
            data = node.includes
            f.write(data)

        with open(os.path.join(self.output, node.name + '.mm'), 'w') as f:
            create_states = ''
            include_states = ''
            delete_states = ''
            for i, state in enumerate(visited_states):
                include_states += '#include "State_%s.h"\n' % state.name
                create_states += '        _states[%(i)d] = '
                create_states += 'new FSM%(state_machine)s::State'
                create_states += '::%(state_name)s;\n' % {
                    'i': i, 'state_machine': node.name,
                    'state_name': state.name}
                delete_states += '        _delete states[%d];\n' % i

            data = node.TEMPLATE_MM % {'state_machine': node.name,
                'include_states': include_states,
                'create_states': create_states,
                'delete_states': delete_states}
            f.write(data)

        with open(os.path.join(self.output, node.name + '_Variables.h'),
            'w') as f:
            variables_definitions = ''
            for variable in node.variables:
                variables_definitions += variable.generate_definition()
            data = node.TEMPLATE_VARIABLES % {
                'variables_definitions': variables_definitions,
                'state_machine': node.name}
            f.write(data)

        with open(os.path.join(self.output, node.name + '_VarRefs.mm'),
            'w') as f:
            variables_references = ''
            for variable in node.variables:
                variables_references += variable.generate_reference()
            data = node.TEMPLATE_VARREFS % {
                'variables_references': variables_references,
                'state_machine': node.name}
            f.write(data)

        for visited_state in visited_states:
            with open(os.path.join(self.output,
                'State_%s.h' % visited_state.name), 'w') as f:
                data = visited_state.TEMPLATE_HEADER % {
                    'name': visited_state.name, 'state_machine': node.name,
                    'num_states': len(visited_states)}
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_Includes.h' % visited_state.name), 'w') as f:
                data = visited_state.includes
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_Internal.mm' % visited_state.name), 'w') as f:
                data = visited_state.internal
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_OnEntry.mm' % visited_state.name), 'w') as f:
                data = visited_state.on_entry
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_OnExit.mm' % visited_state.name), 'w') as f:
                data = visited_state.on_exit
                f.write(data)

            create_transitions = ''
            transitions_code = ''

            for i, transition in enumerate(visited_state.transitions):
                with open(os.path.join(self.output,
                    'State_%s_Transition_%d.expr' % (visited_state.name, i)),
                        'w') as f:
                    data = transition.expression
                    f.write(data + '\n')
                create_transitions += '        _transitions['
                create_transitions += '%(transition_number)d] = new '
                create_transitions += 'Transition_%(transition_number)d();'
                create_transitions += '\n' % {'transition_number': i}
                transitions_code += visited_state.TEMPLATE_TRANSITION_CODE % {
                    'name': visited_state.name,
                    'transition_number': i, 'state_machine': node.name}

            with open(os.path.join(self.output,
                'State_%s.mm' % visited_state.name), 'w') as f:
                data = visited_state.TEMPLATE_MM % {
                    'name': visited_state.name, 'state_machine': node.name,
                    'create_transitions': create_transitions,
                    'transitions_code': transitions_code}
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_Variables.h' % visited_state.name), 'w') as f:
                variables_definitions = ''
                for variable in visited_state.variables:
                    variables_definitions += variable.generate_definition()
                data = visited_state.TEMPLATE_VARIABLES % {
                    'variables_definitions': variables_definitions,
                    'name': visited_state.name}
                f.write(data)

            with open(os.path.join(self.output,
                'State_%s_VarRefs.mm' % visited_state.name), 'w') as f:
                variables_references = ''
                for variable in visited_state.variables:
                    variables_references += variable.generate_reference()
                data = visited_state.TEMPLATE_VARREFS % {
                    'variables_references': variables_references,
                    'name': visited_state.name}
                f.write(data)

        with open(os.path.join(self.output, 'Layout.plist'), 'w') as f:
            states_dict = ''
            for i, visited_state in enumerate(visited_states):
                states_dict += node.TEMPLATE_STATES_DICT % {
                    'x': 90 + 60 * i, 'y': 60, 'name': visited_state.name}
            data = node.TEMPLATE_LAYOUT % {'states_dict': states_dict}
            f.write(data)

    def visit_Transition(self, node, visited_states=None):
        print 'visit_Transition ' + node.__class__.__name__
        self.visit(node.destination, visited_states)


class State(Node):
    TEMPLATE_VARIABLES = '''//
// State_%(name)s_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
%(variables_definitions)s
'''

    TEMPLATE_VARREFS = '''//
// State_%(name)s_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
%(name)s *_s = static_cast<%(name)s *>(_state);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

%(variables_references)s

#pragma clang diagnostic pop
'''

    TEMPLATE_HEADER = '''//
// State_%(name)s.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_%(state_machine)s_State_%(name)s_h
#define clfsm_%(state_machine)s_State_%(name)s_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSM%(state_machine)s
      {
        namespace State
        {
            class %(name)s: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    %(name)s(const char *name = "%(name)s");
                    virtual ~%(name)s();

                    virtual CLTransition * const *transitions() const {
                        return _transitions;
                    }

                    virtual int numberOfTransitions() const {
                        return %(num_states)d;
                    }

#                   include "State_%(name)s_Variables.h"
            };
        }
      }
    }
}

#endif
'''

    TEMPLATE_MM = '''//
// State_%(name)s.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "%(state_machine)s_Includes.h"
#include "%(state_machine)s.h"
#include "State_%(name)s.h"

#include "State_%(name)s_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM%(state_machine)s;
using namespace State;

%(name)s::%(name)s(const char *name): CLState(name, *new %(name)s::OnEntry,
    *new %(name)s::OnExit, *new %(name)s::Internal) {
%(create_transitions)s
}

%(name)s::~%(name)s()
{
    delete &onEntryAction();
    delete &onExitAction();
    delete &internalAction();

    delete _transitions[0];
}

void %(name)s::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "%(state_machine)s_VarRefs.mm"
#	include "State_%(name)s_VarRefs.mm"
#	include "State_%(name)s_OnEntry.mm"
}

void %(name)s::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "%(state_machine)s_VarRefs.mm"
#	include "State_%(name)s_VarRefs.mm"
#	include "State_%(name)s_OnExit.mm"
}

void %(name)s::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "%(state_machine)s_VarRefs.mm"
#	include "State_%(name)s_VarRefs.mm"
#	include "State_%(name)s_Internal.mm"
}

%(transitions_code)s
'''

    TEMPLATE_TRANSITION_CODE = '''
bool %(name)s::Transition_%(transition_number)d::check(CLMachine *_machine,
    CLState *_state) const {
#	include "%(state_machine)s_VarRefs.mm"
#	include "State_%(name)s_VarRefs.mm"

    return
    (
#		include "State_%(name)s_Transition_%(transition_number)d.expr"
    );
}
'''

    def __init__(self, name, includes='', variables=None, internal='{\n}\n',
        on_entry='{\n}\n', on_exit='{\n}\n'):
        self.transitions = []
        self.on_entry = ''
        self.on_exit = ''
        self.name = name
        self.includes = includes
        self.internal = internal
        self.on_entry = on_entry
        self.on_exit = on_exit
        if variables is None:
            variables = []
        self.variables = variables

    def transition_to(self, state, expression=''):
        transition = Transition(state, expression)
        self.transitions.append(transition)
        return transition

    def on_entry(self, data):
        self.on_entry = data

    def on_exit(self, data):
        self.on_exit = data


class Transition(Node):
    def __init__(self, destination, expression):
        self.destination = destination
        self.expression = expression


class StateMachine(Node):
    TEMPLATE_HEADER = '''//
// %(state_machine)s.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef __clfsm__%(state_machine)s__
#define __clfsm__%(state_machine)s__

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class %(state_machine)s: public CLMachine
        {
            CLState *_states[2];
        public:
            %(state_machine)s(int mid=0, const char *name="%(state_machine)s");
            virtual ~%(state_machine)s();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return %(num_states)d; }
#           include "%(state_machine)s_Variables.h"
        };
    }
}

extern "C"
{
    FSM::CLM::%(state_machine)s *CLM_Create_%(state_machine)s(int mid,
        const char *name);
}

#endif // defined(__gufsm__%(state_machine)s__)
'''

    TEMPLATE_MM = '''//
// %(state_machine)s.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "%(state_machine)s_Includes.h"
#include "%(state_machine)s.h"

%(include_states)s

using namespace FSM;
using namespace CLM;

extern "C"
{
        %(state_machine)s *CLM_Create_%(state_machine)s(int mid,
            const char *name)
        {
                return new %(state_machine)s(mid, name);
        }
}

%(state_machine)s::%(state_machine)s(int mid, const char *name): CLMachine(mid,
    name) {
%(create_states)s
        setInitialState(_states[0]);            // set initial state
}

%(state_machine)s::~%(state_machine)s()
{
%(delete_states)s
}
'''

    TEMPLATE_VARIABLES = '''//
// %(state_machine)s_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
%(variables_definitions)s
'''

    TEMPLATE_VARREFS = '''//
// %(state_machine)s_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
%(state_machine)s *_m = static_cast<%(state_machine)s *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

%(variables_references)s

#pragma clang diagnostic pop
'''

    TEMPLATE_STATES_DICT = '''
        <key>%(name)s</key>
        <dict>
            <key>Transitions</key>
            <array>
                <dict>
                </dict>
            </array>
            <key>bgColour</key>
            <dict>
                <key>alpha</key>
                <real>1</real>
                <key>blue</key>
                <real>1</real>
                <key>green</key>
                <real>1</real>
                <key>red</key>
                <real>1</real>
            </dict>
            <key>expanded</key>
            <false/>
            <key>h</key>
            <real>50</real>
            <key>strokeColour</key>
            <dict>
                <key>alpha</key>
                <real>1</real>
                <key>blue</key>
                <real>0.0</real>
                <key>green</key>
                <real>0.0</real>
                <key>red</key>
                <real>0.0</real>
            </dict>
            <key>w</key>
            <real>100</real>
            <key>x</key>
            <real>%(x)f</real>
            <key>y</key>
            <real>%(y)f</real>
        </dict>

'''

    TEMPLATE_LAYOUT = '''<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>States</key>
    <dict>
%(states_dict)s
    </dict>
    <key>Version</key>
    <string>1.1</string>
</dict>
</plist>
'''

    def __init__(self, name, includes='', variables=None):
        self.name = name
        self.initial_state = None
        self.states = []
        self.includes = includes
        if variables is None:
            variables = []
        self.variables = variables

    def set_initial_state(self, state):
        self.initial_state = state
        self.states.append(state)


class Variable(object):

    def __init__(self, type_, name, doc):
        self.type_ = type_
        self.name = name
        self.doc = doc

    def generate_definition(self):
        return '%(type_)s\t%(name)s;\t///< %(doc)s' % {
            'type_': self.type_, 'name': self.name, 'doc': self.doc}

    def generate_reference(self):
        return '%(type_)s\t&%(name)s = _m->%(name)s;\t///< %(doc)s' % {
            'type_': self.type_, 'name': self.name, 'doc': self.doc}
