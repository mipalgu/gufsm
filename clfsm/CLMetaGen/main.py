import sys, re, os
from Parser import *
from MetaMachineDefinition import *
from MetaFileWriter import *
from MachinePropertyFileWriter import *

# Get machine path and name
machinePath = sys.argv[1]

extensionMatch = re.search('.+?(?=.machine)', machinePath) #get path without .machine extension
if (extensionMatch):
    machinePathWithoutExtension = extensionMatch.group(0)
    machineName = os.path.split(machinePathWithoutExtension)[1]
else:
    print "Can't find file name in path: " + machinePath
    print "Exiting..."
    exit()

# Setup parser and create metamachine defintion
parser = Parser(machinePath, machineName)
metaMachineDef = parser.parse()

# Write main header and implementation file
mainFileWriter = MetaFileWriter(metaMachineDef)
mainFileWriter.write()

#Write machine property writer
machPropWriter = MachinePropertyFileWriter(metaMachineDef)
machPropWriter.write()
