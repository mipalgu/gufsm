from CPP_Types import *
from difflib import SequenceMatcher as SM

class CPP_Type_Interpreter(object):
    """Class for interpreting variable types as refl_type enum value"""
    def __init__(self):
        super(CPP_Type_Interpreter, self).__init__()
        self.types = CPP_Types.types
        self.typeDict = { t.replace('REFL_', '').
                            replace('PTR', '*').
                            replace('_', '').lower() : t for t in self.types }

    def getReflectType(self, typeString):
        """Gets the corresponding refl_type"""
        # Try naive lookup first
        naive = self.naiveLookup(typeString)
        if naive:
            return naive
        fuzzy = self.fuzzyLookup(typeString)
        if fuzzy:
            return fuzzy
        else:
            return 'REFL_USERTYPE'

    def naiveLookup(self, typeString):
        return self.typeDict.get(typeString.replace(' ', ''), None)

    def fuzzyLookup(self, typeString):
        """Uses fuzzy text matching to guess type.
            Only returns if match is above confidence ratio, else returns None"""
        matchInfo = (None, 0) # Type string, Ratio
        confidenceBarrier = 0.95
        keys = self.typeDict.keys()
        strippedTypeString = typeString.replace(' ', '')
        for k in keys:
            ratio = SM(None, strippedTypeString, k.replace(' ', '')).ratio()
            if ratio > matchInfo[1]:
                matchInfo = (k, ratio)
        #print matchInfo
        if matchInfo[1] > confidenceBarrier:
            #print 'returning ' + self.typeDict[matchInfo[0]]
            return self.typeDict[matchInfo[0]]
        else:
            return None

    def pointerLookup(self, typeString):
        """Tries adjusting the position of * to get a match"""
        ptrIndex = typeString.index('*')
        if typeString[ptrIndex - 1] != ' ':
            # insert space between type and *
            typeString = typeString[:ptrIndex] + ' ' + typeString[ptrIndex:]
            return self.naiveLookup(typeString)
        # Now check for too many spaces (need 1)
