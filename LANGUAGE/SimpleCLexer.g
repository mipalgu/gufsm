lexer grammar SimpleCLexer;

tokens
{
	INTERNALPART;
	STATENAME;
    VAR_DEF;
    ARG_DEF;
    FUNC_HDR;
    FUNC_DECL;
    FUNC_DEF;
    BLOCK;
    STATEMENT_LIST;
}

EscapeSequence:   '\\' ('b'|'t'|'n'|'f'|'r'|';'|'\"'|'\''|'\\') ;

STRING_LITERAL:  '"' STRING_GUTS '"';

fragment
STRING_GUTS:	( EscapeSequence | ~('\\'|'"') )* ;

EOL	:	'\n';

ONENTRY:	'OnEntry';

ONEXIT:		'OnExit';

K_FOR : 'for' ;
K_CHAR: 'char';
K_INT_TYPE : 'int' ;
K_BOOL 	:	 'bool';
K_EXTERN :	 'extern' ;
K_VOID: 'void';

K_ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

K_INT :	'0' | ('1'..'9') ('0'..'9')* 
    ;

K_LCURVE : '(';
K_RCURVE : ')';
K_PLUS : '+' ;
K_MINUS	: '-';
K_TIMES : '*' ;
K_DIV	: '/';
K_COMMA : ',';
K_SEMICOLON : ';';
K_LT   : '<' ;
K_GT   : '>' ;
K_EQEQ : '==' ;
K_NEQ  : '!=' ;
K_EQ   : '=' ;
K_ANDAND:	'&&';
K_OROR	:	'||';
K_NOT	:	'!'|'~';
K_LCURLY : '{';
K_RCURLY : '}';

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        { $channel=HIDDEN; }
    ;    
