//
//EpuckFollowsLine_Variables.h
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
Print_t	print_ptr;	///<To display the whiteboard
int16_t	robotID;	///<The ePuck id
WEBOTS_NXT_bridge_t	a_Command_Handler;	///<to place Webots-bridge commands in the whiteboard
int16_t	speedToUse;	///<the usual speed
int16_t	rightSpeed;	///<right wheel speed
int16_t	leftSpeed;	///<left wheel speed
int16_t	cameraWidth;	///<the ePuck camera width
CAMERA_E_PUCK_CHANNELS	theChannel;	///<to select the color
int16_t	maxSpeed;	///<ePuck maximum speed
float	delta;	///<difference between input and output signal
