#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
ALL_TARGETS=all-machines

ROBOCUP_YEAR=2014

DEFAULT_DIR=DefaultMachines
ROBOCUP_DIR=RoboCup${ROBOCUP_YEAR}
DEMO_DIR=DemoMachines

.include "../../../../mk/mipal.mk"	# comes last!

all-machines:
.for pfix in DEFAULT ROBOCUP DEMO
	cd ${${pfix}_DIR:Q} &&				\
	${MAKE} ${MAKEFLAGS} MACHINES=${${pfix}_MACHINES:Q}
.endfor

