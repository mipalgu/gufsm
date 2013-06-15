#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif


ball = sightings_ptr.get();




restart("SMHeadScanner");
restart("SMWalkScanner");

QSay_t say;
say("Seek");
