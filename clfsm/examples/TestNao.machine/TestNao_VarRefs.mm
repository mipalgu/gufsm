//
// TestNao_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
TestNao *_m = static_cast<TestNao *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

QSay_t	&say = _m->say;	///< 
SENSORSSonarSensors_t	&sensorHandler = _m->sensorHandler;	///< 
SENSORSSonarSensors	&sensorValues = _m->sensorValues;	///< 
MOTION_Status_t	&motion_status_handler = _m->motion_status_handler;	///< 
MOTION_Commands_t	&motion_ptr = _m->motion_ptr;	///< 

#pragma clang diagnostic pop
