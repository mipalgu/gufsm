from CodeGen import *
from CPP_MetaMachineDefinition import *

class CPP_MetaFileWriter:
    DO_NOT_MODIFY_static = "// Generated by CLMetaGen. Do not modify."
    headerIncludes_static = ["CLMetaMachine.h"]
    impIncludes_static = ["CLMetaState.h"]
    impNamespaces_static = ["std", "FSM", "CLReflect"]

    def __init__(self, machineDef):
        self.machineDef = machineDef
        self.headerIncludes = CPP_MetaFileWriter.headerIncludes_static
        self.impIncludes = CPP_MetaFileWriter.impIncludes_static
        self.impIncludes += [self.machineDef.name + '_MetaMachine.h',
                                self.machineDef.name + '_Properties.h']
        for state in self.machineDef.states:
            self.impIncludes.append('State_' + state.name + '_Properties.h')


    def write(self):
        self.generateHeader()
        self.generateImplementation()

    def generateHeader(self):
        # Includes
        cpp = CppFile(self.machineDef.machinePath + '/' + self.machineDef.name + '_MetaMachine.h')
        cpp(CPP_MetaFileWriter.DO_NOT_MODIFY_static)
        for h in self.headerIncludes:
            with cpp.subs(includeFile = h):
                cpp('#include "$includeFile$"')

        # Rest of header
        with cpp.block("namespace FSM"):
            with cpp.block("namespace " + self.machineDef.name + "_namespace"):
                with cpp.block('extern "C"'):
                    cpp("CLReflect::CLMetaMachine* Create();")
        cpp.close()


    def generateImplementation(self):
        cpp = CppFile(self.machineDef.machinePath + '/' + self.machineDef.name + '_MetaMachine.cc')
        cpp(CPP_MetaFileWriter.DO_NOT_MODIFY_static)
        #includes
        for h in self.impIncludes:
            with cpp.subs(includeFile = h):
                cpp('#include "$includeFile$"')
        for n in CPP_MetaFileWriter.impNamespaces_static:
            with cpp.subs(ns = n):
                cpp("using namespace $ns$;")
        with cpp.subs(name = self.machineDef.name):
            cpp("using namespace $name$_namespace;")
        with cpp.block('extern "C"'):
            with cpp.block("CLMetaMachine* FSM::" + self.machineDef.name + "_namespace::Create()" ):
                with cpp.subs(name = self.machineDef.name):
                    cpp('CLMetaMachine* meta = new CLMetaMachine("$name$", "$name$");')
                cpp("")
                #Create machine properties and add to machine
                cpp("// Machine properties")
                for i, prop in enumerate(self.machineDef.properties):
                    with cpp.subs(i = str(i), propName = prop.name):
                        cpp('shared_ptr<Meta_Machine_$propName$> property_$i$(new Meta_Machine_$propName$());')
                        cpp('meta->addProperty(property_$i$);')
                cpp("")
                # Create state, properties and add to machine
                cpp("// State creation")
                for i, state in enumerate(self.machineDef.states):
                    with cpp.subs(i = str(i), stateName = state.name):
                        cpp("// State: $stateName$")
                        cpp('shared_ptr<CLMetaState> state_$i$(new CLMetaState("$stateName$"));')
                        for j, prop in enumerate(state.properties):
                            with cpp.subs(j = str(j), pName = prop.name, stateLower = state.name.lower()):
                                cpp('shared_ptr<Meta_$stateName$_$pName$> $stateLower$_property_$j$(new Meta_$stateName$_$pName$());')
                                cpp('state_$i$->addProperty($stateLower$_property_$j$);')
                        cpp('meta->addState(state_$i$);')
                    cpp("")
                cpp("return meta;")


        cpp.close()
