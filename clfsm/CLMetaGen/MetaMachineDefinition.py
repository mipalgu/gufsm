#Defines a meta machine
import os

class MetaMachineDefinition:
    def __init__(self, machinePath, name):
        self.machinePath = machinePath
        self.name = name
        self.includes = []
        self.properties = []
        self.states = []
        self.parseIncludes()
        self.parseStates()
        self.parseProperties()


    def parseIncludes(self):
        '''
        Get include paths for the machine
        '''
        includeFileName = self.name + "_Includes.h"
        includeFilePath = os.path.join(self.machinePath, includeFileName)
        includeFile = open(includeFilePath)
        for line in includeFile:
            self.includes.append(line.rstrip('\n'))
        includeFile.close()

    def parseStates(self):
        '''
        Parse and populate state objects in self.states for each machine state
        '''
        statePath = os.path.join(self.machinePath, "States")
        stateFile = open(statePath)
        stateNames = []
        for line in stateFile:
            stateNames.append(line.rstrip('\n'))
        stateFile.close()
        for index, state in enumerate(stateNames):
            self.states.append(State(self.machinePath, state, self.name, index))

    def parseProperties(self):
        propertiesPath = os.path.join(self.machinePath, self.name + '_Variables.h')
        propertyFile = open(propertiesPath)
        for line in propertyFile:
            if line[:2] != r'//':
                tokens = line.split("\t")
                dataType = tokens[0]
                varName = tokens[1].rstrip(';')
                self.properties.append(MachineProperty(varName, dataType, self.name))
        propertyFile.close()



class State:
    def __init__(self, path, name, machine, index):
        self.path = path
        self.name = name
        self.machine = machine
        self.index = index
        self.includes = []
        self.properties = []
        self.parseIncludes()
        self.parseProperties()

    def parseIncludes(self):
        includePath = os.path.join(self.path, 'State_' + self.name + '_Includes.h')
        includeFile = open(includePath)
        for line in includeFile:
            self.includes.append(line.rstrip('\n'))
        includeFile.close()



    def parseProperties(self):
        propertiesPath = os.path.join(self.path, 'State_' + self.name + '_Variables.h')
        propertyFile = open(propertiesPath)
        for line in propertyFile:
            if line[:2] != r'//':
                tokens = line.split("\t")
                dataType = tokens[0]
                varName = tokens[1].rstrip(';')
                self.properties.append(StateProperty(varName, dataType, self.machine, self.name))
        propertyFile.close()
        print [p.__dict__ for p in self.properties]

class MachineProperty:

    def __init__(self, name, dataType, machineName):
        self.name = name
        self.dataType = dataType
        self.machineName = machineName


class StateProperty:

    def __init__(self, name, dataType, machineName, stateName):
        self.name = name
        self.dataType = dataType
        self.machineName = machineName
        self.stateName = stateName
