bool penalisedThroughUDPReceiver = aUDPReceiverNotificationType.get().amIPenalized(myNumber);
isPenalised = penalisedThroughChestButton || penalisedThroughUDPReceiver;

if (penalisedThroughUDPReceiver) penalisedThroughChestButton = false;   // allow UDP receiver to un-penalise

nao_state = nao_state_ptr.get();

DBG(cerr << "penalised is " << isPenalised << " with chest button " << penalisedThroughChestButton << " and UDP " << penalisedThroughUDPReceiver);
