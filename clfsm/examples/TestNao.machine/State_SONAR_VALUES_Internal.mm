sensorValues=sensorHandler.get();
int newLeft = int ( sensorValues.sonar(Sonar::Left0));
int newRight = int (sensorValues.sonar(Sonar::Right0));
#ifdef DEBUG
fprintf(stderr, "LEFT: %d    RIGHT %d\n", newLeft, newRight);
#endif
