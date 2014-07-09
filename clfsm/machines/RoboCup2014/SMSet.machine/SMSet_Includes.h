#include <iostream>
#include <stdio.h>
#include <string>
#include <cmath>
#include "CLMacros.h"
#include <typeClassDefs/FilteredArrayOneDimBall.h>
#include <typeClassDefs/WALK_ControlStatus.h>
#include <typeClassDefs/HAL_HeadTarget.h>

#include "CLWhiteboard.h"


using namespace guWhiteboard;

#define B1 ball_array.get_object(FVOBallTop)
#define B2 ball_array.get_object(FVOBallBottom)
#define BAD_BALL 10 //1 sec - kalman filter value

#define VISIBLE (B1.frameCounter() < BAD_BALL || B2.frameCounter() < BAD_BALL)
#define BALL (B1.frameCounter() < B2.frameCounter() ? B1 : B2)


//#define DEBUG
