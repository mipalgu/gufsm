from CPP_MetaFileWriter import *
from CPP_Parser import *


class CLMetaGenDependencies:
    languageDict = { "C++" : [ CPP_MetaFileWriter, CPP_Parser ]}

    def getWriterForLanguage(self, lang):
        return self.languageDict[lang][0]

    def getParserForLanguage(self, lang):
        return self.languageDict[lang][1]
