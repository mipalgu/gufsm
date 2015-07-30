from MetaMachineDefinition import *
from CodeGen import *
import re

class MachinePropertyFileWriter:

    includes_static = ['#include <memory>', '#include <string>', '#include <sstream>',
                        '#include "CLMetaProperty.h"', '#include "CLBoundProperty.h"']
    primTypes_static = ['unsigned int', 'int', 'float', 'double', 'long' 'long long',
                        'unsigned long', 'unsigned long long', 'long double']

    def __init__(self, metaMachineDef):
        self.metaMachineDef = metaMachineDef
        self.includes = metaMachineDef.includes + MachinePropertyFileWriter.includes_static
        self.includes.append('#include "' + self.metaMachineDef.name + '.h"')

    def write(self):
        cpp = CppFile(self.metaMachineDef.machinePath + '/' + self.metaMachineDef.name + "_Properties.h")
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
        cpp('// Bound property: ' + prop.name)
        self.writeBoundProperty(cpp, prop)
        cpp('// Meta property: ' + prop.name)
        self.writeMetaProperty(cpp, prop)

    def writeMetaProperty(self, cpp, prop, state = None):
        if state:
            propClass = "Meta_" + state.name + "_" + prop.name
        else:
            propClass = "Meta_Machine_" + prop.name
        with cpp.subs(propClass = propClass):
            with cpp.block('class $propClass$ : public CLReflect::CLMetaProperty', ';'):
                cpp.label('public')
                with cpp.subs(machName = self.metaMachineDef.name, propName = prop.name, dType = prop.dataType):
                    cpp('$propClass$() : CLMetaProperty("$propName$", "$dType$") {}\n')
                    with cpp.block('std::shared_ptr<CLReflect::CLBoundProperty> bind(FSM::CLMachine* machineInstance)'):
                        cpp('CLM::$machName$* castedMachine = dynamic_cast<CLM::$machName$*>(machineInstance);')
                        if state:
                            bPropClass = 'Bound_' + state.name + '_' + prop.name
                        else:
                            bPropClass = 'Bound_Machine_' + prop.name
                        with cpp.subs(bPropClass = bPropClass):
                            with cpp.block('if (castedMachine)'):
                                cpp('return std::shared_ptr<CLReflect::CLBoundProperty>(new $bPropClass$(castedMachine));')
                            with cpp.block('else'):
                                cpp('return std::shared_ptr<CLReflect::CLBoundProperty>(NULL);')

    def writeBoundProperty(self, cpp, prop, state = None):
        if state:
            propClass = "Bound_" + state.name + "_" + prop.name
        else:
            propClass = "Bound_Machine_" + prop.name
        with cpp.subs(propClass = propClass):
            with cpp.block('class $propClass$ : public CLReflect::CLBoundProperty', ';'):
                cpp.label('private')
                with cpp.subs(machName = self.metaMachineDef.name, propName = prop.name):
                    cpp('CLM::$machName$* _machine;\n')
                    cpp.label("public")
                    cpp('$propClass$(CLM::$machName$* machine) : _machine(machine) {}\n')

                    # getValue()
                    if state:
                        # (((FSM::CLM::FSMPingPongCLFSM_META::State::Ping*) _machine->state(0))->property)
                        # Casting state to correct type to allow property access
                        varPath = "((FSM::CLM::FSM" + self.metaMachineDef.name + "::State::" + state.name + "*) _machine->state(" + str(state.index) + "))->" + prop.name
                    else:
                        varPath = '_machine->' + prop.name
                    with cpp.subs(varPath = varPath):
                        with cpp.block('std::string getValue()'):
                            #Check for primitive type
                            if prop.dataType in MachinePropertyFileWriter.primTypes_static:
                                cpp("return std::to_string($varPath$);")
                            elif prop.dataType == 'char': # Check for char type
                                cpp("return std::string(1, $varPath$);")
                            elif 'char *' in prop.dataType:
                                cpp("return std::string($varPath$);")
                            elif prop.dataType in ['string', 'std::string']:
                                cpp("return $varPath$;")
                            else:
                                # Check if description method may be available
                                dataType = re.sub('const|[*+& ]', '', prop.dataType)
                                cpp('#ifdef ' + dataType + '_DEFINED')
                                cpp('return $varPath$.desciption()')
                                cpp('#else')
                                cpp("return std::string();")
                                cpp("#endif")
                        # setValue()
                        with cpp.block('void setValue(std::string value)'):
                            if prop.dataType in MachinePropertyFileWriter.primTypes_static:
                                cpp(prop.dataType + ' newValue; std::istringstream(value) >> newValue;')
                                cpp('$varPath$ = newValue;')
                            elif 'char *' in prop.dataType:
                                cpp('$varPath$ = value.c_str();')
                            elif prop.dataType == 'char':
                                cpp('$varPath$ = value[0];')
                            elif prop.dataType in ['string', 'std::string']:
                                cpp("$varPath$ = value;")
                            else:
                                dataType = re.sub('const|[*+& ]', '', prop.dataType)
                                cpp('#ifdef ' + dataType + '_DEFINED')
                                cpp('$varPath$.from_string(value)')
                                cpp('#else')
                                cpp('std::cerr << "Value: " << value << " not set. No conversion available." << std::endl;')
                                cpp('#endif')
