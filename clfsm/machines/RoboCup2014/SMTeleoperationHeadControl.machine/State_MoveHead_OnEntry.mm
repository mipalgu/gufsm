HAL_HeadTarget head;
head.GoToWithTime(remoteControl.headYaw(), remoteControl.headPitch());
headPtr->post(head);
currentPitch = remoteControl.headPitch();
currentYaw = remoteControl.headYaw();
