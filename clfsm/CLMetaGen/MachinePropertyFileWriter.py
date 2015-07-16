from MetaMachineDefinition import *
from CodeGen import *

class MachinePropertyFileWriter:

    includes_static = ['#include <memory>', '#include <string>',
                        '#include "CLMetaProperty.h"', '#include "CLBoundProperty.h"']
    primTypes_static = ['unsigned int', 'int', 'float', 'double', 'long' 'long long',
                        'unsigned long', 'unsigned long long', 'long double']

    def __init__(self, metaMachineDef):
        self.metaMachineDef = metaMachineDef
        self.includes = metaMachineDef.includes + MachinePropertyFileWriter.includes_static

    def write(self):
        cpp = CppFile(self.metaMachineDef.name + "_Properties.h")
        ifndefHeader = (self.metaMachineDef.name + "_PROPERTIES").upper()
        cpp('#ifndef ' + ifndefHeader)
        cpp('#define ' + ifndefHeader)
        cpp('\n// Created with CLMetaGen. Do not modify.\n')

        # Includes
        for inc in self.includes:
            cpp(inc)
        cpp('')
        with cpp.block("namespace FSM"):
            with cpp.block('namespace ' + self.metaMachineDef.name + '_namespace'):
                for prop in self.metaMachineDef.properties:
                    self.writeProperty(cpp, prop)

        cpp('\n#endif')
        cpp.close()

    def writeProperty(self, cpp, prop):
        self.writeBoundProperty(cpp, prop)
        self.writeMetaProperty(cpp, prop)

    def writeMetaProperty(self, cpp, prop):
        pass

    def writeBoundProperty(self, cpp, prop):
        with cpp.subs(propClass = 'Bound_Machine_' + prop.name):
            with cpp.block('$propClass$ : public CLReflect::CLBoundProperty', ';'):
                cpp.label('private')
                with cpp.subs(machName = self.metaMachineDef.name, propName = prop.name):
                    cpp('CLM::$machName$* _machine;\n')
                    cpp.label("public")
                    cpp('$propClass$(CLM::$machName$* machine) : _machine(machine) {}\n')

                    # getValue()
                    with cpp.block('std::string getValue()'):
                        #Check for primitive type
                        if prop.dataType in MachinePropertyFileWriter.primTypes_static:
                            cpp("return std::to_string(_machine->$propName$);")
                        elif prop.dataType == 'char': # Check for char type
                            cpp("return std::string(1, _machine->$propName$);")
                        elif prop.dataType == 'const char *':
                            cpp("return std::string(_machine->$propName$);")
                        elif prop.dataType in ['string', 'std::string']:
                            cpp("return _machine->$propName$;")
                        else:
                            cpp('#ifndef')
                            cpp("return std::string();")
