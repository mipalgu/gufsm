#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat-pedantic"

walk_post(WALK_Ready); protected_msleep(15); walk_post(WALK_ControlStatus(WALK_Run, 100, 0, 0, 100)); // engage DCM, walk a metre XXX: stalls all machines!

#pragma clang diagnostic pop

controlstatus = walk_status();
odo_forward = controlstatus.odometry().forward;
