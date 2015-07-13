#include "CLMetaState.h"

using namespace std;
using namespace CLReflect;

std::shared_ptr<CLMetaProperty> CLMetaState::getProperty(std::string propertyName)
{
    if (_properties.count(propertyName) == 1)
        return _properties[propertyName];
    else
        return shared_ptr<CLMetaProperty>(NULL);
}
