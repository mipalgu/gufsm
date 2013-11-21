VisionControlStatus v;
v.set_selectedCamera(start_cam);
vision_ptr.set(v);

HAL_HeadTarget head;
head.GoToWithTime_rad(start_yaw, start_pitch, 500000);
head_ptr.set(head);

walk_post(WALK_Disconnect);
