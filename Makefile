#
#	$Id$
#
# Global Makefile
#
SUBDIRS=gufsm

SUBDIR_TARGETS=clean host robot doc

ALL_TARGETS=show-all-dependencies
S?=

NO_DEFAULT_DEPENDENCIES_TARGETS=yes

.include "../../mk/subdir.mk"		# required for meta-makefiles

show-all-dependencies:
	${SAY} "${SRCDIR} show-all-dependencies"

pre-targets:
