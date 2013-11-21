//
// Safety_BatteryMonitor_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
Safety_BatteryMonitor *_m = static_cast<Safety_BatteryMonitor *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SENSORS_LedsSensors	&leds = _m->leds;	///< LED Change
SENSORS_LedsSensors_t	&leds_t = _m->leds_t;	///< LEDs WB Ptr
SENSORS_BodySensors	&body_sensors = _m->body_sensors;	///< For reading the battery values
SENSORS_BodySensors_t	&body_sensors_t = _m->body_sensors_t;	///< Body sensors wb ptr

#pragma clang diagnostic pop
