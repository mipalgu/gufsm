MOTION_SDK_Interface motion;
motion.set_head_stiffness(true);
motion.set_head_stiffness_mask(true);
motion_ptr(motion);

VisionControlStatus vision;
vision.set_selectedCamera(Bottom);
vision_ptr.set(vision);
