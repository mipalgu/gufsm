class CLReflectTypeGenerator(object):
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
        "long long",
        "long long int",
        "signed long long",
        "signed long long int",
        "unsigned long long",
        "unsigned long long int",
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

    def __init__(self, outFile):
        super(CLReflectTypeGenerator, self).__init__()
        self.outFile = outFile

    def generateTypeList(self):
        with open(self.outFile, 'w') as outFile:
            outFile.write('REFL_' + self._supportedTypes[0].upper().replace(' ', '_') + '\n')
            for index ,t in enumerate(self._supportedTypes[1:]):
                outFile.write(',REFL_' + t.upper().replace(' ', '_') + '\n')
            outFile.close()

import sys, os

def main(argv):
    generator = CLReflectTypeGenerator(argv[1])
    generator.generateTypeList()


if __name__ == "__main__":
    main(sys.argv)
