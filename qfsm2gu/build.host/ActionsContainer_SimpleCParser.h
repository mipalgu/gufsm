/** \file
 *  This C header file was generated by $ANTLR version 3.4
 *
 *     -  From the grammar source file : SimpleCParser.g
 *     -                            On : 2014-10-12 07:13:11
 *     -                for the parser : ActionsContainer_SimpleCParserParser
 *
 * Editing it, at least manually, is not wise.
 *
 * C language generator and runtime by Jim Idle, jimi|hereisanat|idle|dotgoeshere|ws.
 *
 *
 * The parser 
ActionsContainer_SimpleCParser

has the callable functions (rules) shown below,
 * which will invoke the code for the associated rule in the source grammar
 * assuming that the input stream is pointing to a token/text stream that could begin
 * this rule.
 *
 * For instance if you call the first (topmost) rule in a parser grammar, you will
 * get the results of a full parse, but calling a rule half way through the grammar will
 * allow you to pass part of a full token stream to the parser, such as for syntax checking
 * in editors and so on.
 *
 * The parser entry points are called indirectly (by function pointer to function) via
 * a parser context typedef pActionsContainer_SimpleCParser, which is returned from a call to ActionsContainer_SimpleCParserNew().
 *
 * The methods in pActionsContainer_SimpleCParser are  as follows:
 *
 *  - 
 ActionsContainer_SimpleCParser_program_return
      pActionsContainer_SimpleCParser->program(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_declaration_return
      pActionsContainer_SimpleCParser->declaration(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_variable_return
      pActionsContainer_SimpleCParser->variable(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_declarator_return
      pActionsContainer_SimpleCParser->declarator(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_functionHeader_return
      pActionsContainer_SimpleCParser->functionHeader(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_formalParameter_return
      pActionsContainer_SimpleCParser->formalParameter(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_type_return
      pActionsContainer_SimpleCParser->type(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_block_return
      pActionsContainer_SimpleCParser->block(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_statement_return
      pActionsContainer_SimpleCParser->statement(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_forStat_return
      pActionsContainer_SimpleCParser->forStat(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_assignStat_return
      pActionsContainer_SimpleCParser->assignStat(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_expr_return
      pActionsContainer_SimpleCParser->expr(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_condExpr_return
      pActionsContainer_SimpleCParser->condExpr(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_orexpr_return
      pActionsContainer_SimpleCParser->orexpr(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_andexpr_return
      pActionsContainer_SimpleCParser->andexpr(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_aexpr_return
      pActionsContainer_SimpleCParser->aexpr(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_term_return
      pActionsContainer_SimpleCParser->term(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_literal_return
      pActionsContainer_SimpleCParser->literal(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_atom_return
      pActionsContainer_SimpleCParser->atom(pActionsContainer_SimpleCParser)
 *  - 
 ActionsContainer_SimpleCParser_functionCallOrVariable_return
      pActionsContainer_SimpleCParser->functionCallOrVariable(pActionsContainer_SimpleCParser)
 *
 * The return type for any particular rule is of course determined by the source
 * grammar file.
 */
// [The "BSD license"]
// Copyright (c) 2005-2009 Jim Idle, Temporal Wave LLC
// http://www.temporal-wave.com
// http://www.linkedin.com/in/jimidle
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
// 3. The name of the author may not be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#ifndef	_ActionsContainer_SimpleCParser_H
#define _ActionsContainer_SimpleCParser_H
/* =============================================================================
 * Standard antlr3 C runtime definitions
 */
#include    <antlr3.h>

/* End of standard antlr 3 runtime definitions
 * =============================================================================
 */

