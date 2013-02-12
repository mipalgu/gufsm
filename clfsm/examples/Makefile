#
#	$Id$
#
# Makefile for pre- and cross-compiling .machine files
#
MACHINES=PingPongCLFSM BackForwardsCLFSM

ALL_TARGETS=robot-local #host-local
SOPREFIX=#empty
SKIP_COMPILING_WHITEBOARD=#defined
SKIP_COMPILING_GU_UTIL=#defined

.include "../../../../mk/prefs.mk"

.ifdef TARGET
CLFSM_WFLAGS?=-Wall -Wno-unknown-pragmas -Wno-padded -Wno-unused-variable
CLFSM_CFLAGS?=
CLFSM_LDFLAGS?=-L/usr/local/lib -Wl,-R /usr/local/lib -shared
.else
CLFSM_CFLAGS?=-stdlib=libc++
CLFSM_WFLAGS?=-Weverything -Wno-unknown-pragmas -Wno-weak-vtables -Wno-padded -Wno-unused-variable
CLFSM_LDFLAGS?=-L/usr/local/lib -rpath /usr/local/lib -shared -stdlib=libc++
.endif

CLFSM_DIR?=${GUNAO_DIR}/posix/gufsm/clfsm

all: all-real				# make sure all is the first target

.for machine in ${MACHINES}
${machine}_dir=${machine}.machine 
${machine}_bdir=${machine}.machine/${UNAME_S}-${UNAME_M}
${machine}_cppflags=-I${${machine}_dir} -I${CLFSM_DIR}
${machine}_hfiles!=cd ${${machine}_dir} && echo *.h
${machine}_sfiles=${machine}.mm
${machine}_states!=cat ${${machine}_dir}/States

.  for state in ${${machine}_states}
${machine}_sfiles+=State_${state}.mm
.  endfor


${${machine}_bdir}:
	$E${MKDIR} ${${machine}_bdir}

.  for src in ${${machine}_sfiles}
.  endfor

.  for hdr in ${${machine}_hfiles}
${machine}_hdrs+=${${machine}_dir}/${hdr}
.  endfor

.  for src in ${${machine}_sfiles}
${machine}_objs+=${${machine}_bdir}/${src:.mm=.o}
${${machine}_bdir}/${src:.mm=.o}: ${${machine}_bdir} ${${machine}_dir}/${src} ${${machine}_hdrs}
	${SAY} "compiling OC++ ${src} (${machine})"
	$E${CXX} ${${machine}_cppflags} ${CPPFLAGS} ${CFLAGS} ${CLFSM_CFLAGS} \
		${CXXLANGFL} ${CLFSM_WFLAGS} 				\
		-c -o ${${machine}_bdir}/${src:.mm=.o} ${${machine}_dir}/${src}
.  endfor
${machine}_outfile=${machine}
${machine}_outfile_LOCAL=${SOPREFIX}${${machine}_outfile}${SOEXT}
${machine}_out=${${machine}_outfile${LOCAL}}
${machine}_outpath=${${machine}_bdir}/${${machine}_out}

${${machine}_bdir}/${${machine}_out}: ${${machine}_objs}
	${SAY} "linking output ${${machine}_outpath} (${machine})"
	$E${CXX} ${SPECIFIC_OFLAGS} ${CLFSM_LDFLAGS} -o ${${machine}_outpath} ${LDFLAGS} ${${machine}_objs} ${LIBS}
.ifdef LINK_FIXUP${TARGET}
        echo $E${LINK_FIXUP${TARGET}}
.endif

all-real: ${${machine}_outpath}
.endfor

.include "../../../../mk/whiteboard.mk"	# required for whiteboard clients
.include "../../../../mk/util.mk"	# required for GU utility functions

.include "../../../../mk/mipal.mk"	# comes last!
