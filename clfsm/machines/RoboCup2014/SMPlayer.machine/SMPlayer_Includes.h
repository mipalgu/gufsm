#include <iostream>
#include <stdio.h>
#include <string>
#include <cmath>
#include "CLMacros.h"
#include "typeClassDefs/FilteredArrayOneDimBall.h"
#include <typeClassDefs/WALK_ControlStatus.h>
#include <typeClassDefs/HAL_HeadTarget.h>
#include <typeClassDefs/SENSORS_LedsSensors.h>

#include "CLWhiteboard.h"


using namespace guWhiteboard;

#define B1 ball_array.get_object(FVOBallTop)
#define B2 ball_array.get_object(FVOBallBottom)

#define NUM_SIGHTINGS 20 //check the last x num of sightings 
#define SIGHTINGS_PERCENTAGE 50 //percent of sightings in the last NUM_SIGHTINGS needed for VISIBLE to be true
#define VIS_PERCENT(b) (b.ratioOfSightings(NUM_SIGHTINGS)*100/NUM_SIGHTINGS)
#define VIS(b) (VIS_PERCENT(b) > SIGHTINGS_PERCENTAGE)
#define VISIBLE (VIS(B1) || VIS(B2))

#define BALL (B1.ratioOfSightings(NUM_SIGHTINGS) > B2.ratioOfSightings(NUM_SIGHTINGS) ? B1 : B2)
#define KICK_DIST 15

#define LED_UPDATE SENSORS_LedsSensors l = SENSORS_LedsSensors_t().get(); \
			l.LEDsGroupChange(LEye, VISIBLE ? Green : Blue);  \
			SENSORS_LedsSensors_t l_p; l_p.set(l);

//#define DEBUG
