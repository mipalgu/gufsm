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
                if checker.isInt():
                    cpp('snprintf(buffer, bufferLen, "%d", $propVar$);')
                elif checker.isUnsignedInt():
                    cpp('snprintf(buffer, bufferLen, "%u", $propVar$);')
                elif checker.isLong():
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
                        cpp('//$propVar$ = $value$;')
                        cpp('memcpy(&$propVar$, &$value$, sizeof(char *));')
                    elif checker.isStdString():
                        pass
                    elif checker.isPrimitiveConvertable():
                        if checker.isInt():
                            cpp('$dType$ $testVar$ = atoi($stringVar$.c_str());')
                            cpp('$propVar$ = $testVar$;')
                        elif checker.isUnsignedInt():
                            cpp('$propVar$ = static_cast<unsigned int>(stoi($stringVar$));')
                        elif checker.isLong():
                            cpp('$propVar$ = stol($stringVar$);')
                        elif checker.isFloat() or checker.isDouble():
                            cpp('$dType$ $testVar$ = static_cast<$dType$>(atof($stringVar$.c_str()));')
                            cpp('$propVar$ = $testVar$;')
                        elif checker.isDouble():
                            cpp('$dType$ $testVar$ = atod($stringVar$.c_str());')
                            cpp('$propVar$ = $testVar$;')
                    else:
                        pass
                with cpp.block('catch (std::invalid_argument e)'):
                    cpp('std::cerr << e.what() << std::endl;')
            with cpp.block('else '):
                cpp('std::cout << "string length 0" << std::endl;')


import re

class TypeChecker(object):
    """docstring for TypeChecker"""
    _primitiveConvertables = ['int', 'long', 'float', 'double']

    def __init__(self, prop):
        super(TypeChecker, self).__init__()
        self.prop = prop

    def isChar(self):
        prop = self.prop
        return 'char' in prop.dataType and '*' not in prop.dataType

    def isCharPointer(self):
        prop = self.prop
        return 'char' in prop.dataType and prop.dataType.count('*') == 1

    def isStdString(self):
        prop = self.prop
        return 'string' in prop.dataType and '*' not in prop.dataType

    def isPrimitiveConvertable(self):
        prop = self.prop
        if '*' in prop.dataType:
            return False
        for primitiveType in self._primitiveConvertables:
            if primitiveType in prop.dataType: #XXX
                return True
        return False

    def isUnsignedInt(self):
        return 'unsigned int' in self.prop.dataType

    def isInt(self):
        prop = self.prop
        m = re.match(r'^int$', prop.dataType)
        if m:
            return True
        return False

    def isLong(self):
        prop = self.prop
        m = re.match(r'^long$', prop.dataType)
        if m:
            return True
        return False

    def isFloat(self):
        prop = self.prop
        m = re.match(r'^float$', prop.dataType)
        if m:
            return True
        return False

    def isDouble(self):
        prop = self.prop
        m = re.match(r'^double$', prop.dataType)
        if m:
            return True
        return False

    def isPointer(self):
        prop = self.prop
        return '*' in prop.dataType
