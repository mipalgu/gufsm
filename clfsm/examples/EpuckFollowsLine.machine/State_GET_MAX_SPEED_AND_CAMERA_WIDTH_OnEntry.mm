#ifdef DEBUG
std::string stateName("STATE: ");
stateName+=state_name();
print_ptr(stateName);
#endif
WEBOTS_NXT_encoders_t encoder_data_ptr;
maxSpeed=M_PI * (encoder_data_ptr.get()).maxSpeed();
#ifdef DEBUG
fprintf(stderr,"maxSpeed Read %f\n",maxSpeed);
#endif
