smGameState = aUDPReceiverNotificationType.get();
ourTeamColour = smGameState.theGScolourWePlayWith();
kickoffTeam = smGameState.theGSteamThatHasKickOf();
postGS(smGameState);
gameState = smGameState.theGSGameState();
nao_state = nao_state_ptr.get();
