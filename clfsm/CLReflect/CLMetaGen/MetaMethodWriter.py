from CodeGen import *
from MetaMachineDefinition import *

class MetaMethodWriter:
    ACTIONS = ['OnEntry', 'Internal', 'OnExit']

    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        self.writeDeclarations()
        self.writeImplementations()

    def writeDeclarations(self):
        cpp = self.cpp
        cpp("// Method Declarations")
        for state in self.machineDef.states:
            for action in self.ACTIONS:
                with cpp.subs(sName = state.name, action = action):
                    cpp("void $sName$_$action$(refl_machine_t machine, refl_userData_t data);")
        cpp('')

    def writeImplementations(self):
        cpp = self.cpp
        cpp("// Method Implementations")
        for state in self.machineDef.states:
            for action in self.ACTIONS:
                with cpp.subs(mName = self.machineDef.name, sName = state.name, sNum = state.index, action = action):
                    with cpp.block("void $sName$_$action$(refl_machine_t machine, refl_userData_t data)"):
                        cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                        cpp("$sName$* thisState = static_cast<$sName$*>(thisMachine->states()[$sNum$]);")
                        cpp("thisState->perform$action$(thisMachine);")
