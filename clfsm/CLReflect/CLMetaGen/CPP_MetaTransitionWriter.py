from CodeGen import *
from CPP_MetaMachineDefinition import *

class CPP_MetaTransitionWriter:
    """A class that generates meta-code for all state transitions"""
    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        cpp = self.cpp
        self.writeDeclarations()
        self.writeImplementations()


    def writeDeclarations(self):
        cpp = self.cpp
        cpp("\n// Transition Evaluation Declarations")
        for state in self.machineDef.states:
            for transition in state.transitions:
                with cpp.subs(sName = state.name, transIndex = transition.index):
                    cpp("refl_bool $sName$_Transition_$transIndex$(refl_machine_t machine, refl_userData_t data);")

    def writeImplementations(self):
        cpp = self.cpp
        cpp("\n// Transition Evaluation Implementations")
        for state in self.machineDef.states:
            for transition in state.transitions:
                with cpp.subs(mName = self.machineDef.name, sNum = state.index, sName = state.name, transIndex = transition.index):
                    with cpp.block("refl_bool $sName$_Transition_$transIndex$(refl_machine_t machine, refl_userData_t data)"):
                        cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                        cpp("$sName$* thisState = static_cast<$sName$*>(thisMachine->states()[$sNum$]);")
                        cpp("CLTransition* thisTrans = thisState->transition($transIndex$);")
                        with cpp.block('if (thisTrans->check(thisMachine, thisState))'):
                            cpp('return refl_TRUE;')
                        with cpp.block('else'):
                            cpp('return refl_FALSE;')
                    cpp('')
