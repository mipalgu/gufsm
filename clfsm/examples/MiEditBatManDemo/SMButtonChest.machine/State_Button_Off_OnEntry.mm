body = body_ptr.get();

#ifdef DEBUG
SENSORS_LedsSensors_t leds_ptr;
SENSORS_LedsSensors led = leds_ptr.get();
led.LEDsGroupChange(Chest, Red);
leds_ptr.set(led);
DBG(cerr << "SMButtonChest state " << state_name() << endl);
#endif
