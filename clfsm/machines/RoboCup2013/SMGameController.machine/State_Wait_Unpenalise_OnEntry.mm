DBG(cerr << "enter penalised " << isPenalised << " with chest button " << nao_state.chest_pressed() << " and UDP " << aUDPReceiverNotificationType.get().amIPenalized(myNumber));

isPenalised = true;
nao_state = nao_state_ptr.get();

DBG(cerr << "done enter penalised " << isPenalised << " with chest button " << nao_state.chest_pressed() << " and UDP " << aUDPReceiverNotificationType.get().amIPenalized(myNumber));
