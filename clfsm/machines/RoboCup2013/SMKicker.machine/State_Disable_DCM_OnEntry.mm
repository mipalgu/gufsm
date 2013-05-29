/* Assume that the robot has just finished walking, and it is therefore safe
 * to call the kick motion. */

// Disconnect the DCM walk engine (usually unnecessary but prevents damage to robot).
wb_WalkInterface(WALK_ControlStatus(WALK_Disconnected));
