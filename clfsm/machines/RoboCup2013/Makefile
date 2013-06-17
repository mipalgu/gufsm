#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=StateMachineStarter SMGameController SMFallManager SMBallFollower SMButtonChest SMButtonLeftFoot SMButtonRightFoot SMGetUp SMHeadBallTracker SMHeadScanner SMLeftFootControl SMPlayer SMKicker SMRobotPosition SMWalkScanner Safety_BatteryMonitor SMSeeker

.include "../../../../../mk/fsm.mk"	# comes first: required for compiling state machines

SPECIFIC_CPPFLAGS+=-fblocks

.include "../../../../../mk/mipal.mk"	# comes last!
