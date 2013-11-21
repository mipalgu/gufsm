#ifdef DEBUG
fprintf(stderr, "State: %s\n", state_name());
#endif

VisionControlStatus vision;
vision.set_selectedCamera(Bottom);
vision_ptr.set(vision);
