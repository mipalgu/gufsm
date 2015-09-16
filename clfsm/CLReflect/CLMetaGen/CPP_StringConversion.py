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
        formatBuilder = PrintfFormatBuilder()
        formatStr = formatBuilder.buildFormatString(self.prop)
        with cpp.subs(returnVar = varName, propVar = self.propVarName,
                        dType = self.prop.dataType,
                        formatStr = formatStr):
            if not formatStr:
                dTypeStripped = self.prop.dataType.translate(None, '* ')
                cpp('#ifdef ' + dTypeStripped + '_DEFINED') # is it a whiteboard type
                cpp('snprintf(buffer, bufferLen, "%s", $propVar$.description().c_str());')
                cpp('#else')
                cpp('snprintf(buffer, bufferLen, "%p", &$propVar$);')
                cpp("#endif")
            elif checker.isStdString():
                cpp('snprintf(buffer, bufferLen, "$formatStr$", $propVar$.c_str());')
            else:
                cpp('snprintf(buffer, bufferLen, "$formatStr$", $propVar$);')
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
                        cpp('$propVar$ = static_cast<$dType$>($value$[0]);')
                    elif checker.isCharPointer():
                        cpp('memcpy(&$propVar$, &$value$, sizeof(char *));')
                    elif checker.isStdString():
                        cpp('$propVar$ = std::string($value$);')
                    elif checker.isPrimitiveConvertable():
                        if checker.isSignedInt():
                            cpp('$dType$ $testVar$ = static_cast<$dType$>(stoi($stringVar$));')
                            cpp('$propVar$ = $testVar$;')
                        elif checker.isUnsignedInt():
                            cpp('$propVar$ = static_cast<$dType$>(stoi($stringVar$));')
                        elif checker.isLongFloat():
                            cpp('$propVar$ = static_cast<$dType$>(stold($stringVar$));')
                        elif checker.isSignedLong():
                            cpp('$propVar$ = static_cast<$dType$>(stol($stringVar$));')
                        elif checker.isUnsignedLong():
                            cpp('$propVar$ = static_cast<$dType$>(stoul($stringVar$));')
                        elif checker.isFloat():
                            cpp('$dType$ $testVar$ = static_cast<$dType$>(atof($stringVar$.c_str()));')
                            cpp('$propVar$ = $testVar$;')
                    else:
                        dTypeStripped = self.prop.dataType.translate(None, '* ')
                        cpp('#ifdef ' + dTypeStripped + '_DEFINED') # is it a whiteboard type
                        cpp('$propVar$.from_string(std::string());')
                        cpp("#endif")
                with cpp.block('catch (std::exception &e)'):
                    cpp('std::cerr << "Exception: " << e.what() << std::endl;')
            with cpp.block('else '):
                cpp('std::cout << "string length 0" << std::endl;')


import re
from CPP_Types import *

class TypeChecker(object):
    """docstring for TypeChecker"""
    typeRepo = CPP_Types()
    _chars = typeRepo.types[:3]
    _primitiveConvertables = typeRepo.types[3:31]
    _string = [typeRepo.types[32]]
    _integers = typeRepo.types[3:14] + typeRepo.types[23:31]
    _longs = typeRepo.types[14:20]
    _floatingPoint = typeRepo.types[20:23]
    _longFloatingPoint = [typeRepo.types[22]]

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


class PrintfFormatBuilder(object):
    """ Builds a format string for printf """
    def __init__(self):
        super(PrintfFormatBuilder, self).__init__()

    def buildFormatString(self, prop):
        checker = TypeChecker(prop)
        if checker.isChar():
            return "%c"
        elif checker.isStdString() or checker.isCharPointer():
            return "%s"
        elif prop.indirection > 0:
            return "%p"
        elif checker.isPrimitiveConvertable():
            prefix = ''
            mid = ''
            if prop.isUnsigned:
                mid = 'u'
            elif checker.isFloat():
                mid = 'f'
            else:
                mid = 'd'
            # prefix
            if checker.isSignedLong() or checker.isUnsignedLong():
                prefix = 'l'
            elif checker.isLongFloat():
                prefix = 'L'
            return '%' + prefix + mid
        else:
            return None
