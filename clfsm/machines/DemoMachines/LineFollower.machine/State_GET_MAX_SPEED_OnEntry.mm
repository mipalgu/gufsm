WEBOTS_NXT_encoders_t encoder_data_ptr;

maxSpeed=M_PI * (encoder_data_ptr.get()).maxSpeed();

WEBOTS_NXT_bridge commandLeft(robotID,ROTATION_ENCODER,LEFT_MOTOR_DIFFERENTIAL,0);
WEBOTS_NXT_bridge commandRight(robotID,ROTATION_ENCODER,RIGHT_MOTOR_DIFFERENTIAL,0);
a_Command_Handler.set(commandLeft);
a_Command_Handler.set(commandRight);

#ifdef DEBUG
fprintf(stderr,"maxSpeed Read %f\n",maxSpeed);
#endif
