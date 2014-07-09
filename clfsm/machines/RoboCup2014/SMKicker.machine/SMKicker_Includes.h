#include "CLMacros.h"
#include <typeClassDefs/WALK_ControlStatus.h>
#include <typeClassDefs/MOTION_Interface.h>
#include <typeClassDefs/FilteredArrayOneDimBall.h>
#include <typeClassDefs/PARTICLE_TopPositions.h>
#include <typeClassDefs/Vision_Control.h>
#include <typeClassDefs/SENSORS_TorsoJointSensors.h>
#include <typeClassDefs/HAL_HeadTarget.h>
#include <typeClassDefs/VisionGoals.h>

#include "CLWhiteboard.h"


using namespace guWhiteboard;

#define B1 ball_array.get_object(FVOBallTop)
#define B2 ball_array.get_object(FVOBallBottom)

#define VISIBLE (B1.frameCounter() < BAD_BALL || B2.frameCounter() < BAD_BALL)
#define BALL (B1.frameCounter() < B2.frameCounter() ? B1 : B2)
