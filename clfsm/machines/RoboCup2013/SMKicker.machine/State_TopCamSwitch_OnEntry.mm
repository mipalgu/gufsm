SENSORS_TorsoJointSensors joints = head_pitch_ptr.get();
start_pitch = joints.HeadPitch();
start_yaw = joints.HeadYaw();

HAL_HeadTarget head;
head.GoToWithTime_rad(start_yaw, (float)DEG2RAD(0), 500000);
head_ptr.set(head);

start_cam = vision_status_ptr.get().selectedCamera();

VisionControlStatus v;
v.set_selectedCamera(Top);
vision_ptr.set(v);
