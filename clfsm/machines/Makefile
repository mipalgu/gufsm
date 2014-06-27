#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
SUBDIR_TARGETS=install-local
NO_DEFAULT_DEPENDENCIES_TARGETS=yes

ROBOCUP_YEAR=2014

DEFAULT_DIR=DefaultMachines
ROBOCUP_DIR=RoboCup${ROBOCUP_YEAR}
DEMO_DIR=DemoMachines
SUBDIRS=${SRCDIR}/${DEMO_DIR} ${SRCDIR}/${ROBOCUP_DIR} ${SRCDIR}/${DEFAULT_DIR}

.include "../../../../mk/subdir.mk"	# comes last!

.include "../../../../mk/mipal.mk"	# comes last!

