#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
#MACHINES=PingPongCLFSM SMHeadGoalTracker SMHeadScannerGoal SMPlayerGoal SMWalkScannerGoal SMPlayerGoal TestNao
#MACHINES=TestNao BatNaoMoves
#MACHINES=BatNaoMoves BatManController FallManager RobotPosition GetUp ButtonChest
MACHINES=PingPongCLFSM

.include "${GUNAO_DIR}/mk/fsm.mk"	# comes first: required for compiling state machines

.include "${GUNAO_DIR}/mk/mipal.mk"	# comes last!
