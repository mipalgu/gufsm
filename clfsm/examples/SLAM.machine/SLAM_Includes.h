#include <typeClassDefs/VisionControlStatus.h>
#include "typeClassDefs/NaoWalkCommand.h"
#include <typeClassDefs/HAL_HeadTarget.h>
#include <typeClassDefs/MOTION_Interface.h>
#include <typeClassDefs/SENSORSLegJointSensors.h>
#include <typeClassDefs/SensorsFootSensors.h>
#include <gu_util.h>
#include <MeasMatrix.h>
#include <Odometry.h>
#include "CLMacros.h"
#include "CLWhiteboard.h"

#define CAM_OFF 250
#define DIST_T 3000
//#define DEBUG_ODO
#define StT 0.05
#define DELAY_S 3
#define LEN 20
using namespace std;
using namespace guWhiteboard;
//#define BaseIdx (3 * (((RowIdx * (RowIdx + 1)) >> 1) + ColIdx))
