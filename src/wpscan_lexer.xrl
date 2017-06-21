Definitions.

C       = [^\t\s\n\']
WS      = [\s\t]
NL      = [\n\r]
TW      = \[!\]\s
TR      = \[\s\]\s
LT      = TW|TR

Rules.

% type tokens
{TW}                : {token, {type_warning,  TokenLine}}.
{TR}                : {token, {type_regular,  TokenLine}}.

% props
{LT}\sURL\:\s             : {token, {site, TokenLine}}.
{LT}\sStarted\:\s         : {token, {started, TokenLine}}.
{LT}\sFinished\:\s        : {token, {finished, TokenLine}}.
{LT}\sRequests\sDone\:\s  : {token, {reqs_done, TokenLine}}.
{LT}\sMemory\sused\:\s    : {token, {mem_used, TokenLine}}.
{LT}\sElapsed\stime\:\s   : {token, {elapsed_time, TokenLine}}.

% string
{C}                 : {token, {char, TokenLine, TokenChars}}.

% url
https?://[a-zA-Z\./\?=0-9a-zA-Z\.a-zA-Z]+
                    : {token, {url, TokenLine, TokenChars}}.
%#=%_-,~&

% the rest
\|                  : {token, {pipe, TokenLine}}.

% skip
{NL}                : skip_token.
{WS}                : skip_token.
\'                  : skip_token.

Erlang code.
