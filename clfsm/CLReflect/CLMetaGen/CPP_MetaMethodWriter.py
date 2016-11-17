from CodeGen import *
from CPP_MetaMachineDefinition import *
from CLMetaGenConstants import *

class CPP_MetaMethodWriter:

    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        self.writeDeclarations()
        self.writeImplementations()

    def writeDeclarations(self):
        cpp = self.cpp
        cpp("// Action Declarations")
        cpp("void " + self.machineDef.name + "_destroy(refl_machine_t machine, refl_userData_t data);")
        cpp("void " + self.machineDef.name + "_executeCurrentState(refl_machine_t machine, refl_userData_t data);")
        for state in self.machineDef.states:
            for action in CLMetaGenConstants.ACTIONS:
                with cpp.subs(sName = state.name, action = action):
                    cpp("void $sName$_$action$(refl_machine_t machine, refl_userData_t data);")
        cpp('')

    def writeImplementations(self):
        cpp = self.cpp
        cpp("// Action Implementations")
        with cpp.block("void " + self.machineDef.name + "_destroy(refl_machine_t machine, refl_userData_t data)"):
            cpp(self.machineDef.name + "* thisMachine = static_cast<" + self.machineDef.name + "*>(machine);")
            cpp("delete thisMachine;")
        cpp('')
        with cpp.block("void " + self.machineDef.name + "_executeCurrentState(refl_machine_t machine, refl_userData_t data)"):
            cpp(self.machineDef.name + "* thisMachine = static_cast<" + self.machineDef.name + "*>(machine);")
            cpp("Machine* m = thisMachine->machineContext();")
            cpp("m->executeOnce();")
        cpp('')
        for state in self.machineDef.states:
            for action in CLMetaGenConstants.ACTIONS:
                with cpp.subs(mName = self.machineDef.name, sName = state.name, sNum = state.index, action = action):
                    with cpp.block("void $sName$_$action$(refl_machine_t machine, refl_userData_t data)"):
                        cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                        cpp("$sName$* thisState = static_cast<$sName$*>(thisMachine->states()[$sNum$]);")
                        cpp("thisState->perform$action$(thisMachine);")
