import sys, re, os
from CLParser import *

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

# Setup parser
parser = CLParser(machinePath, machineName)
parser.parse()

# Get metamachine definition
