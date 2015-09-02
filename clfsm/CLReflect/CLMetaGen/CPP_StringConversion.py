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
                cpp('std::ostringstream address;')
                cpp('address << static_cast<void *>(&$propVar$);')
                cpp('std::string str = address.str();')
                cpp('size_t len = str.length() + 1;')
                cpp('$returnVar$ = static_cast<char *>(malloc(sizeof(char) * len));')
                cpp('refl_strcpy($returnVar$, str.c_str(), len);')
            cpp('return $returnVar$;')

    def writeSetPropertyAsString(self, valueName):
        cpp = self.cpp
        checker = TypeChecker(self.prop)
        stringVar = 'stringVar'
        with cpp.subs(value = valueName, propVar = self.propVarName,
                        stringVar = stringVar, dType = self.prop.dataType):
            cpp('std::string $stringVar$($value$);')
            with cpp.block('if ($stringVar$.length() != 0)'):
                if checker.isChar():
                    pass
                elif checker.isCharPointer():
                    pass
                elif checker.isStdString():
                    pass
                elif checker.isPrimitiveConvertable():
                    if checker.isInt():
                        cpp('$propVar$ = stoi($stringVar$);')
                    elif checker.isUnsignedInt():
                        cpp('$propVar$ = static_cast<unsigned int>(stoi($stringVar$));')
                    elif checker.isLong():
                        cpp('$propVar$ = stol($stringVar$);')
                    elif checker.isFloat():
                        cpp('$propVar$ = stof($stringVar$);')
                    elif checker.isDouble():
                        cpp('$propVar$ = stod($stringVar$);')
                elif checker.isPointer():
                    pass
                else:
                    pass

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
