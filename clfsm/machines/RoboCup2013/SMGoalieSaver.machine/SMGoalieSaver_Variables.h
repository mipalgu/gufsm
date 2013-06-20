//
// SMGoalieSaver_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
vec2	previousPos;	///< 
std::vector<vec2>	ballDifferences;	///< The last x differences we have found
unsigned long	historySize;	///< 
unsigned long	headIndex;	///< Index of the 'head' of the ballDifferences array.
int	dd;	///< Change in distance.
FilteredVisionObject	ball_info;	///< 
FilteredBallSighting_t	wbSighting;	///<
