#
#	$Id$
#
BIN=qfsm2gu
MAN=${BIN}

.ifdef GNUSTEP_MAKEFILES
ALL_TARGETS=do-build
.else
ALL_TARGETS=host
.endif

UTIL_DIR=${GUNAO_DIR}/posix/guwhiteboard/objc/Classes
CPPFLAGS=-I${UTIL_DIR}

SPECIFIC_LIBS+=-framework Foundation

C_SRCS=syntax_check.c
UTIL_SRCS=NSString+MixedCase.m NSMutableArray+Stack.m
UTIL_HDRS=${UTIL_SRCS:.m=.h}
OBJC_SRCS=QFSMElement.m QFSMExporter.m QFSMParser.m main.m ${UTIL_SRCS}
HDRS=syntax_check.h QFSMElement.h QFSMExporter.h QFSMParser.h

ANTLR_COMBINED=TransitionContainer.g ActionsContainer.g
ANTLR_INCLUDES=SimpleCParser.g
ANTLR_GRAMMARS=SimpleCLexer.g
#ANTLR_LANGUAGES=ObjC	# ObjC is broken in antlr-3.4, use plain C

.include "../../../mk/prefs.mk"

all: link-utils ${ALL_TARGETS}

.include "../../../mk/antlr.mk"		# required for grammar parsing

${BUILDDIR}/GNUmakefile: link-utils GNUmakefile.in
	mkdir -p ${BUILDDIR}
	( cd ${BUILDDIR} && ln -fs ../*.[mh] . )
	sed -e 's^OBJCINC^-I`find /usr/lib/gcc -name include -type d | sort -r | head -n1`^g' -e 's^BSDLIB^`[ ! -e /usr/lib/libbsd.a ] || echo "-lbsd"`^g' GNUmakefile.in > ${BUILDDIR}/GNUmakefile

do-build: ${BUILDDIR}/GNUmakefile
	cd ${BUILDDIR} && ${GMAKE} ${GMAKEFLAGS} CC=${HOST_CC} CXX=${HOST_CXX}

link-utils:
.for file in ${UTIL_SRCS} ${UTIL_HDRS}
	$Eln -s ${UTIL_DIR}/${file} . 2>/dev/null || true
.endfor

.include "../../../mk/mipal.mk"
