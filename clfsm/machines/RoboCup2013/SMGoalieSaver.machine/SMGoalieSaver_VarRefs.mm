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
int	&dd = _m->dd;	///< Change in distance.
FilteredVisionObject	&ball_info = _m->ball_info;	///< 
FilteredBallSighting_t	&wbSighting = _m->wbSighting;	///< 

#pragma clang diagnostic pop
