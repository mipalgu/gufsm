#ifndef CLBOUNDPROPERTY_H
#define CLBOUNDPROPERTY_H

namespace CLReflect
{
    //! A class that links a generic property to an actual machine or state property
    class CLBoundProperty
    {
    protected:
        virtual ~CLBoundProperty() = default;

    public:
        CLBoundProperty() = default;
        CLBoundProperty(CLBoundProperty const &) = default;
    };
}

#endif /* end of include guard: CLBOUNDPROPERTY_H  */
