#ifdef DEBUG
print_ptr("PLAY_A_NOTE");
#endif

//get the last message, if it is a motor command repeat it
WEBOTS_NXT_bridge_t  thetStatusCommand_ptr;
    int right_speed = (thetStatusCommand_ptr.get() ).secondParameter();
    int left_speed = (thetStatusCommand_ptr.get() ).firstParameter();
   if (MOVE_MOTORS== (thetStatusCommand_ptr.get() ).theInstruction() )
   { WEBOTS_NXT_bridge 
thetMotorCommand(0,MOVE_MOTORS, left_speed,right_speed,false);
	  a_Command_Handler.set(thetMotorCommand);
    }

 WEBOTS_NXT_bridge 
thetMotorCommand(0,PLAY_SOUND, 500, song[currentNote],false);
	  a_Command_Handler.set(thetMotorCommand);


