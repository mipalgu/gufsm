#include "CLReflectionSystem.h"

using namespace std;
using namespace CLReflect;

static CLReflectionSystem* _instance;

CLReflectionSystem::CLReflectionSystem()
{
    _metaStore = shared_ptr<CLMetaRegister>(new CLMetaRegister());
}

CLReflectionSystem* CLReflectionSystem::getInstance()
{
    if (_instance == NULL)
        _instance = new CLReflectionSystem();
    return _instance;
}
