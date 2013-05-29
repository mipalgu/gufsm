#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <string>
#include <sstream>
#include <cmath>
#include "CLMacros.h"
#include "gu_util.h"
#include "typeClassDefs/NAO_State.h"
#include "CLWhiteboard.h"
#include <fcntl.h>
#include <sys/stat.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"

using namespace std;
using namespace guWhiteboard;

//#define DEBUG
#define SPOKE_FILE "/tmp/spoke_ip_file"
#define TRANSITION_WAIT_TIME 20
