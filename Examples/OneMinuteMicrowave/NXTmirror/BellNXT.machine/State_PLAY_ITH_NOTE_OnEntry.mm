#ifdef DEBUG
print_ptr("PLAY_A_NOTE");
#endif


 WEBOTS_NXT_vector_bridge thetSoundCommand =a_Command_Handler.get();
thetSoundCommand.set_actuator(PLAY_SOUND,SOUND_FREQUENCY,song[currentNote]);
thetSoundCommand.set_actuator(PLAY_SOUND,SOUND_DURATION,100); 
a_Command_Handler.set(thetSoundCommand);



