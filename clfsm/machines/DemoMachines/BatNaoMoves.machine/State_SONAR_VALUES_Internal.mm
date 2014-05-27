sensorValues=sensorHandler.get();
sonarLeft = int ( sensorValues.sonar(Sonar::Left0));
sonarRight = int (sensorValues.sonar(Sonar::Right0));
#ifdef DEBUG
fprintf(stderr, "LEFT: %d    RIGHT %d\n", sonarLeft, sonarRight);
#endif
