import sys, re, os
from CPP_Parser import *
from CPP_MetaMachineDefinition import *
from CLMetaGenDependencies import *


# Get machine path, name and language
machinePath = sys.argv[1]
language = sys.argv[2]

extensionMatch = re.search('.+?(?=.machine)', machinePath) #get path without .machine extension
if (extensionMatch):
    machinePathWithoutExtension = extensionMatch.group(0)
    machineName = os.path.split(machinePathWithoutExtension)[1]
else:
    print "Can't find file name in path: " + machinePath
    print "Exiting..."
    exit()

# Setup parser and create metamachine defintion
depManager = CLMetaGenDependencies()
ParserClass = depManager.getParserForLanguage(language)
parser = ParserClass(machinePath, machineName)
metaMachineDef = parser.parse()
WriterClass = depManager.getWriterForLanguage(language)
writer = WriterClass(metaMachineDef)
writer.write()

# print filename
print os.path.split(writer.filename)[1]
