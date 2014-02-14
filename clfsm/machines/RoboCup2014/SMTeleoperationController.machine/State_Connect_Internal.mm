int tmp = connectionPtr->get();
if(tmp >= 0) {
	gu_simple_whiteboard_descriptor* remoteWhiteboard = gswr_new_whiteboard(tmp);
	remoteControlPtr = new TeleoperationControlStatus_t(remoteWhiteboard);
}
