//
//LineFollower_VarRefs.mm
//
//Automatically created through MiEditCLFSM -- do not change manually!
//
LineFollower *_m = static_cast<LineFollower *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

Say_t	&print_ptr= _m->print_ptr;	///<To display in whiteboard
int	&robotID= _m->robotID;	///<The ePuck id
WEBOTS_NXT_bridge_t	&a_Command_Handler= _m->a_Command_Handler;	///<to palce Webots-bridge commands in the whiteboard
int	&speedToUse= _m->speedToUse;	///<the usual spped
int	&rightSpeed= _m->rightSpeed;	///<right wheel speed
int	&leftSpeed= _m->leftSpeed;	///<left wheel speed
int	&cameraWidth= _m->cameraWidth;	///<the ePuck camera width
CAMERA_E_PUCK_CHANNELS	&theChannel= _m->theChannel;	///<to select the color
float	&maxSpeed= _m->maxSpeed;	///<ePuck maximum speed
int	&delta= _m->delta;	///<difference between input and output signal

#pragma clang diagnostic pop
