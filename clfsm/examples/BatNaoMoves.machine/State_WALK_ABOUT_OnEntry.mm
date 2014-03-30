#ifdef DEBUG
fprintf(stderr, "STATE: %s\n", state_name());
#endif

nao_state = nao_state_ptr.get();

motion_ptr.set(MOTION_Commands(true,true,true));

walk_post(WALK_Ready); protected_msleep(15);
walk_post(WALK_ControlStatus(WALK_Run, 35, 0, 0, 5));

sensorValues=sensorHandler.get();
sonarLeft = int ( sensorValues.sonar(Sonar::Left0));
sonarRight = int (sensorValues.sonar(Sonar::Right0));
#ifdef DEBUG
fprintf(stderr, "LEFT: %d    RIGHT %d\n", sonarLeft, sonarRight);
#endif
