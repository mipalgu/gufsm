nao_state = nao_state_ptr.get();

sensorValues=sensorHandler.get();
sonarLeft = int ( sensorValues.sonar(Sonar::Left0));
sonarRight = int (sensorValues.sonar(Sonar::Right0));
