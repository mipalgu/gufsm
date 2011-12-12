grammar ActionsContainer;
options
{
        output=AST;
}

import SimpleCParser, SimpleCLexer;

actions:	( state_description EOL* )+ ;

state_description :	state_id state_name EOL description 
	-> ^( state_id ^( STATENAME ( state_name )* ) description );

description:	onEntry_part onExit_part internal_part ;

onEntry_part:	 ONENTRY^ block EOL  ;

onExit_part:	 ONEXIT^ block EOL  ;

internal_part:	block -> ^( INTERNALPART block ) ;

state_name:	 K_ID;

state_id: 	K_INT;




