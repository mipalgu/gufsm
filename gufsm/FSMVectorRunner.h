//
//  FSMVectorRunner.h
//  
//
//  Created by René Hexel on 31/05/12.
//  Copyright (c) 2012 Rene Hexel. All rights reserved.
//

#ifndef _FSMVectorRunner_h
#define _FSMVectorRunner_h

#include <vector>
#include <string>
#include "FSMVectorFactory.h"

typedef int (*machine_runner_f)(FSM::StateMachineVectorFactory &factory, std::vector<std::string> &machine_names);

int run_machine_vector(FSM::StateMachineVectorFactory &factory, std::vector<std::string> &machine_names, machine_runner_f execute, bool verbose = false);

#endif