#ifdef __cplusplus
extern "C" {
#endif

// Forward declare the context typedef so that we can use it before it is
// properly defined. Delegators and delegates (from import statements) are
// interdependent and their context structures contain pointers to each other
// C only allows such things to be declared if you pre-declare the typedef.
//
typedef struct ActionsContainer_SimpleCParser_Ctx_struct ActionsContainer_SimpleCParser, * pActionsContainer_SimpleCParser;



#ifdef	ANTLR3_WINDOWS
// Disable: Unreferenced parameter,							- Rules with parameters that are not used
//          constant conditional,							- ANTLR realizes that a prediction is always true (synpred usually)
//          initialized but unused variable					- tree rewrite variables declared but not needed
//          Unreferenced local variable						- lexer rule declares but does not always use _type
//          potentially unitialized variable used			- retval always returned from a rule
//			unreferenced local function has been removed	- susually getTokenNames or freeScope, they can go without warnigns
//
// These are only really displayed at warning level /W4 but that is the code ideal I am aiming at
// and the codegen must generate some of these warnings by necessity, apart from 4100, which is
// usually generated when a parser rule is given a parameter that it does not use. Mostly though
// this is a matter of orthogonality hence I disable that one.
//
#pragma warning( disable : 4100 )
#pragma warning( disable : 4101 )
#pragma warning( disable : 4127 )
#pragma warning( disable : 4189 )
#pragma warning( disable : 4505 )
#pragma warning( disable : 4701 )
#endif
typedef struct ActionsContainer_SimpleCParser_program_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_program_return;



typedef struct ActionsContainer_SimpleCParser_declaration_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_declaration_return;



typedef struct ActionsContainer_SimpleCParser_variable_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_variable_return;



typedef struct ActionsContainer_SimpleCParser_declarator_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_declarator_return;



typedef struct ActionsContainer_SimpleCParser_functionHeader_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_functionHeader_return;



typedef struct ActionsContainer_SimpleCParser_formalParameter_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_formalParameter_return;



typedef struct ActionsContainer_SimpleCParser_type_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_type_return;



typedef struct ActionsContainer_SimpleCParser_block_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_block_return;



typedef struct ActionsContainer_SimpleCParser_statement_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_statement_return;



typedef struct ActionsContainer_SimpleCParser_forStat_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_forStat_return;



typedef struct ActionsContainer_SimpleCParser_assignStat_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_assignStat_return;



typedef struct ActionsContainer_SimpleCParser_expr_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_expr_return;



typedef struct ActionsContainer_SimpleCParser_condExpr_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_condExpr_return;



typedef struct ActionsContainer_SimpleCParser_orexpr_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_orexpr_return;



typedef struct ActionsContainer_SimpleCParser_andexpr_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_andexpr_return;



typedef struct ActionsContainer_SimpleCParser_aexpr_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_aexpr_return;



typedef struct ActionsContainer_SimpleCParser_term_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_term_return;



typedef struct ActionsContainer_SimpleCParser_literal_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_literal_return;



typedef struct ActionsContainer_SimpleCParser_atom_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_atom_return;



typedef struct ActionsContainer_SimpleCParser_functionCallOrVariable_return_struct
{
    /** Generic return elements for ANTLR3 rules that are not in tree parsers or returning trees
     */
    pANTLR3_COMMON_TOKEN    start;
    pANTLR3_COMMON_TOKEN    stop;
    pANTLR3_BASE_TREE	tree;

}
    ActionsContainer_SimpleCParser_functionCallOrVariable_return;




// Include delegator definition header files
//
#include	<ActionsContainerParser.h>


/** Context tracking structure for 
ActionsContainer_SimpleCParser

 */
struct ActionsContainer_SimpleCParser_Ctx_struct
{
    /** Built in ANTLR3 context tracker contains all the generic elements
     *  required for context tracking.
     */
    pANTLR3_PARSER   pParser;
	pActionsContainerParser	gActionsContainer;

     ActionsContainer_SimpleCParser_program_return
     (*program)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_declaration_return
     (*declaration)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_variable_return
     (*variable)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_declarator_return
     (*declarator)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_functionHeader_return
     (*functionHeader)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_formalParameter_return
     (*formalParameter)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_type_return
     (*type)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_block_return
     (*block)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_statement_return
     (*statement)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_forStat_return
     (*forStat)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_assignStat_return
     (*assignStat)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_expr_return
     (*expr)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_condExpr_return
     (*condExpr)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_orexpr_return
     (*orexpr)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_andexpr_return
     (*andexpr)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_aexpr_return
     (*aexpr)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_term_return
     (*term)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_literal_return
     (*literal)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_atom_return
     (*atom)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);

     ActionsContainer_SimpleCParser_functionCallOrVariable_return
     (*functionCallOrVariable)	(struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);
    // Delegated rules

    const char * (*getGrammarFileName)();
    void            (*reset)  (struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);
    void	    (*free)   (struct ActionsContainer_SimpleCParser_Ctx_struct * ctx);
/* @headerFile.members() */
pANTLR3_BASE_TREE_ADAPTOR	adaptor;
pANTLR3_VECTOR_FACTORY		vectors;
/* End @headerFile.members() */
};

