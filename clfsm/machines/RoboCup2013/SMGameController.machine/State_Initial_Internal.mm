smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);
nao_state = nao_state_ptr.get();
