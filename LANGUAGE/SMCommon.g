parser grammar SMCommon;

/* WORKING!
 * common defititions for state machine grammars
 */

options
{
	tokenVocab=SMLexer;
        output=AST;
}

/*
 * a function is an ID followed by a parameter in backets
 */
function_call:	func_name BRA func_parameter KET
	-> ^( func_name func_parameter );

func_name:	ID;

func_parameter:	INT | STRING_LITERAL;

/*
 * A {\tt procedure\_invocation} is used to invoke a procedure in code in the
 * finite state machine.
 */
procedure_invocation:	func_name ( BRA func_parameter KET )?
	-> ^( func_name func_parameter );

/*
 * a whiteboard predicate is an ID that is possibly negated
 */
whiteboard_predicate:	NEGATION? ID ;

/*
 * A state_id is currently only an integer.
 * In a future implementation, it should optionally also be a name.
 */
state_id: 	INT;

/*
 * a state name and message type can be any valid ID
 */
state_name:	ID ;

message_type:	 ID ;

/*
 * whiteboard content is separated from the message with a colon
 */
whiteboard_separated_content
	:	WHITEBOARD_SEP_CONTENT;

