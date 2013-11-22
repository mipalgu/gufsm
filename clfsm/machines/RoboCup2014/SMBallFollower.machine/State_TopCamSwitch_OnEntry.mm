SENSORS_TorsoJointSensors_t joints_ptr;
SENSORS_TorsoJointSensors joints = joints_ptr.get();

HAL_HeadTarget head;
HAL_HeadTarget_t head_ptr;
head.GoToWithTime_rad(joints.HeadYaw(), (float)DEG2RAD(0), 500000);
head_ptr.set(head);

VisionControlStatus v;
v.set_selectedCamera(Bottom);
vision_ptr.set(v);
