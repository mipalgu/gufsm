/*
 *  libclfsm.cp
 *  libclfsm
 *
 *  Created by Rene Hexel on 12/10/12.
 *  Copyright (c) 2012 ICT. All rights reserved.
 *
 */

#include <iostream>
#include "libclfsm.h"
#include "libclfsmPriv.h"

void libclfsm::HelloWorld(const char * s)
{
	 libclfsmPriv *theObj = new libclfsmPriv;
	 theObj->HelloWorldPriv(s);
	 delete theObj;
};

void libclfsmPriv::HelloWorldPriv(const char * s) 
{
	std::cout << s << std::endl;
};

