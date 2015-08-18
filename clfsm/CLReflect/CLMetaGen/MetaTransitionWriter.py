from CodeGen import *
from MetaMachineDefinition import *

class MetaTransitionWriter:
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
                with cpp.subs(sName = state.name, transIndex = transition.index):
                    with cpp.block("refl_bool $sName$_Transition_$transIndex$(refl_machine_t machine, refl_userData_t data)"):
                        cpp('return refl_TRUE;')
                    cpp('')
