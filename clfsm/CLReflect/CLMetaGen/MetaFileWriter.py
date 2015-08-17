from CodeGen import *
from MetaMachineDefinition import *

class MetaFileWriter:
    DO_NOT_MODIFY_static = "// Generated by CLMetaGen. Do not modify."
    PRAGMAS = "-Wunused-parameter"
    INCLUDES = ["CLReflectAPI.h"]
    NAMESPACES = ["std", "FSM", "State"]


    def __init__(self, machineDef):
        self.machineDef = machineDef
        self.includes = self.INCLUDES
        self.namespaces = self.NAMESPACES
        self.filename = self.machineDef.machinePath + '/' + self.machineDef.name + '_META.mm'

    def write(self):
        cpp = CppFile(self.filename)
        for pragma in self.PRAGMAS:
            with cpp.subs(pragma = pragma):
                cpp('#pragma clang diagnostic ignored "$pragma$"')
        self.writeHeader(cpp)
        self.writeNamespaces(cpp)
        cpp("#pragma clang diagnostic pop")

    def writeHeader(self, cpp):
        self.includes += [self.machineDef.name + ".h"]
        for state in self.machineDef.states:
            self.includes += ["State_" + state.name + ".h"]

        pass

    def writeNamespaces(self, cpp):
        pass
