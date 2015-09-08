from CPP_Types import *
from difflib import SequenceMatcher as SM
from string import maketrans

class CPP_Type_Interpreter(object):
    """Class for interpreting variable types as refl_type enum value"""
    def __init__(self):
        super(CPP_Type_Interpreter, self).__init__()
        cppTypes = CPP_Types()
        self.types = cppTypes.types
        self.typeDict = { t.replace("REFL_", "").translate(None, "*_ ").lower() : t for t in self.types }

    def getReflectType(self, typeString):
        """Gets the corresponding refl_type"""
        strippedTypeString = typeString.replace("const", "").replace("std::", '').translate(None, "*_ ").lower()
        # Try naive lookup first
        naive = self.naiveLookup(strippedTypeString)
        if naive:
            return naive
        fuzzy = self.fuzzyLookup(strippedTypeString)
        if fuzzy:
            return fuzzy
        else:
            return 'REFL_USERTYPE'

    def naiveLookup(self, typeString):
        return self.typeDict.get(typeString.replace('std::', ''), None)

    def fuzzyLookup(self, typeString):
        """Uses fuzzy text matching to guess type.
            Only returns if match is above confidence ratio, else returns None"""
        matchInfo = (None, 0) # Type string, Ratio
        confidenceBarrier = 0.95
        keys = self.typeDict.keys()
        strippedTypeString = typeString.replace('std::', '')
        for k in keys:
            ratio = SM(None, strippedTypeString, k.replace(' ', '')).ratio()
            if ratio > matchInfo[1]:
                matchInfo = (k, ratio)
        #print (matchInfo, strippedTypeString)
        if matchInfo[1] > confidenceBarrier:
            #print 'returning ' + self.typeDict[matchInfo[0]]
            return self.typeDict[matchInfo[0]]
        else:
            return None
