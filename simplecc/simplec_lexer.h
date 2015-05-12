//
//  simplec_lexer.h
//  gufsm
//
//  Created by Rene Hexel on 28/07/12.
//  Copyright (c) 2012, 2015 Rene Hexel. All rights reserved.
//

#ifndef gufsm__simplec_lexer__
#define gufsm__simplec_lexer__

#include <string>
#include <fstream>
#include <iostream>

namespace SimpleC
{
        enum token
        {
                tok_eof = -1,           /// end of file
                tok_internalpart = -2,  /// internal part
                tok_statename = -3,     /// state name
                tok_vardef = -4,        /// variable definition
                tok_argdef = -5,        /// argument definition
                tok_funchdr = -6,       /// function header
                tok_funcdecl = -7,      /// function declaration
                tok_funcdef = -8,       /// function definition
                tok_block = -9,         /// block
                tok_statementlist = -10,/// statement list

                tok_stringliteral = -11,/// string literal
                tok_eol = -12,          /// end of line

                tok_onentry = -13,      /// 'OnEntry';
                tok_onexit = -14,       /// 'OnExit';

                tok_for = -15,          /// 'for' ;
                tok_char = -16,         /// 'char';
                tok_int = -17,          /// 'int' ;
                tok_bool = -18,         /// 'bool';
                tok_extern = -19,       /// 'extern' ;
                tok_void = -20,         /// 'void';

                tok_id = -21,           /// ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*

                tok_intval = -22,       /// '0' | ('1'..'9') ('0'..'9')*

                tok_lcurve = -23,       /// '(';
                tok_rcurve = -24,       /// ')';
                tok_plus = -25,         /// '+' ;
                tok_minus = -26,        /// '-';
                tok_times = -27,        /// '*' ;
                tok_div = -28,          /// '/';
                tok_comma = -29,        /// ',';
                tok_semicolon = -30,    /// ';';
                tok_lt = -31,           /// '<' ;
                tok_gt = -32,           /// '>' ;
                tok_eqeq = -33,         /// '==' ;
                tok_neq = -34,          /// '!=' ;
                tok_eq = -35,           /// '=' ;
                tok_andand =-36,        /// '&&';
                tok_oror = -37,         /// '||';
                tok_not = -38,          /// '!'|'~';
                tok_lcurly = -39,       /// '{';
                tok_rcurly = -40,       /// '}';
                
                tok_whitespace = -128
        };

        class lexer
        {
                std::istream *_input_stream;    /// lexer input stream
                int _last_char;                 /// last character read
                std::string _string_value;      /// string value of token
                long _long_value;               /// integer value of token
                bool _delete_ifstream;          /// do we own the input stream?

        public:
                /// designated constructor
                lexer(std::istream &is = std::cin): _input_stream(&is), _delete_ifstream(false), _last_char(' ') {}
                /// constructor to lex a file
                lexer(const char *file): _input_stream(new std::ifstream(file)), _delete_ifstream(true), _last_char(' ') {}
                /// destructor
                virtual ~lexer() { if (_delete_ifstream) delete _input_stream; }

                int get_token();                /// get the next token from the input stream
        };
}
#endif /* defined gufsm__simplec_lexer__) */
