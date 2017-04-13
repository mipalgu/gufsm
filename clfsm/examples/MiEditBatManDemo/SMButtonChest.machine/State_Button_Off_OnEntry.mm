body = body_ptr.get();

#ifdef DEBUG
SENSORSLedsSensors_t leds_ptr;
SENSORSLedsSensors led = leds_ptr.get();
led.LEDsGroupChange(Chest, Red);
leds_ptr.set(led);
DBG(cerr << "SMButtonChest state " << state_name() << endl);
#endif
