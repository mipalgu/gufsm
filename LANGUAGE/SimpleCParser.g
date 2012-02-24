parser grammar SimpleCParser;
options {
    output=AST;
}

tokens {
    VAR_DEF;
    ARG_DEF;
    FUNC_HDR;
    FUNC_DECL;
    FUNC_DEF;
    BLOCK;
    STATEMENT_LIST;
}

program
    :   declaration+
    ;

declaration
    :   variable
    |   functionHeader K_SEMICOLON -> ^(FUNC_DECL functionHeader)
    |   functionHeader block -> ^(FUNC_DEF functionHeader block)
    ;

variable
    :   type declarator K_SEMICOLON -> ^(VAR_DEF type declarator)
    ;

declarator
    :   K_ID 
    ;

functionHeader
    :   type K_ID K_LCURVE ( formalParameter ( K_COMMA formalParameter )* )? K_RCURVE
        -> ^(FUNC_HDR type K_ID formalParameter+)
    ;

formalParameter
    :   type declarator -> ^(ARG_DEF type declarator)
    ;

type
    :   K_INT_TYPE   
    |   K_CHAR  
    |   K_VOID
    |	K_BOOL
    |	K_EXTERN
    |   K_ID        
    ;

block
    :   lc=K_LCURLY
            variable*
            statement*
        K_RCURLY
        -> ^(BLOCK variable* ^(STATEMENT_LIST statement*))
    ;

statement: forStat
    | expr K_SEMICOLON!
    | block
    | assignStat K_SEMICOLON!
    | K_SEMICOLON!
    ;

forStat
    :   K_FOR K_LCURVE start=assignStat K_SEMICOLON expr K_SEMICOLON next=assignStat K_RCURVE block
        -> ^(K_FOR $start expr $next block)
    ;

assignStat
    :   K_ID K_EQ expr -> ^(K_EQ K_ID expr)
    ;

expr:   STRING_LITERAL | condExpr
    ;

condExpr
    :   orexpr ( (K_EQEQ^ | K_NEQ^ | K_LT^ | K_GT^ ) orexpr )?
    ;

orexpr
    :   andexpr ( (K_OROR^ ) andexpr )*
    ;

andexpr
    :   aexpr ( (K_ANDAND^ ) aexpr )*
    ;

aexpr
    :   term ( (K_PLUS^ | K_MINUS^) term )*
    ;

term
    :   literal ( (K_TIMES^ | K_DIV^) literal )*
    ;

literal	:	(K_NOT^ | K_MINUS^)? atom;

atom
    : functionCallOrVariable
    | K_INT      
    | K_LCURVE expr K_RCURVE -> expr
    ; 

functionCallOrVariable
    :   K_ID ( K_LCURVE ( expr ( K_COMMA expr )* )? K_RCURVE )?
        -> ^(K_ID expr*)
    ;
