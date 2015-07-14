import sys, re, os

# Get machine path and name
machinePath = sys.argv[1]

extensionMatch = re.search('.+?(?=.machine)', machinePath)
if (extensionMatch):
    machinePathWithoutExtension = extensionMatch.group(0)
    machineName = os.path.split(machinePathWithoutExtension)[1]
else:
    print "Can't find file name in path: " + machinePath
    print "Exiting..."
    exit()
print "Machine path: " + machinePath
print "Machine name: " + machineName

# Setup parser

# Get metamachine definition
