#ifndef CLMETATRANSITION_H
#define CLMETATRANSITION_H

#include <string>

namespace CLReflect
{
    class CLMetaTransition
    {
    private:
        std::string _sourceState;
        std::string _targetState;
        std::string _expression;

    public:
        CLMetaTransition(std::string source, std::string target, std::string exp) :
            _sourceState(source), _targetState(target), _expression(exp) {}

        std::string source() const { return _sourceState; }

        std::string target() const { return _targetState; }

        std::string expression() const { return _expression; }

    };
}

#endif /* end of include guard: CLMETATRANSITION_H */
