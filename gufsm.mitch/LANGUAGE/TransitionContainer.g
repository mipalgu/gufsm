grammar TransitionContainer;
options
{
        output=AST;
}

import SimpleCParser, SimpleCLexer;

transitions:	  ( transition EOL* )+;

transition:	  ( state_id^ state_id expr ) ;

state_id: 	K_INT;



