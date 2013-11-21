#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

shortDistanceToBall = true;

VisionControlStatus aCheck;
aCheck=vision_status.get();
if (aCheck.loadCalibration()== Calibration0)
{ VisionControlStatus message;
message.set_loadCalibration(Calibration1);
vision_ptr.set(message);

	}
