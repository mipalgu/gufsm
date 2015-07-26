#ifndef CLMETAPROPERTY_H
#define CLMETAPROPERTY_H

#include "CLMachine.h"
#include "CLBoundProperty.h"

#include <string>
#include <memory>

namespace CLReflect
{
    //! A class that describes a property of a machine type, independent of its value
    class CLMetaProperty
    {
    protected:

        //! The name of the property
        std::string _name;

        //! The property data type
        std::string _type;

        virtual ~CLMetaProperty() {}

    public:
        std::string getType() { return _type; }

        std::string getName() { return _name; }

        virtual std::shared_ptr<CLBoundProperty> bind(FSM::CLMachine* machineInstance) = 0;

        CLMetaProperty() {}
        CLMetaProperty(std::string name, std::string type) : _name(name), _type(type) {}

    };
}




#endif /* end of include guard:CLMETAPROPERTY_H  */
