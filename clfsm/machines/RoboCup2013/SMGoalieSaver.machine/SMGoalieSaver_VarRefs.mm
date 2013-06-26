//
// SMGoalieSaver_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
SMGoalieSaver *_m = static_cast<SMGoalieSaver *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

vec2	&previousPos = _m->previousPos;	///< 
std::vector<vec2>	&ballDifferences = _m->ballDifferences;	///< The last x differences we have found
unsigned long	&historySize = _m->historySize;	///< 
unsigned long	&headIndex = _m->headIndex;	///< Index of the 'head' of the ballDifferences array.
FilteredVisionObject	&ball_info = _m->ball_info;	///< 
FilteredBallSighting_t	&wbSighting = _m->wbSighting;	///< 
float	&interceptX = _m->interceptX;	///< What side of the robot the ball will be on if it comes in line with it.
vec2	&currentPos = _m->currentPos;	///< 
vec2	&averageDiff = _m->averageDiff;	///< Average difference vector for ball position.
MOTION_SDK_Commands_t	&wbMotion = _m->wbMotion;	///< 
MOTION_SDK_Status_t	&wbMotionStatus = _m->wbMotionStatus;	///< 
bool	&constantDirection = _m->constantDirection;	///< Has the ball been moving in a direction over the past few differences.
WALK_Status_t	&walk_status = _m->walk_status;	///< 
WALK_Command_t	&walk_post = _m->walk_post;	///< 

#pragma clang diagnostic pop
