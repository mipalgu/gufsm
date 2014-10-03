#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=BatManController BatNaoMoves FallManager GetUp RobotPosition SMButtonChest

.include "../../../../../mk/fsm.mk"	# comes first: required for compiling state machines

SPECIFIC_CPPFLAGS+=-fblocks

.include "../../../../../mk/mipal.mk"	# comes last!
