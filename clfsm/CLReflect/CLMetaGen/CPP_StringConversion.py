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
        varName = 'returnVar' # the name of the return value
        checker = TypeChecker(self.prop)
        with cpp.subs(returnVar = varName, propVar = self.propVarName, dType = self.prop.dataType):
            cpp('char * $returnVar$ = NULL;')
            if checker.isChar():
                cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * 2));')
                cpp('refl_strcpy($returnVar$, &$propVar$, 2);')
            elif checker.isCharPointer():
                with cpp.block('if ($propVar$ != NULL)'):
                    cpp('unsigned long len = strlen($propVar$) + 1;')
                    cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * len));')
                    cpp('refl_strcpy($returnVar$, $propVar$, len);')
                with cpp.block('else'):
                    with cpp.subs(nullStringVar = 'nullStringVar'):
                        cpp('const char * $nullStringVar$ = "NULL_STRING";')
                        cpp('unsigned long len = strlen($nullStringVar$) + 1;')
                        cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * len));')
                        cpp('refl_strcpy($returnVar$, $nullStringVar$, len);')
            elif checker.isStdString():
                pass
            elif checker.isPrimitiveConvertable():
                cpp('std::string str = std::to_string($propVar$);')
                cpp('size_t len = str.length() + 1;')
                cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * len));')
                cpp('refl_strcpy($returnVar$, str.c_str(), len);')
            elif checker.isPointer():
                cpp('std::ostringstream address;')
                cpp('address << static_cast<void *>($propVar$);')
                cpp('std::string str = address.str();')
                cpp('size_t len = str.length() + 1;')
                cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * len));')
                cpp('refl_strcpy($returnVar$, str.c_str(), len);')
            else:
                pass
            cpp('return $returnVar$;')
        '''
        if character pointer:
            copy and return
        elif char (but not pointer):
            malloc(2), copy and return
        elif string:
            check if pointer
            get c_str(), copy and return
        elif primitive convertable type:
            choose stoX method, copy and return
        else:
            return NULL

        '''

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

    def isIntOrLong(self):
        prop = self.prop
        return 'int' in prop.dataType or 'long' in prop.dataType

    def isFloatingPoint(self):
        prop = self.prop
        return 'float' in prop.dataType or 'double' in prop.dataType

    def isPointer(self):
        prop = self.prop
        return '*' in prop.dataType
