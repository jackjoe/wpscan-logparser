Definitions.

Char          = [a-zA-Z0-9\.\s\,\[\]]
Word          = [^\t\s\.#"=]+
Space         = [\s\t]
New_Line      = [\n]
%New_Line      = \n|\r\n|\r
Type_Regular  = \[\s\]\s
Type_Warning  = \[!\]\s
Pipe          = \|

Rules.

{Type_Regular}  : {token, {type_regular,  TokenLine}}.
{Type_Warning}  : {token, {type_warning,  TokenLine}}.
{Char}          : {token, {char, TokenLine, TokenChars}}.
{Space}         : skip_token.
{Pipe}          : {token, {pipe, TokenLine}}.
{New_Line}      : skip_token.

Erlang code.
