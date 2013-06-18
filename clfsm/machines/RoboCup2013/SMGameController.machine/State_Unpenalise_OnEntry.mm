walk_post(WALK_Ready); protected_msleep(15); walk_post(WALK_ControlStatus(WALK_Run, 100, 0, 0, 100)); // engage DCM, walk a metre XXX: stalls all machines!

controlstatus = walk_status();
odo_forward = controlstatus.odometry().forward;
