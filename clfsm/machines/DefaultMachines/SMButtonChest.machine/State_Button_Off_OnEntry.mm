body = body_ptr.get();

nao_state = nao_state_ptr.get();
nao_state.set_chest_pressed(false);
nao_state.set_chest_pressed_long(false);
nao_state_ptr.set(nao_state);
