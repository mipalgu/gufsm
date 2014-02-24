#ifdef DEBUG
fprintf(stderr,"STATE: %s\n",state_name()); 
#endif
// Turn On the generation of sensor data on desired toch sensor
WEBOTS_NXT_bridge a_SensorStart(0,TOUCH,RIGHT_TOUCH_SENSOR,1);
a_Command_Handler.set(a_SensorStart);

srand (time(NULL));
iSecret = rand() % 2 ;
