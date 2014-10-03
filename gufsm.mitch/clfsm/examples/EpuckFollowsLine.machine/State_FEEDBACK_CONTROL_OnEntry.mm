#ifdef DEBUG
std::string stateName("STATE: "); stateName+=state_name(); print_ptr(stateName);
#endif
WEBOTS_NXT_camera_t camera_data_ptr;
// the WIDTH is a property of the camera across all channels
cameraWidth = (camera_data_ptr.get()).width() ;
// second parameter of a Camera Channel is the value of the middle point
// delta is the error to the desired state, as a feedback loop control model
delta = ((camera_data_ptr.get() ).get_channel(theChannel)).secondParameter() -cameraWidth/2;
printf("Delta = %f / speedToUse = %d\n",delta,speedToUse);
// set the speeds
leftSpeed = speedToUse - (int16_t) (4*abs(delta) + 4*delta);
rightSpeed= speedToUse - (int16_t) (4*abs(delta) - 4*delta);
