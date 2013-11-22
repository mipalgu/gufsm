#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

VisionControlStatus aCheck;
aCheck=vision_status.get();
if (aCheck.loadCalibration()== Calibration1)
{ VisionControlStatus message;
message.set_loadCalibration(Calibration0);
vision_ptr.set(message);

	}
