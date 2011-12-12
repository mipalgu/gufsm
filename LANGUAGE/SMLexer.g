lexer grammar SMLexer;

tokens
{
	STATENAME;
	INTERNALPART;
}


/* WORKING!
 * here come the lexical definitions for state machine grammars
 */
EscapeSequence:   '\\' ('b'|'t'|'n'|'f'|'r'|';'|'\"'|'\''|'\\') ;

STRING_LITERAL:  '"' STRING_GUTS '"' ;

fragment
STRING_GUTS:	( EscapeSequence | ~('\\'|'"') )* ;

CPLUSPLUS:	'C++:';

ONENTRY:	'OnEntry';

ONEXIT:		'OnExit';

NEGATION:	'~' ;

COLON:		':' ;

SEMICOLON:	';' ;

SLASH:		'/' ;

BAR:		'|' ;

BRA:		'(' ;

KET:		')' ;

ID: 		('a'..'z'|'A'..'Z'|'_') ( ALNUMUNDERSCORE )* ;

INT:		'0'..'9'+ ;

TAB:		'\t' ;

EOL:		'\r'? '\n' ;

fragment
ALNUMUNDERSCORE: 'a'..'z'|'A'..'Z'|'0'..'9'|'_' ;

WHITEBOARD_SEP_CONTENT
	:	':' (' '|'\t')* WB_MSG;

fragment
WB_MSG:		( EscapeSequence | ~(';'|'/'|'\n') )* ;

WS:		' '+ {$channel=HIDDEN;} ;
