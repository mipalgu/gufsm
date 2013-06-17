say("Starting color learner");

//suspend("Color_Learner_Kick");
//suspend_all();

leds = leds_t.get();	
leds.LEDsGroupChange(Ears, Off);		
leds_t.set(leds);

control = 0;

filename_dlc = getenv("HOME");
filename_dlc += "/data/class.dlc";
