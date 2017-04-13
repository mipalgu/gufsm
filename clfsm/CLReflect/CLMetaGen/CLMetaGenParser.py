class CLMetaGenParser(object):

    def __init__(self, path, machineName):
        self._path = path
        self._machineName = machineName

    def parse(self):
        raise NotImplementedError("Subclass responsibility")
