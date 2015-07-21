#ifndef CLMETASTATE_H
#define CLMETASTATE_H

#include "CLMetaTransition.h"
#include "CLMetaProperty.h"

#include <memory>
#include <string>
#include <map>
#include <vector>

namespace CLReflect
{
    class CLMetaState
    {
    protected:
            std::string _name;

            std::map< std::string, std::shared_ptr<CLMetaProperty> > _properties;
            std::vector< std::shared_ptr<CLMetaTransition> > _transitions;

    public:
        CLMetaState() {}
        CLMetaState(std::string name) : _name(name) {}

        std::string getName() const { return _name; }

        void addTransition(std::shared_ptr<CLMetaTransition> trans) { _transitions.push_back(trans); }

        void addProperty(std::shared_ptr<CLMetaProperty> newProperty);

        std::shared_ptr<CLMetaProperty> getProperty(std::string propertyName);


    };
}


#endif
