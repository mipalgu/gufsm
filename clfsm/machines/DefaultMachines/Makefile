#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#

DEFAULT_MACHINES=StateMachineStarter SMFallManager SMButtonChest SMButtonLeftFoot SMButtonRightFoot SMGetUp SMRobotPosition Safety_BatteryMonitor SMSayIP SMShutdown 


MACHINES?=${DEFAULT_MACHINES}

.include "../../../../../mk/fsm.mk"	# comes first: required for compiling state machines

SPECIFIC_CPPFLAGS+=-fblocks

.include "../../../../../mk/mipal.mk"	# comes last!
