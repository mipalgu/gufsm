#include <typeClassDefs/VisionControlStatus.h>
#include <typeClassDefs/WALK_ControlStatus.h>
#include <gu_util.h>
#include "CLMacros.h"
#include "CLWhiteboard.h"

#define POST_VISION_CONTROL(n,v) do { VisionControlStatus vision; vision.set_##n(v); visionpost(vision); } while (0)

using namespace std;
using namespace guWhiteboard;
