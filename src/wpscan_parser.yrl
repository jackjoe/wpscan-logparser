Nonterminals
%log
lines
line
values
value
chars.

Terminals
type_regular
type_warning
url
int
day
month
site
char
space
pipe
started
finished
css
reqs_done
mem_used
elapsed_time.

Rootsymbol
lines.

%log -> lines : '$1'.

lines -> type_regular site url lines : maps:merge(#{site => get_value('$3')}, '$4').
lines -> type_regular started values lines : maps:merge(#{started => '$3'}, '$4').
lines -> type_regular finished values lines : maps:merge(#{finished => '$3'}, '$4').
lines -> line lines : #{entries => ['$1'] ++ '$2'}.
%lines -> line lines : ['$1'|'$2'].
lines -> line : '$1'.

line -> type_regular values : #{type => regular, content => '$2'}.
line -> type_warning values : #{type => warning, content => '$2'}.

%values -> site url : #{site => get_value('$2')}.

values -> pipe values : '$2'.
values -> site url : #{site => '$2'}.
values -> day space month space int values : #{ok => unicode:characters_to_binary([get_value('$1'), get_value('$2'), get_value('$3')])}.
values -> started values : #{started => '$2'}.
values -> finished values : #{finished => '$2'}.
values -> reqs_done values : #{reqs_done => '$2'}.
values -> mem_used values : #{mem_used => '$2'}.
values -> css values : #{finished => '$2'}.
values -> elapsed_time values : #{elapsed_time => '$2'}.
values -> value values : ['$1'] ++ '$2'.
values -> value : ['$1'].

value -> chars space : unicode:characters_to_binary(['$1'|get_value('$2')]).
value -> chars : '$1'.
value -> space : '$1'.
value -> url : '$1'.
value -> int : '$1'.

chars -> char chars : unicode:characters_to_binary([get_value('$1')] ++ '$2').
chars -> char : unicode:characters_to_binary([get_value('$1')]).

Erlang code.

get_value({_, _, Value}) -> Value.
parse_string(Chars) -> unicode:characters_to_binary(Chars).
parse_char(Char) -> unicode:characters_to_binary([Char]).
