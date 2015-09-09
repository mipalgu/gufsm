from CodeGen import *

class CPP_StringConversion(object):
    """docstring for CPP_StringConversion"""
    def __init__(self, prop, propVarName, cpp):
        super(CPP_StringConversion, self).__init__()
        self.prop = prop
        self.propVarName = propVarName
        self.cpp = cpp

    def writeGetPropertyAsString(self):
        cpp = self.cpp
        varName = 'buffer' # the name of the return value
        checker = TypeChecker(self.prop)
        with cpp.subs(returnVar = varName, propVar = self.propVarName, dType = self.prop.dataType):
            if checker.isChar():
                with cpp.block('if (bufferLen >= 2)'):
                    cpp('snprintf(buffer, 2, "%c", $propVar$);')
            elif checker.isCharPointer():
                cpp('snprintf(buffer, bufferLen, "%s", $propVar$);')
            elif checker.isStdString():
                cpp('snprintf(buffer, bufferLen, "%s", $propVar$.c_str());')
            elif checker.isPrimitiveConvertable():
                if checker.isSignedInt():
                    cpp('snprintf(buffer, bufferLen, "%d", $propVar$);')
                elif checker.isUnsignedInt():
                    cpp('snprintf(buffer, bufferLen, "%u", $propVar$);')
                elif checker.isSignedLong():
                    cpp('snprintf(buffer, bufferLen, "%ld", $propVar$);')
                elif checker.isFloat() or checker.isDouble():
                    cpp('snprintf(buffer, bufferLen, "%f", $propVar$);')
            elif checker.isPointer():
                cpp('snprintf(buffer, bufferLen, "%p", $propVar$);')
            else:
                cpp('snprintf(buffer, bufferLen, "%p", $propVar$);')
            cpp('return $returnVar$;')

    def writeSetPropertyAsString(self, valueName):
        cpp = self.cpp
        checker = TypeChecker(self.prop)
        stringVar = 'stringVar'
        testVar = 'testVar'
        with cpp.subs(value = valueName, propVar = self.propVarName,
                        stringVar = stringVar, testVar = testVar, dType = self.prop.dataType):
            cpp('std::string $stringVar$($value$);')
            with cpp.block('if ($stringVar$.length() != 0)'):
                with cpp.block('try'):
                    if checker.isChar():
                        cpp('$propVar$ = $value$[0];')
                    elif checker.isCharPointer():
                        cpp('memcpy(&$propVar$, &$value$, sizeof(char *));')
                    elif checker.isStdString():
                        cpp('$propVar$ = std::string($value$);')
                    elif checker.isPrimitiveConvertable():
                        if checker.isSignedInt():
                            cpp('$dType$ $testVar$ = atoi($stringVar$.c_str());')
                            cpp('$propVar$ = $testVar$;')
                        elif checker.isUnsignedInt():
                            cpp('$propVar$ = static_cast<unsigned int>(stoi($stringVar$));')
                        elif checker.isSignedLong() or checker.isUnsignedLong():
                            cpp('$propVar$ = stol($stringVar$);')
                        elif checker.isFloat():
                            cpp('$dType$ $testVar$ = static_cast<$dType$>(atof($stringVar$.c_str()));')
                            cpp('$propVar$ = $testVar$;')
                    else:
                        pass
                with cpp.block('catch (std::invalid_argument e)'):
                    cpp('std::cerr << e.what() << std::endl;')
            with cpp.block('else '):
                cpp('std::cout << "string length 0" << std::endl;')


import re
from CPP_Types import *

class TypeChecker(object):
    """docstring for TypeChecker"""
    typeRepo = CPP_Types()
    _chars = typeRepo.types[:3]
    _primitiveConvertables = typeRepo.types[3:37]
    _string = [typeRepo.types[38]]
    _integers = typeRepo.types[3:14] + typeRepo.types[29:37]
    _longs = typeRepo.types[14:26]
    _floatingPoint = typeRepo.types[26:28]
    _longFloatingPoint = [typeRepo.types[29]]

    def __init__(self, prop):
        super(TypeChecker, self).__init__()
        self.prop = prop

    def isChar(self):
        prop = self.prop
        return 'char' in prop.dataType and '*' not in prop.dataType

    def isCharPointer(self):
        prop = self.prop
        return prop.enumType in self._chars and prop.indirection == 1

    def isStdString(self):
        prop = self.prop
        return prop.enumType in self._string and prop.indirection == 0

    def isPrimitiveConvertable(self):
        prop = self.prop
        if '*' in prop.dataType:
            return False
        return prop.enumType in self._primitiveConvertables

    def isUnsignedInt(self):
        return self.prop.enumType in self._integers and self.prop.isUnsigned

    def isSignedInt(self):
        prop = self.prop
        return prop.enumType in self._integers and not self.prop.isUnsigned

    def isSignedLong(self):
        return self.prop.enumType in self._longs and not self.prop.isUnsigned

    def isUnsignedLong(self):
        return self.prop.enumType in self._longs and self.prop.isUnsigned

    def isFloat(self):
        prop = self.prop
        return prop.enumType in self._floatingPoint

    def isLongFloat(self):
        prop = self.prop
        return prop.enumType in self._longFloatingPoint

    def isPointer(self):
        prop = self.prop
        return prop.indirection > 0
