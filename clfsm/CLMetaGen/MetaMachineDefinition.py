#Defines a meta machine

class MetaMachineDefinition:

    def getIncludes(self):
        return self.includes

    def getStates(self):
        return self.states

    def getProperties(self):
        return self.properties

class State:

    def getIncludes(self):
        return self.includes

    def getName(self):
        return self.name

    def getIndex(self):
        return self.index

    def getProperties(self):
        return self.properties

class MachineProperty:

    def getType(self):
        return self.type

    def getName(self):
        return self.name

    def getMachine(self):
        return self.machineName

class StateProperty:

    def getType(self):
        return self.type

    def getName(self):
        return self.name

    def getMachine(self):
        return self.machineName

    def getState(self):
        return self.state
