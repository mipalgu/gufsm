body = body_ptr.get();
nao_state = nao_state_ptr.get();
nao_state.set_chest_pressed_long(true);
nao_state_ptr.set(nao_state);

DBG(cerr << "SMButtonChest state " << state_name() << endl);
