#include <iostream>
#include <stdio.h>
#include <string>
#include <cmath>
#include "CLMacros.h"
#include <gu_util.h>
#include "typeClassDefs/FilteredArrayOneDimBall.h"
#include "typeClassDefs/SENSORS_TorsoJointSensors.h"
#include "typeClassDefs/WALK_ControlStatus.h"
#include "typeClassDefs/Vision_Control.h"
#include "typeClassDefs/HAL_HeadTarget.h"


#include "CLWhiteboard.h"


using namespace guWhiteboard;

#define B1 ball_array.get_object(FVOBallTop)
#define B2 ball_array.get_object(FVOBallBottom)

#define NUM_SIGHTINGS 20 //check the last x num of sightings 
#define BALL (B1.ratioOfSightings(NUM_SIGHTINGS) > B2.ratioOfSightings(NUM_SIGHTINGS) ? B1 : B2)

