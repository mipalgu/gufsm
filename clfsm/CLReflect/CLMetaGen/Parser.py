# Parses the directory and creates a machine definition
from MetaMachineDefinition import *

class Parser:

    def __init__(self, path, machineName):
        self._path = path
        self._machineName = machineName

    def parse(self):
        self._metaMachine = MetaMachineDefinition(self._path, self._machineName)
        return self._metaMachine
