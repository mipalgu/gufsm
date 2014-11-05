//
//EpuckFollowsLine_Variables.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
Print_t	print_ptr;	///<To display in Whiteboard
int16_t	robotID;	///<The ePuck id
WEBOTS_NXT_bridge_t	a_Command_Handler;	///<to place Webots-bridge commands in the Whiteboard
double	speedToUse;	///<the usual speed
double	rightSpeed;	///<right wheel speed
double	leftSpeed;	///<left wheel speed
int16_t	cameraWidth;	///<the ePuck camera width
CAMERA_E_PUCK_CHANNELS	theChannel;	///<to select the color to follow
double	maxSpeed;	///<ePuck maximum speed
double	delta;	///<difference between the input and output signal
