body = body_ptr.get();

nao_state = nao_state_ptr.get();
nao_state.set_chest_pressed(nao_state.chest_pressed() + 1);
nao_state_ptr.set(nao_state);

#ifdef DEBUG
SENSORSLedsSensors_t leds_ptr;
SENSORSLedsSensors led = leds_ptr.get();
led.LEDsGroupChange(Chest, Green);
leds_ptr.set(led);
DBG(cerr << "SMButtonChest state " << state_name() << endl);
#endif
