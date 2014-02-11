gu_simple_whiteboard_descriptor* remoteWhiteboard = gswr_new_whiteboard(4);
remoteControlPtr = new TeleoperationControlStatus_t(remoteWhiteboard);
motionPtr = new MOTION_Commands_t();
walkPtr = new WALK_Command_t();
walkStatus = new WALK_Status_t();

remoteControl = remoteControlPtr->get();
