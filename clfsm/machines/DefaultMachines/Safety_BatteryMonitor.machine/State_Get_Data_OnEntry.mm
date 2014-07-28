{
		body_sensors = body_sensors_t.get();
		leds = leds_t.get();								leds.LEDsGroupChange(Ears, static_cast<LEDColour>((body_sensors.Battery_Charge()*10)));
		leds_t.set(leds);	
}
