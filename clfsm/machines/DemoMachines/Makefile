#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#

DEMO_MACHINES=SMLeapController SMSoundStartStop SMSoundWhistle SMSoundDemo SMTeleoperationController SMTeleoperationHeadControl SMTeleoperation BatNaoMoves StopMotionRecorder


MACHINES?=${DEMO_MACHINES}

.include "../../../../../mk/fsm.mk"	# comes first: required for compiling state machines

SPECIFIC_CPPFLAGS+=-fblocks

.include "../../../../../mk/mipal.mk"	# comes last!
