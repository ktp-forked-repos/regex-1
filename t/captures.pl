:- use_module(library(regex)).

:- use_module(library(tap)).

% no captures
regex('\\d+', [], '932', []).
regex('.*', [], howdy, []).

% single capture
regex('(\\d+)', [], '932', ["932"]).
regex('a (\\d+)rd', [], 'a 3rd', ["3"]).

% two captures
regex('(\\S+) (\\S+)', [], 'hello world', ["hello", "world"]).


'captures initially unbound' :-
    regex('hello ([a-z]+)', i, 'Hello Joe', [Whom]),
    Whom == "Joe".

'pattern matches but captures fail unification'(fail) :-
    Whom = "Thomas",
    regex('hello ([a-z]+)', i, 'Hello Tom', [Whom]).