// Function protoypes for the constructor functions that external translation units
// such as delegators and delegates may wish to call.
//
ANTLR3_API pActionsContainer_SimpleCParser ActionsContainer_SimpleCParserNew         (
pANTLR3_COMMON_TOKEN_STREAM
 instream, pActionsContainerParser gActionsContainer);
ANTLR3_API pActionsContainer_SimpleCParser ActionsContainer_SimpleCParserNewSSD      (
pANTLR3_COMMON_TOKEN_STREAM
 instream, pANTLR3_RECOGNIZER_SHARED_STATE state, pActionsContainerParser gActionsContainer);
extern pANTLR3_UINT8   ActionsContainerParserTokenNames[];


/** Symbolic definitions of all the tokens that the 
parser
 will work with.
 * \{
 *
 * Antlr will define EOF, but we can't use that as it it is too common in
 * in C header files and that would be confusing. There is no way to filter this out at the moment
 * so we just undef it here for now. That isn't the value we get back from C recognizers
 * anyway. We are looking for ANTLR3_TOKEN_EOF.
 */
#ifdef	EOF
#undef	EOF
#endif
#ifdef	Tokens
#undef	Tokens
#endif
#define EOF      -1
#define ARG_DEF      4
#define BLOCK      5
#define EOL      6
#define EscapeSequence      7
#define FUNC_DECL      8
#define FUNC_DEF      9
#define FUNC_HDR      10
#define INTERNALPART      11
#define K_ANDAND      12
#define K_BOOL      13
#define K_CHAR      14
#define K_COMMA      15
#define K_DIV      16
#define K_EQ      17
#define K_EQEQ      18
#define K_EXTERN      19
#define K_FOR      20
#define K_GT      21
#define K_ID      22
#define K_INT      23
#define K_INT_TYPE      24
#define K_LCURLY      25
#define K_LCURVE      26
#define K_LT      27
#define K_MINUS      28
#define K_NEQ      29
#define K_NOT      30
#define K_OROR      31
#define K_PLUS      32
#define K_RCURLY      33
#define K_RCURVE      34
#define K_SEMICOLON      35
#define K_TIMES      36
#define K_VOID      37
#define ONENTRY      38
#define ONEXIT      39
#define STATEMENT_LIST      40
#define STATENAME      41
#define STRING_GUTS      42
#define STRING_LITERAL      43
#define VAR_DEF      44
#define WS      45
#ifdef	EOF
#undef	EOF
#define	EOF	ANTLR3_TOKEN_EOF
#endif

#ifndef TOKENSOURCE
#define TOKENSOURCE(lxr) lxr->pLexer->rec->state->tokSource
#endif

/* End of token definitions for ActionsContainer_SimpleCParser
 * =============================================================================
 */
/** } */

#ifdef __cplusplus
}
#endif

#endif

/* END - Note:Keep extra line feed to satisfy UNIX systems */
