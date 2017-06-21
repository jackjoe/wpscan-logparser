Nonterminals
log
lines
line
values
value
chars.

Terminals
type_regular
type_warning
url
site
char
space
pipe
started
finished
reqs_done
mem_used
elapsed_time.

Rootsymbol
log.

log -> lines : '$1'.

lines -> type_regular site url lines : #{site => [get_value('$3')] ++ '$4'}.
lines -> type_regular site started lines : #{started => [get_value('$3')] ++ '$4'}.
lines -> type_regular site finished lines : #{finished => [get_value('$3')] ++ '$4'}.
lines -> line lines : #{lines => ['$1'] ++ '$2'}.
lines -> line : ['$1'].

%lines -> lines : #{lines => ['$1']}.

line -> type_regular values : #{type => regular, text => '$2'}.
line -> type_warning values : #{type => warning, text => '$2'}.

%values -> site url : #{site => get_value('$2')}.

values -> pipe values : '$2'.
values -> started values : #{started => '$2'}.
values -> reqs_done values : #{reqs_done => '$2'}.
values -> mem_used values : #{mem_used => '$2'}.
values -> finished values : #{finished => '$2'}.
values -> elapsed_time values : #{elapsed_time => '$2'}.
values -> value values : ['$1'|'$2'].
values -> value : ['$1'].

value -> chars : '$1'.
value -> space : '$1'.
value -> url : '$1'.
%value -> word : get_value('$1').
%value -> url word : '$1'.
%value -> pipe word : '$1'.

chars -> char chars : unicode:characters_to_binary([get_value('$1')] ++ '$2').
chars -> char : unicode:characters_to_binary([get_value('$1')]).
%chars -> char chars : parse_string([get_value('$1')] ++ '$2').
%chars -> char : parse_char(get_value('$1')).

Erlang code.

get_value({_, _, Value}) -> Value.
parse_string(Chars) -> unicode:characters_to_binary(Chars).
parse_char(Char) -> unicode:characters_to_binary([Char]).
