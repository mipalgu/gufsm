#
#	$Id$
#
# GU localisation module Makefile
#
ALL_TARGETS=copy-and-build

.include "../../../mk/mipal.mk"		# comes last!

copy-and-build:
	mkdir -p ${BUILDDIR}
	cp -p ../gufsm/*.[ch]* ${BUILDDIR}
	cp -p *.c* *.h ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ${MAKE} host
