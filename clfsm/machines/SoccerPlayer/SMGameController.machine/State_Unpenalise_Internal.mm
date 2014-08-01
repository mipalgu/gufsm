controlstatus = walk_status();
odo_forward = controlstatus.odometry().forward;

resetParticleFilter(numberOfPenalties == 1 ? PF_Manual_Placement : PF_After_Penalized);
