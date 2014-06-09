body = body_ptr.get();

nao_state = nao_state_ptr.get();
nao_state.set_chest_pressed(true);
nao_state_ptr.set(nao_state);
