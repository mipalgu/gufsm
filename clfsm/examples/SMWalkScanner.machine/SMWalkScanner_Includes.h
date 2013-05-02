#include <gugenericwhiteboardobject.h>
#include <typeClassDefs/Vision_Control.h>
#include <gu_util.h>

#define POST_VISION_CONTROL(n,v) do { VisionControlStatus vision; vision.set_##n(v); visionpost(vision); } while (0)
