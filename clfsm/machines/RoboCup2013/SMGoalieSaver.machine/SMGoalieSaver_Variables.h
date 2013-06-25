//
// SMGoalieSaver_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
vec2	previousPos;	///< 
std::vector<vec2>	ballDifferences;	///< The last x differences we have found
unsigned long	historySize;	///< 
unsigned long	headIndex;	///< Index of the 'head' of the ballDifferences array.
FilteredVisionObject	ball_info;	///< 
FilteredBallSighting_t	wbSighting;	///< 
int	interceptX;	///< What side of the robot the ball will be on if it comes in line with it.
vec2	currentPos;	///< 
vec2	averageDiff;	///< Average difference vector for ball position.
MOTION_SDK_Commands_t	wbMotion;	///< 
MOTION_SDK_Status_t	wbMotionStatus;	///< 
bool	constantDirection;	///< Has the ball been moving in a direction over the past few differences.
