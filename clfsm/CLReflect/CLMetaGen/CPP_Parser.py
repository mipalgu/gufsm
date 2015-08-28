# Parses the directory and creates a machine definition
from CPP_MetaMachineDefinition import *

class CPP_Parser:

    def __init__(self, path, machineName):
        self._path = path
        self._machineName = machineName

    def parse(self):
        self._metaMachine = CPP_MetaMachineDefinition(self._path, self._machineName)
        return self._metaMachine
