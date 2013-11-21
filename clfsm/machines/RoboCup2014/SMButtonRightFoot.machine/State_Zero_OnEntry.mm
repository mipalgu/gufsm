nao_state = nao_state_ptr.get();
nao_state.set_right_foot_pressed(0);
nao_state_ptr.set(nao_state);

feet = feet_ptr.get();
DBG(cerr << "SMButtonRightFoot state " << state_name() << endl);
