from CodeGen import *
from MetaMachineDefinition import *

class MetaTransitionWriter:
    """A class that generates meta-code for all state transitions"""
    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        cpp = self.cpp
        cpp("/*")
        self.writeDeclarations()
        self.writeImplementations()
        cpp("*/")

    def writeDeclarations(self):
        pass

    def writeImplementations(self):
        pass
