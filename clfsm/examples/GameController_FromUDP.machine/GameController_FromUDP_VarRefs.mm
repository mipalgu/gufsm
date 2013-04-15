//
// GameController_FromUDP_VarRefs.mm -- 2013-04-15 05:10:33 +0000
//
// Automatically created through MiCASE -- do not change manually!
//
GameController_FromUDP *_m = static_cast<GameController_FromUDP *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SENSORS_LedsSensors	&leds = _m->leds;	///< LED Change
SENSORS_LedsSensors_t	&leds_t = _m->leds_t;	///< LEDs WB Ptr
SENSORS_BodySensors	&body_sensors = _m->body_sensors;	///< For reading the battery values
SENSORS_BodySensors_t	&body_sensors_t = _m->body_sensors_t;	///< Body sensors wb ptr
int	&a = _m->a;	///< 

#pragma clang diagnostic pop
