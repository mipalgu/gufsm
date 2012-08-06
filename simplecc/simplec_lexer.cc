//
//  simplec_lexer.cc
//  gufsm
//
//  Created by Rene Hexel on 28/07/12.
//  Copyright (c) 2012 Rene Hexel. All rights reserved.
//
#include <cctype>
#include "simplec_lexer.h"

using namespace std;
using namespace SimpleC;

int lexer::get_token()
{
        /// skip white space
        while (isspace(_last_char))
                _last_char = _input_stream->get();

        /// EOF
        if (_last_char == EOF)
                return tok_eof;

        /// identifier
        if (isalpha(_last_char) || _last_char == '_')
        {
                _string_value = "";
                do
                {
                        _string_value += _last_char;
                        _last_char = _input_stream->get();
                }
                while (isalpha(_last_char) || _last_char == '_');

                if (_string_value == "OnEntry") return tok_onentry;
                if (_string_value == "OnExit")  return tok_onexit;
                if (_string_value == "for")     return tok_for;
                if (_string_value == "char")    return tok_char;
                if (_string_value == "int")     return tok_int;
                if (_string_value == "bool")    return tok_bool;
                if (_string_value == "extern")  return tok_extern;
                if (_string_value == "void")    return tok_void;

                return tok_id;
       }

        /// number
        if (isdigit(_last_char) || _last_char == '-')
        {
                string num_str;
                do
                {
                        num_str += _last_char;
                        _last_char = _input_stream->get();
                }
                while (isdigit(_last_char) || tolower(_last_char) != 'x');

                _long_value = strtol(num_str.c_str(), NULL, 0);

                return tok_intval;
        }

        /// string literal
        if (_last_char == '"')
        {
                _string_value = "";
                _last_char = _input_stream->get();
                while (!_input_stream->eof() && _last_char != '"')
                {
                        if (_last_char == '\\')
                        {
                                _last_char = _input_stream->get();
                                switch (_last_char)
                                {
                                        case 'a':
                                                _last_char = '\a';
                                                break;
                                        case 'b':
                                                _last_char = '\b';
                                                break;
                                        case 'f':
                                                _last_char = '\f';
                                                break;
                                        case 'n':
                                                _last_char = '\n';
                                                break;
                                        case 'r':
                                                _last_char = '\r';
                                                break;
                                        case 't':
                                                _last_char = '\t';
                                                break;
                                        case 'v':
                                                _last_char = '\v';
                                                break;
                                        default:
                                                break;
                                }
                        }
                        _string_value += _last_char;
                        _last_char = _input_stream->get();
                }
                return tok_stringliteral;
        }

        /// single character tokens
        int tok_char = _last_char;
        _last_char = _input_stream->get();

        _string_value = tok_char;
        switch (tok_char)
        {
                case '(': return tok_lcurve;
                case ')': return tok_rcurve;
                case '{': return tok_lcurly;
                case '}': return tok_rcurly;
                case '+': return tok_plus;
                case '-': return tok_minus;
                case '*': return tok_times;
                case '/': return tok_div;
                case ',': return tok_comma;
                case ';': return tok_semicolon;
                case '<': return tok_lt;
                case '>': return tok_gt;
                case '!':
                        if (_last_char == '=')
                        {
                                _string_value += _last_char;
                                _last_char = _input_stream->get();
                                return tok_neq;
                        }
                case '~': return tok_not;
                case '=':
                        if (_last_char == '=')
                        {
                                _string_value += _last_char;
                                _last_char = _input_stream->get();
                                return tok_eqeq;
                        }
                        return tok_eq;
                case '&':
                        if (_last_char == '&')
                        {
                                _string_value += _last_char;
                                _last_char = _input_stream->get();
                                return tok_andand;
                        }
                        return tok_char;        // tok_and
                case '|':
                        if (_last_char == '|')
                        {
                                _string_value += _last_char;
                                _last_char = _input_stream->get();
                                return tok_oror;
                        }
                        //return tok_or;
                default:
                        return tok_char;
        }
}