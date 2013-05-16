feet = feet_ptr.get();

nao_state = nao_state_ptr.get();
nao_state.set_right_foot_pressed(nao_state.right_foot_pressed() + 1);
nao_state_ptr.set(nao_state);

DBG(cerr << "SMButtonRightFoot state " << state_name() << endl);
