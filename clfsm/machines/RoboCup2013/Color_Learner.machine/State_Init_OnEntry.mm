say("Starting color learner");

leds = leds_t.get();	
leds.LEDsGroupChange(Ears, Off);		
leds_t.set(leds);

control = 0;

filename_dlc = getenv("HOME");
filename_dlc += "/data/class.dlc";
