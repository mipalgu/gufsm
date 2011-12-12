parser grammar TransitionsParser;
options
{
	tokenVocab=SMLexer;
        output=AST;
}

import SMCommon;

/* WORKING!
 * A Transition file starts with {\tt T} and contains
 * one transition for each line. This constitutes the transition table
 * of the finite state machine.
 */
transitions:	( transition EOL )* ;

/*
 * A {\tt transition} is indicated by identifying the
 * source state, the predicate that labels the transition and
 * the target state.
 */
transition: state_id TAB transition_predicate TAB state_id
	-> ^( state_id transition_predicate state_id );

/*
 * a transition predicate is either a built-in transition query function,
 * a tautology, or a Whiteboard predicate
 */
transition_predicate:	function_call | whiteboard_predicate ;
