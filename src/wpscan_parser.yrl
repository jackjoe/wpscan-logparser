Nonterminals lines line line_content chars.
Terminals type_regular type_warning char pipe.
Rootsymbol lines.

lines -> line lines : ['$1'|['$2']].
lines -> line : '$1'.

%line -> pipe line_content : '$2'.
line -> type_regular line_content : #{type => regular, text => '$2'}.
line -> type_warning line_content : #{type => warning, text => '$2'}.

line_content -> chars : '$1'.
line_content -> pipe chars : '$1'.

chars -> char chars : unicode:characters_to_binary([get_value('$1')] ++ '$2').
chars -> char : unicode:characters_to_binary([get_value('$1')]).

Erlang code.

get_value({_, _, Value}) -> Value.
