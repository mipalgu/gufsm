#Defines a meta machine
import os, glob, re
from CPP_Type_Interpreter import *

def isConst(dataType):
    if re.match(r'(^|\W)const(?=[\W$].)', dataType):
        return True
    return False

def isUnsigned(dataType):
    if re.match(r'^unsigned ', dataType):
        return True
    return False


class CPP_MetaMachineDefinition:
    def __init__(self, machinePath, name):
        self.machinePath = machinePath
        self.name = name
        self.includes = []
        self.properties = []
        self.states = []
        self.parseControlInformation()
        self.parseIncludes()
        self.parseStates()
        self.parseProperties()


    def parseControlInformation(self):
        """ Retrieves initial and suspend state indexes """
        with open(os.path.join(self.machinePath, self.name + '.mm')) as f:
            contents = f.read()
            # search for 'setInitialState(_states[n])'
            match = re.search('(?<=setInitialState\(_states\[)\d', contents)
            self.initalState = int(match.group())


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
        typeInterpreter = CPP_Type_Interpreter()
        for line in propertyFile:
            if line[:2] != r'//':
                tokens = line.split("\t")
                dataType = tokens[0].rstrip()
                varName = tokens[1].rstrip(';')
                # Check if an array
                arrayDecStart = varName.find('[')
                if arrayDecStart != -1:
                    # Erase array dec from var name and append to type
                    varName = varName[:arrayDecStart]
                    dataType += '*'
                prop = MachineProperty(varName, dataType, self.name)
                prop.isConst = isConst(dataType)
                prop.isUnsigned = isUnsigned(dataType)
                prop.indirection = dataType.count('*')
                prop.enumType = typeInterpreter.getReflectType(dataType)
                self.properties.append(prop)
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
        self.parseTransitions()
        self.parseProperties()

    def parseIncludes(self):
        includePath = os.path.join(self.path, 'State_' + self.name + '_Includes.h')
        includeFile = open(includePath)
        for line in includeFile:
            self.includes.append(line.rstrip('\n'))
        includeFile.close()

    def parseProperties(self):
        typeInterpreter = CPP_Type_Interpreter()
        propertiesPath = os.path.join(self.path, 'State_' + self.name + '_Variables.h')
        propertyFile = open(propertiesPath)
        for line in propertyFile:
            if line.strip() and line[:2] != r'//': #check if comment or empty line i.e. not a variable declaration
                tokens = line.split("\t")
                dataType = tokens[0]
                varName = tokens[1].rstrip(';')
                # Change array to ptr
                if '[' in varName:
                    arrIndex = varName.index('[')
                    dataType += '*'
                    varName = varName[:arrIndex]
                prop = StateProperty(varName, dataType, self.machine, self.name)
                prop.isConst = isConst(dataType)
                prop.isUnsigned = isUnsigned(dataType)
                prop.indirection = dataType.count('*')
                prop.enumType = typeInterpreter.getReflectType(dataType)
                self.properties.append(prop)
        propertyFile.close()

    def parseTransitions(self):
        # Find expression files
        transitionFiles = sorted(glob.glob(self.path + '/*' + self.name + '*.expr'))  # sorted so we get transition index for free
        # Create transition and set source state, expression and transition index
        transitions = []
        for index, file in enumerate(transitionFiles):
            with open(file) as expressionFile:
                expression = expressionFile.read().rstrip()
            transition = Transition()
            transition.index = index
            transition.source = self.index
            transition.expression = expression
            transitions.append(transition) # Add to transition list
        # Open state header file, find transition target state
        with open(self.path + '/State_' + self.name + '.h') as stateFile:
            contents = stateFile.read()
            for index, trans in enumerate(transitions):
                # Find transition declaration
                match = re.search('(?<=Transition_0\(int toState = )\d', contents)
                trans.target = int(match.group())
        self.transitions = transitions

class Transition:

    def __init__(self):
        pass


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
