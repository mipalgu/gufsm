#
#	$Id$
#
# clfsm Makefile
#
ALL_TARGETS=copy-and-build

.include "../../../mk/mipal.mk"		# comes last!

copy-and-build:
	mkdir -p ${BUILDDIR}
	rm -rf ${BUILDDIR}/${BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${BUILDDIR}
	cp -p *.c* *.h ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ln -s . ${BUILDDIR}
	cd ${BUILDDIR} && ${MAKE} host
