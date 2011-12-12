parser grammar ActionsParser;
options
{
	tokenVocab=SMLexer;
        output=AST;
}

import SMCommon;

/*
 * An actions file starts with {\tt A} and contains
 * one state description for each line. This constitutes the list of states 
 * of the finite state machine. The initial state is the last one listed
 */
actions:	( state_description EOL )+ ;


/*
 * {\tt state\_description} is 
 * a state id (currently a number) and a tab, followed
 * by an optional state name (convention is all upper case)
 * and a bar. It finished with a {\tt description}.
 */
state_description:	state_id TAB ( state_name BAR )* description
	-> ^( state_id ^( STATENAME ( state_name )* ) description );


/*
 * A {\tt description} is intended to describe the behaviour of a state. 
 * Currently , the {\tt onEntry\_part} and the
 * {\tt onExit\_part} will always be executed exactly once.
 * The {\tt onEntry\_part}  before anything, while
 * the {\tt onExit\_part} after anything.
 * The {\tt internal\_part} will only be executed after all
 * exiting transitions have evaluated and not fired.
 */
description:	onEntry_part onExit_part internal_part ;


/*
 * All parts can be empty, but the
 * {\tt onExit\_part} and 
 * the {\tt onEntry\_part} must be terminated by {\tt /}.
 */
onEntry_part:	( ONENTRY^ description_list SLASH )? ;

onExit_part:	( ONEXIT^ description_list SLASH )? ;

internal_part:	description_list -> ^( INTERNALPART description_list ) ;

/*
 * A {\tt description\_list} could be empty. All postings
 * messages go before any call to a executable procedure, because for this
 * one there should be only one.
 */
description_list:	( whiteboard_message SEMICOLON )* ( procedure_call SEMICOLON )? ;

/* 
 * A message will be posted to the whiteboard. The message
 * type is compulsory, but the content is optional; in which case
 * it will be considered an empty string.
 */
whiteboard_message:	message_type ( whiteboard_separated_content )?
	-> ^( message_type whiteboard_separated_content );

/*
 * A {\tt procedure\_call} is used to embed code in the finite state machine.
 * Currently only C++ is implemented, and the {\tt procedure\_invocation} must
 * be compiled with the finite state machine.
 */
procedure_call:	CPLUSPLUS procedure_invocation
	-> ^( CPLUSPLUS procedure_invocation );
