feet = feet_ptr.get();
nao_state = nao_state_ptr.get();
nao_state.set_right_foot_pressed_long(true);
nao_state_ptr.set(nao_state);

DBG(cerr << "SMButtonRightFoot state " << state_name() << endl);
