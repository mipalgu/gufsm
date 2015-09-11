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

    def generateTypeList(self):
        with open(self.enumOutFile, 'w') as outFile:
            outFile.write('REFL_' + self._supportedTypes[0].upper().replace(' ', '_') + '\n')
            for index ,t in enumerate(self._supportedTypes[1:]):
                outFile.write(',REFL_' + t.upper().replace(' ', '_') + '\n')
            outFile.close()

    def generateConversionHeader(self):
        with open(self.conversionOutFile + '.h', 'w') as outFile:
            outFile.close()

    def generateConversionImplementation(self):
        with open(self.conversionOutFile + '.c', 'w') as outFile:
            outFile.close()


import sys, os

def main(argv):
    generator = CLReflectTypeGenerator(argv[1], argv[2])
    generator.generateTypeList()
    generator.generateConversionHeader()
    generator.generateConversionImplementation()


if __name__ == "__main__":
    main(sys.argv)
