//
//EpuckFollowsLine_VarRefs.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
EpuckFollowsLine *_m = static_cast<EpuckFollowsLine *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

Print_t	&print_ptr= _m->print_ptr;	///<To display the whiteboard
int16_t	&robotID= _m->robotID;	///<The ePuck id
WEBOTS_NXT_bridge_t	&a_Command_Handler= _m->a_Command_Handler;	///<to place Webots-bridge commands in the whiteboard
int16_t	&speedToUse= _m->speedToUse;	///<the usual speed
int16_t	&rightSpeed= _m->rightSpeed;	///<right wheel speed
int16_t	&leftSpeed= _m->leftSpeed;	///<left wheel speed
int16_t	&cameraWidth= _m->cameraWidth;	///<the ePuck camera width
CAMERA_E_PUCK_CHANNELS	&theChannel= _m->theChannel;	///<to select the color
int16_t	&maxSpeed= _m->maxSpeed;	///<ePuck maximum speed
float	&delta= _m->delta;	///<difference between input and output signal

#pragma clang diagnostic pop
