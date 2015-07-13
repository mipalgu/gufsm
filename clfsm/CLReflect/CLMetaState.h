#ifndef CLMETASTATE_H
#define CLMETASTATE_H

#include "CLMetaProperty.h"

#include <memory>
#include <string>
#include <map>

namespace CLReflect
{
    class CLMetaState
    {
    protected:
            std::string _name;

            std::map< std::string, std::shared_ptr<CLMetaProperty> > _properties;

    public:
        CLMetaState() {}
        CLMetaState(std::string name) : _name(name) {}

        std::string getName() const { return _name; }

        std::shared_ptr<CLMetaProperty> getProperty(std::string propertyName);


    };
}


#endif
