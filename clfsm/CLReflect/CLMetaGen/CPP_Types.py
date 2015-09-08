from CLMetaGenConstants import *
import os

class CPP_Types(object):
    """docstring for CPP_Types"""

    def __init__(self):
        super(CPP_Types, self).__init__()
        self.types = []
        with open(CLMetaGenConstants.TYPE_FILE, 'r') as f:
            for line in f:
                self.types.append(line.strip(',\n'))
        f.close()
