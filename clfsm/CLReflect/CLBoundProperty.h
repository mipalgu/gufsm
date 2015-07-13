#ifndef CLBOUNDPROPERTY_H
#define CLBOUNDPROPERTY_H

#include <string>

namespace CLReflect
{
    //! A class that links a generic property to an actual machine or state property
    class CLBoundProperty
    {
    protected:
        virtual ~CLBoundProperty() {}

    public:
        CLBoundProperty() {}

        virtual void setValue(std::string) = 0;

        virtual std::string getValue(std::string) = 0;

    };
}

#endif /* end of include guard: CLBOUNDPROPERTY_H  */
