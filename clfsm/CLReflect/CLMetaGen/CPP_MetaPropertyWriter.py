from CodeGen import *

class CPP_MetaPropertyWriter(object):
    """docstring for CPP_MetaPropertyWriter"""
    def __init__(self, machineDef, cpp):
        super(CPP_MetaPropertyWriter, self).__init__()
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        self.writeDeclarations()
        self.writeImplementations()

    def writeDeclarations(self):
        cpp = self.cpp
        cpp("\n// Property Access Declarations")
        # Machine properties
        for prop in self.machineDef.properties:
            cpp(self.getMethodSignatureForMachineProperty_Void(prop.name) + ";")
        for state in self.machineDef.states:
            for prop in state.properties:
                cpp(self.getMethodSignatureForStateProperty_Void(state.name, prop.name) + ";")

    def writeImplementations(self):
        cpp = self.cpp
        cpp("\n// Property Access Implementations")
        for prop in self.machineDef.properties:
            with cpp.subs(mName = self.machineDef.name, pName = prop.name):
                with cpp.block(self.getMethodSignatureForMachineProperty_Void(prop.name)):
                    cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                    cpp("return " + self._voidStaticCastForProperty("thisMachine->", prop) + ";")


    def _voidStaticCastForProperty(self, machineAccess, property):
        staticCastTemplate = "static_cast<void *>(var)"
        if "*" in property.dataType or "&" in property.dataType: # Is it a pointer or reference?
            return staticCastTemplate.replace("var", machineAccess + property.name)
        else:
            return staticCastTemplate.replace("var", "&" + machineAccess + property.name)

    @staticmethod
    def getMethodSignatureForMachineProperty_Void(propertyName):
        signatureTemplate = "void* mp_machine_$pName$_getAsVoid(refl_machine_t machine, refl_userData_t data)"
        return signatureTemplate.replace("$pName$", propertyName)

    @staticmethod
    def getMethodSignatureForStateProperty_Void(stateName, propertyName):
        signatureTemplate = "void* mp_$sName$_$pName$_getAsVoid(refl_machine_t machine, refl_userData_t data)"
        return signatureTemplate.replace("$sName$", stateName).replace("$pName$", propertyName)
