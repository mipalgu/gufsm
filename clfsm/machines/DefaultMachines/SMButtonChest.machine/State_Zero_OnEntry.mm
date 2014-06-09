nao_state = nao_state_ptr.get();
nao_state.set_chest_pressed(false);
nao_state_ptr.set(nao_state);

body = body_ptr.get();
DBG(cerr << "SMButtonChest state " << state_name() << endl);
