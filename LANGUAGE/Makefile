BIN=grammar_test
DOC=grammar_doc.pdf

C_SRCS=grammar_test.c parse_actions.c parse_transitions.c
HDRS=parse_actions.h parse_transitions.h

ALL_TARGETS=${DOC} host
TEST_TARGETS=test-grammar

CLEAN_FILES+=${DOC}

ANTLR_SRCS=
#ANTLR_SRCS=TransitionContainer.g ActionsContainer.g
#ANTLR_SRCS=Java.g
ANTLR_COMBINED=TransitionContainer.g ActionsContainer.g
ANTLR_INCLUDES=SimpleCParser.g
ANTLR_GRAMMARS=SimpleCLexer.g

TEX_MAIN=grammar_doc.tex
TEX_MODS=transitions.tex actions.tex
TEX_SRCS=${TEX_MAIN} ${TEX_MODS}
EPS_SRCS=classfsmTransition.eps classfsmSubMachine.eps

.include "../../../mk/antlr.mk"

test: test-grammar
	${SAY} "All tests passed!"

.include "../../../mk/mipal.mk"

grammar_doc.pdf: ${TEX_SRCS} ${EPS_SRCS}

test-grammar: ${ALL_TARGETS}
	$E${BUILDDIR}/${BIN} testfiles/T*.txt				\
		>${BUILDDIR}/T.out 2>${BUILDDIR}/T.err
	$E${BUILDDIR}/${BIN} testfiles/A*.txt				\
		>${BUILDDIR}/A.out 2>${BUILDDIR}/A.err
	$Eif diff -bu testfiles/T.out ${BUILDDIR}/T.out ; then		\
		echo "T file tests passed!" ;				\
	else								\
		echo "For more information, try:" ;			\
		echo "  diff -bu testfiles/T.err ${BUILDDIR}/T.err" ;	\
		echo "" ;						\
		echo "*** T files failed test!" ; exit 1 ;		\
	fi
	$Eif diff -bu testfiles/A.out ${BUILDDIR}/A.out ; then		\
		echo "A file tests passed!" ;				\
	else								\
		echo "For more information, try:" ;			\
		echo "  diff -bu testfiles/A.err ${BUILDDIR}/A.err" ;	\
		echo "" ;						\
		echo "*** A files failed test!" ; exit 1 ;		\
	fi
