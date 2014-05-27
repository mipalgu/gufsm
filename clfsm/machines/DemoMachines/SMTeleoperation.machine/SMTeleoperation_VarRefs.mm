//
// SMTeleoperation_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
SMTeleoperation *_m = static_cast<SMTeleoperation *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

TeleoperationControlStatus_t*	&remoteControlPtr = _m->remoteControlPtr;	///< 
TeleoperationControlStatus_t*	&localControlPtr = _m->localControlPtr;	///< 
TeleoperationControlStatus	&remoteControl = _m->remoteControl;	///< 
TeleoperationControlStatus	&localControl = _m->localControl;	///< 
MOTION_Commands_t*	&motionPtr = _m->motionPtr;	///< 
WALK_Command_t*	&walkPtr = _m->walkPtr;	///< 
WALK_Status_t*	&walkStatus = _m->walkStatus;	///< 
TeleoperationConnection_t*	&connectionPtr = _m->connectionPtr;	///< 
int	&currentConnection = _m->currentConnection;	///< 

#pragma clang diagnostic pop
