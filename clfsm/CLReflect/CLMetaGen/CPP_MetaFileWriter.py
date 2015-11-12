from CodeGen import *
from CPP_MetaMachineDefinition import *
from CPP_MetaMethodWriter import *
from CPP_MetaCreateScriptWriter import *
from CPP_MetaTransitionWriter import *
from CPP_MetaPropertyWriter import *
from CLMetaGenWriter import *

class CPP_MetaFileWriter(CLMetaGenWriter):
    DO_NOT_MODIFY_static = "// Generated by CLMetaGen. Do not modify."
    REPLACE_WITH_MACHINE_NAMESPACE = '<REPLACE_WITH_MACHINE_NAMESPACE>'
    PRAGMAS = ["-Wunused-parameter"]
    INCLUDES = ['#include "CLReflectAPI.h"', '#include <sstream>', '#include <iostream>', '#include <cstdlib>', '#include <cstring>', '#include <stdint.h>']
    NAMESPACES = ["FSM", "CLM", REPLACE_WITH_MACHINE_NAMESPACE, "State"]


    def __init__(self, machineDef):
        super(CPP_MetaFileWriter, self).__init__(machineDef)
        self.includes = self.INCLUDES
        self.namespaces = self.NAMESPACES
        self._insertMachineNamespace()
        self.filename = self.machineDef.machinePath + '/' + self.machineDef.name + '_META.mm'

    def write(self):
        cpp = CppFile(self.filename)
        for pragma in self.PRAGMAS:
            with cpp.subs(pragma = pragma):
                cpp('#pragma clang diagnostic ignored "$pragma$"')
        cpp('')
        self.writeHeader(cpp)
        # write methods
        methodWriter = CPP_MetaMethodWriter(self.machineDef, cpp)
        methodWriter.write()
        # write transition evaluation functions
        transWriter = CPP_MetaTransitionWriter(self.machineDef, cpp)
        transWriter.write()
        # write property access functions
        propWriter = CPP_MetaPropertyWriter(self.machineDef, cpp)
        propWriter.write()
        # Write meta-FSM creation script
        createWriter = CPP_MetaCreateScriptWriter(self.machineDef, cpp)
        createWriter.write()
        cpp("#pragma clang diagnostic pop")

    def writeHeader(self, cpp):
        self.writeIncludes(cpp)
        cpp('')
        self.writeNamespaces(cpp)
        cpp('')
        with cpp.block('extern "C"'):
            cpp("refl_metaMachine Create_MetaMachine();")
        cpp('')

    def writeIncludes(self, cpp):
        self.includes += self.machineDef.includes
        for state in self.machineDef.states:
            self.includes += ['#include "State_' + state.name + '.h"'] + state.includes
        self.includes += ['#include "' + self.machineDef.name + '.h"']
        for inc in self.includes:
            cpp(inc)


    def writeNamespaces(self, cpp):
        for ns in self.namespaces:
            cpp('using namespace ' + ns + ';')

    def _insertMachineNamespace(self):
        replaceIndex = self.namespaces.index(CPP_MetaFileWriter.REPLACE_WITH_MACHINE_NAMESPACE)
        self.namespaces[replaceIndex] = 'FSM' + self.machineDef.name
