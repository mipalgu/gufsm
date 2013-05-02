// print_state_name(); 
loopCounter++;
currentSpeed = fullSpeed / max(1, maxLoop-loopCounter) ;
durationFactor = max(durationFactor,loopCounter/2); 
duration = durationFactor*minMiliseconds;
//print_int(duration);
//print_int(currentSpeed);
