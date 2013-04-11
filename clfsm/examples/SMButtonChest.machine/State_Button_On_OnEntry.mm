#ifdef DEBUG
SENSORS_LedsSensors_t leds_ptr;
SENSORS_LedsSensors led = leds_ptr.get();
led.LEDsGroupChange(Chest, Green);
leds_ptr.set(led);
#endif

nao_state = nao_state_ptr.get();
nao_state.set_Chest_Pressed(true);
nao_state_ptr.set(nao_state);
