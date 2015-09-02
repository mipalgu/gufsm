from CodeGen import *
from CPP_StringConversion import *

class CPP_MetaPropertyWriter(object):
    """docstring for CPP_MetaPropertyWriter"""

    _primitiveConvertables = ['int', 'long', 'float' 'double' ]

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
            cpp(self.setMethodSignatureForMachineProperty_Void(prop.name) + ';')
            cpp(self.getMethodSignatureForMachineProperty_String(prop.name) + ';')
            cpp(self.setMethodSignatureForMachineProperty_String(prop.name) + ';')
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
                with cpp.block(self.setMethodSignatureForMachineProperty_Void(prop.name)):
                    # Check if const
                    if 'const' not in prop.dataType:
                        cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                        cpp('thisMachine->$pName$ = ' + self._typeStaticCastForProperty(prop.dataType) + ';')
                # String methods
                with cpp.block(self.getMethodSignatureForMachineProperty_String(prop.name)):
                    cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                    stringConverter = CPP_StringConversion(prop, 'thisMachine->' + prop.name, cpp)
                    stringConverter.writeGetPropertyAsString()
                with cpp.block(self.setMethodSignatureForMachineProperty_String(prop.name)):
                    cpp("$mName$* thisMachine = static_cast<$mName$*>(machine);")
                    stringConverter = CPP_StringConversion(prop, 'thisMachine->' + prop.name, cpp)
                    stringConverter.writeSetPropertyAsString('value')



    @staticmethod
    def _voidStaticCastForProperty(access, property):
        staticCastTemplate = "static_cast<void *>($var$)"
        return staticCastTemplate.replace("$var$", "&" + access + property.name)

    @staticmethod
    def _typeStaticCastForProperty(dataType):
        staticCastTemplate = 'static_cast<$type$>(value)'
        if "*" in dataType: # Is it a pointer or reference?
            return staticCastTemplate.replace('$type$', dataType)
        else:
            return "*" + staticCastTemplate.replace('$type$', dataType + '*')


    @staticmethod
    def getMethodSignatureForMachineProperty_Void(propertyName):
        signatureTemplate = "void* mp_machine_$pName$_getAsVoid(refl_machine_t machine, refl_userData_t data)"
        return signatureTemplate.replace("$pName$", propertyName)

    @staticmethod
    def getMethodSignatureForStateProperty_Void(stateName, propertyName):
        signatureTemplate = "void* mp_$sName$_$pName$_getAsVoid(refl_machine_t machine, refl_userData_t data)"
        return signatureTemplate.replace("$sName$", stateName).replace("$pName$", propertyName)

    @staticmethod
    def getMethodSignatureForMachineProperty_String(propertyName):
        signatureTemplate = "char* mp_machine_$pName$_getAsString(refl_machine_t machine, refl_userData_t data)"
        return signatureTemplate.replace('$pName$', propertyName)

    @staticmethod
    def setMethodSignatureForMachineProperty_String(propertyName):
        signatureTemplate = "void mp_machine_$pName$_setAsString(refl_machine_t machine, refl_userData_t data, const char * const value)"
        return signatureTemplate.replace('$pName$', propertyName)


    @staticmethod
    def setMethodSignatureForMachineProperty_Void(propertyName):
        signatureTemplate = "void mp_machine_$pName$_setAsVoid(refl_machine_t machine, refl_userData_t data, void* value)"
        return signatureTemplate.replace('$pName$', propertyName)
