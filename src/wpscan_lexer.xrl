Definitions.

C          = [a-za-z0-9\.\,\[\]]
W          = [^\t\s\.#"=]+
S         = [\s\t]
NL      = [\n\r]

Rules.

% type tokens
\[!\]         : {token, {type_regular,  TokenLine}}.
\[\s\]        : {token, {type_warning,  TokenLine}}.

% props
URL\:         : {token, {url, TokenLine}}.


% string
{W}          : {token, {word, TokenLine, parse_string(TokenChars)}}.
%{C}          : {token, {char, TokenLine, TokenChars}}.

% the rest
\|            : {token, {pipe, TokenLine}}.

% skip
{NL}      : skip_token.
{S}           : skip_token.

Erlang code.

parse_string(Str) ->
  unicode:characters_to_binary(Str).
