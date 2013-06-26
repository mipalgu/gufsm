//
// SMGameController_Variables.h
//
// Automatically created through MiCASE -- do not change manually!
//
int	myNumber;	///< 
PlayerNumber_t	thePlayerNumberOnTheBack;	///< 
GCGameState_t	postGS;	///< 
GCGameState	smGameState;	///< 
UDPRN_t	aUDPReceiverNotificationType;	///< The UDP message is collected here
int	ourScore;	///< 
int	newScore;	///< 
int	theirScore;	///< 
bool	penalisedThroughChestButton;	///< 
bool	isPenalised;	///< 
GameState	gameState;	///< 
QSay_t	say;	///< 
NAO_State	nao_state;	///< 
NAO_State_t	nao_state_ptr;	///< 
enum TeamColours	kickoffTeam;	///< 
enum TeamColours	ourTeamColour;	///< 
SENSORS_LedsSensors_t	leds;	///< 
MOTION_SDK_Commands_t	motion_ptr;	///< 
MOTION_SDK_Status_t	motion_status;	///< 
WALK_Command_t	walk_post;	///< 
WALK_Status_t	walk_status;	///< 
WALK_ControlStatus	controlstatus;	///< 
float	odo_forward;	///< 
float	odo_start;	///< 
int	numberOfPenalties;	///< 
PF_ControlStatus_Modes_t	resetParticleFilter;	///< 
bool	trustUDP;	///< 
bool	readyFromInitial;	///<
