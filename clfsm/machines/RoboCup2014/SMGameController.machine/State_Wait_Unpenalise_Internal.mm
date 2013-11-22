bool penalisedThroughUDPReceiver = aUDPReceiverNotificationType.get().amIPenalized(myNumber);
isPenalised = penalisedThroughChestButton || penalisedThroughUDPReceiver;

if (penalisedThroughUDPReceiver)
{
	penalisedThroughChestButton = false;   // allow UDP receiver to un-penalise
	trustUDP = true;
}

nao_state = nao_state_ptr.get();

DBG(cerr << "pen " << isPenalised << " with chest button " << penalisedThroughChestButton << " and UDP " << penalisedThroughUDPReceiver << endl);