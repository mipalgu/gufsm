smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber);
														newScore=smGameState.getOurScore();
nao_state = nao_state_ptr.get();
