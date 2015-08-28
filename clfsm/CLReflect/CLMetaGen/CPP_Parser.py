# Parses the directory and creates a machine definition
from CPP_MetaMachineDefinition import *
from CLMetaGenParser import *

class CPP_Parser(CLMetaGenParser):
    """docstring for CPP_Parser"""
    def __init__(self, path, machineName):
        super(CPP_Parser, self).__init__(path, machineName)

    def parse(self):
        self._metaMachine = CPP_MetaMachineDefinition(self._path, self._machineName)
        return self._metaMachine
