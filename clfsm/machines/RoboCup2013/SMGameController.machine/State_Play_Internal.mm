smGameState = aUDPReceiverNotificationType.get();
postGS(smGameState);
gameState = smGameState.theGSGameState();
isPenalised = smGameState.amIPenalized(myNumber) && smGameState.myPenaltyIs(myNumber) != ManualButtonPenalty;
														newScore=smGameState.getOurScore();
nao_state = nao_state_ptr.get();

if (!trustUDP) trustUDP = gameState == Playing;
