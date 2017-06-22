Definitions.

C       = [^\t\n\']
WS      = [\s\t]
NL      = [\n\r]

Rules.

% type tokens
\[!\]\s             : {token, {type_warning,  TokenLine}}.
\[\s\]\s            : {token, {type_regular,  TokenLine}}.

% props
URL\:\s             : {token, {site, TokenLine}}.
Started\:\s         : {token, {started, TokenLine}}.
Finished\:\s        : {token, {finished, TokenLine}}.
Requests\sDone\:\s  : {token, {reqs_done, TokenLine}}.
Memory\sused\:\s    : {token, {mem_used, TokenLine}}.
Elapsed\stime\:\s   : {token, {elapsed_time, TokenLine}}.
Style\sURL\:\s      : {token, {css, TokenLine}}.

% string
{C}                 : {token, {char, TokenLine, TokenChars}}.

% url
https?://[a-zA-Z\./\?=0-9a-zA-Z\.a-zA-Z~]+
                    : {token, {url, TokenLine, TokenChars}}.
%#=%_-,~&

% the rest
\|                  : {token, {pipe, TokenLine}}.

% skip
{NL}                : skip_token.
\'                  : skip_token.

Erlang code.
