#
#	$Id$
#
# clfsm Makefile
#
ALL_TARGETS=build-host build-robot do-catkin

all: all-real

host: build-host

robot: build-robot

.include "../../../mk/c++11.mk"         # use C++11
.include "../../../mk/whiteboard.mk"	# not really, but for catkin

copy-stuff:
	mkdir -p ${BUILDDIR}
	rm -rf ${BUILDDIR}/${BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${BUILDDIR}
	cp -p *.c* *.h ${BUILDDIR}
	cp -p Makefile.in ${BUILDDIR}/Makefile
	cd ${BUILDDIR} && ln -s . ${BUILDDIR}

build-host: copy-stuff
	cd ${BUILDDIR} && ${MAKE} host

build-robot:
	mkdir -p ${DEFAULT_TARGET_BUILDDIR}
	rm -rf ${DEFAULT_TARGET_BUILDDIR}/${DEFAULT_TARGET_BUILDDIR}
	cp -p ../gufsm/*.c*  ../gufsm/*.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p *.c* *.h ${DEFAULT_TARGET_BUILDDIR}
	cp -p Makefile.in ${DEFAULT_TARGET_BUILDDIR}/Makefile
	cd ${DEFAULT_TARGET_BUILDDIR} && ln -s . ${DEFAULT_TARGET_BUILDDIR}
	cd ${DEFAULT_TARGET_BUILDDIR} && ${MAKE} robot

do-catkin: copy-stuff
	cd ${BUILDDIR} && ln -fs ${CATKIN_TEMPLATE} ${BUILDDIR}
	cd ${BUILDDIR} && ${MAKE} catkin

.include "../../../mk/mipal.mk"		# comes last!
