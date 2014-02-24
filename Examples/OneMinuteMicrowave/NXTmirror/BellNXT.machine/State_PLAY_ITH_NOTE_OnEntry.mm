#ifdef DEBUG
print_ptr("PLAY_A_NOTE");
#endif

WEBOTS_NXT_bridge 
thetMotorCommand(0,PLAY_SOUND, 500, song[currentNote],false);

//post the speed
a_Command_Handler.set(thetMotorCommand);

