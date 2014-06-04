TeleoperationConnection_t* connectionPtr = new TeleoperationConnection_t();
gu_simple_whiteboard_descriptor* remoteWhiteboard = gswr_new_whiteboard(connectionPtr->get());
remoteControlPtr = new TeleoperationControlStatus_t(remoteWhiteboard);
headPtr = new HAL_HeadTarget_t();
motionPtr = new MOTION_Commands_t();

remoteControl = remoteControlPtr->get();

currentYaw = 0.0f;
currentPitch = 0.0f;
