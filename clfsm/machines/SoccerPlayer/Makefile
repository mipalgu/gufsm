#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#

ROBOCUP_MACHINES=SMGameController SMBallFollower SMHeadBallTracker SMHeadScanner SMPlayer SMKicker SMWalkScanner SMSeeker SMSet 


MACHINES?=${ROBOCUP_MACHINES}

.include "../../../../../mk/fsm.mk"	# comes first: required for compiling state machines

SPECIFIC_CPPFLAGS+=-fblocks

.include "../../../../../mk/mipal.mk"	# comes last!
