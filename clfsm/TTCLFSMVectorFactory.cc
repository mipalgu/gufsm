/*
 * TTCLFSMVectorFactory.cc
 * Copyright (C) 2018 Morgan McColl <Morgan McColl@morgan-X550LD>
 *
 * Distributed under terms of the MIT license.
 */

#include "TTCLFSMVectorFactory.h"

using namespace FSM;

bool TTCLFSMVectorFactory::executeOnce(visitor_f should_execute_machine, void *context)
{
    return fsms()->executeOnce(should_execute_machine, context);
}
