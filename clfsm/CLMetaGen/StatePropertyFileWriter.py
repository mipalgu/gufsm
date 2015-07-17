from MetaMachineDefinition import *
from MachinePropertyFileWriter import *
from CodeGen import *
import re

class StatePropertyFileWriter:
    includes_static = ['#include <memory>', '#include <string>', '#include <sstream>',
                        '#include "CLMetaProperty.h"', '#include "CLBoundProperty.h"']


    """docstring for StatePropertyFileWriter"""
    def __init__(self, metaMachine):
        self.metaMachineDef = metaMachine

    def writeState(self, state):
        """Write the properties of the given state"""
        cpp = CppFile(self.metaMachineDef.machinePath + '/State_' +
                        state.name + "_Properties.h")
        ifndefHeader = ('STATE_' + state.name + "_PROPERTIES").upper()
        cpp('#ifndef ' + ifndefHeader)
        cpp('#define ' + ifndefHeader)
        cpp('\n// Created with CLMetaGen. Do not modify.\n')
        # Includes
        includeExtras = ['#include "' + self.metaMachineDef.name + '.h"',
                            '#include "State_' + state.name + '.h"' ]
        includeSet = set(includeExtras + self.includes_static + state.includes)
        for inc in list(includeSet):
            cpp(inc)
        cpp('')
        with cpp.block("namespace FSM"):
            with cpp.block('namespace ' + self.metaMachineDef.name + '_namespace'):
                for prop in state.properties:
                    cpp('// Bound Property: ' + prop.name)
                    self.writeBoundProperty(state, prop, cpp)
                    cpp('// Meta Property: ' + prop.name)
                    self.writeMetaProperty(state, prop, cpp)
        cpp('\n#endif')

    def writeMetaProperty(self, state, prop, cpp):
        propWriter = MachinePropertyFileWriter(self.metaMachineDef)
        propWriter.writeMetaProperty(cpp, prop, state)

    def writeBoundProperty(self, state, prop, cpp):
        propWriter = MachinePropertyFileWriter(self.metaMachineDef)
        propWriter.writeBoundProperty(cpp, prop, state)
