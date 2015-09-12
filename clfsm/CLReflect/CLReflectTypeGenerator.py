from CodeGen import *

""" A script for generating the type conversion methods for CLReflect.
    Usage: python CLReflectTypeGenerator.py
"""

class CLReflectTypeGenerator(object):
    """ A class for generating both the type enum for CLReflect, and a set
        of utility methods for converting between supported types. Of course,
        there is no guarantee that the particular conversion will be valid """
    _supportedTypes = [
        "char",
        "signed char",
        "unsigned char",
        "short",
        "short int",
        "signed short",
        "signed short int",
        "unsigned short",
        "unsigned short int",
        "int",
        "signed",
        "signed int",
        "unsigned",
        "unsigned int",
        "long",
        "long int",
        "signed long",
        "signed long int",
        "unsigned long",
        "unsigned long int",
        "float",
        "double",
        "long double",
        "int8_t",
        "int16_t",
        "int32_t",
        "int64_t",
        "uint8_t",
        "uint16_t",
        "uint32_t",
        "uint64_t",
        "void",
        "string",
        "usertype"
    ]

    def __init__(self, enumOutFile, conversionOutFile):
        super(CLReflectTypeGenerator, self).__init__()
        self.enumOutFile = enumOutFile
        self.conversionOutFile = conversionOutFile
        self._withPointerTypes = []
        for t in self._supportedTypes[:31]:
            self._withPointerTypes.append(t)
            self._withPointerTypes.append(t + '*')
        self._declarationTypes = [t.replace(' ', '_') for t in self._withPointerTypes]

    def generateTypeList(self):
        with open(self.enumOutFile, 'w') as outFile:
            outFile.write('REFL_' + self._supportedTypes[0].upper().replace(' ', '_') + '\n')
            for index ,t in enumerate(self._supportedTypes[1:]):
                outFile.write(',REFL_' + t.upper().replace(' ', '_') + '\n')
            outFile.close()

    def generateConversionHeader(self):
        cpp = CppFile(self.conversionOutFile + '.h')
        cpp('#ifndef API_TYPECONVERSION_H\n#define API_TYPECONVERSION_H')

        cpp('// Generated declarations for type conversion')
        includes = ['"API_Result.h"', '"API_MetaProperty_Access.h"']
        for inc in includes:
            with cpp.subs(inc = inc):
                cpp('#include $inc$')
        for i, t in enumerate(self._declarationTypes):
            with cpp.subs(type = self._withPointerTypes[i], decType = t.replace('*', '_ptr')):
                cpp('$type$ refl_getAs_$decType$(refl_metaProperty p, refl_machine_t mach, CLReflectResult *result);')

        cpp('#endif')

    def generateConversionImplementation(self):
        cpp = CppFile(self.conversionOutFile + '.c')
        cpp('// Generated implementations for type conversion')
        cpp('#include "' + self.conversionOutFile + '.h"')
        for i, t in enumerate(self._declarationTypes):
            val = 'value'
            with cpp.subs(type = self._withPointerTypes[i], decType = t.replace('*', '_ptr'),
                            val = val):
                with cpp.block('$type$ refl_getAs_$decType$(refl_metaProperty p, refl_machine_t mach, CLReflectResult *result)'):
                    cpp('void* $val$ = _refl_getPropertyAsVoid(p, mach, result);')
                    cpp('return *($type$*)$val$;')



import sys, os

def main(argv):
    enumOutFile = 'CLReflectTypeEnum'
    conversionOutFile = 'API_TypeConversion'
    generator = CLReflectTypeGenerator(enumOutFile, conversionOutFile)
    generator.generateTypeList()
    generator.generateConversionHeader()
    generator.generateConversionImplementation()


if __name__ == "__main__":
    main(sys.argv)
