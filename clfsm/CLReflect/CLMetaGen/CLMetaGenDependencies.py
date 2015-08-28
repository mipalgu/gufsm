from CPP_MetaFileWriter import *
from CPP_MetaMachineDefinition import *


class CLMetaGenDependencies:
    languageDict = { "C++" : [ CPP_MetaFileWriter, CPP_MetaMachineDefinition ]}

    def getWriterForLanguage(self, lang):
        return self.languageDict[lang][0]

    def getParserForLanguage(self, lang):
        return self.languageDict[lang][1]
