Nonterminals
%lines line line_content chars.
log lines line values value.

Terminals
%type_regular type_warning char pipe.
type_regular type_warning url word pipe.

Rootsymbol
log.

log -> lines : #{lines => ['$1']}.

lines -> line lines : ['$1'|['$2']].
lines -> line : '$1'.

line -> pipe values : '$2'.
line -> type_regular values : #{type => regular, text => '$2'}.
line -> type_warning values : #{type => warning, text => '$2'}.

values -> url values : #{url => '$2'}.
values -> value values : ['$1','$2'].
values -> value : '$1'.

value -> word : get_value('$1').
%value -> url word : '$1'.
%value -> pipe word : '$1'.

%chars -> char chars : unicode:characters_to_binary([get_value('$1')] ++ '$2').
%chars -> char : unicode:characters_to_binary([get_value('$1')]).

Erlang code.

get_value({_, _, Value}) -> Value.
