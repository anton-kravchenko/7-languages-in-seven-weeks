-module(erl_1). % defines the name of the module

-export([mirror/1]). % defines a function to be used outside the module (export);

% /1 - means that "mirror" function has 1 param
% c(erl_1). % in the repl to compile the module
%  erl_1:mirror(success). % and call the function like that <module>:<function>(<arg list).

-export([start/0]).

-export([number/1]).

-export([factorial/1]).

-export([fib/1]).

mirror(Anything) -> Anything.

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.

start() -> io:fwrite("hello world\n").

% Erlang is optimized for tail recursion - even erl_1:factorial(10000) doesn't crash the app
factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

% % variable declaration
% Var = 3

% % Atom (Symbols in relang are called Atoms)
% Pill = blue.

% % List (Lists are heterogenous)
% L = [1, 2, "three"]

% % Tuple (tuple of 3 atoms)
% {ono, two, three}

% % Tuples are used as a hash map replacement eg
% {lang, "Erlang"}

% % Pattern matching
% Person = {
%     person,
%     { name, "Agent Smith" },
%     {profession, "Killing programs"}
% }.
% % Extract into Name and Profession variables
% { person, {name, Name}, {profession, Profession}} = Person.

% % Head = 1, Tail = [2, 3, 4].
% [Head | Tail] = [1,2,3,4].
% [One, Two|Rest] = [1, 2, 3].

% % The following is actually a pattern matching, that fails because "one" is an Atom (Synbol)
% % one = 1.
% % one = one. % => that one works

% % Bit level matching
% A = 1.
% B = 2.
% C = 3.
% Packed = <<A:1, B: 2, C: 3>>. % Pack A in 1 bit, B in 2 bits and C in 3 bits

% <<X: 1, Y: 2, Z: 3>> = Packed. % Unpack 1 bit to X, 2 bits to Y and 3 bits to Z

%  Erlang OTP - is open telecom platform (application operating system for building large-scalce, fault-tolerant systems)

% [72, 97, 32, 72, 97, 32, 72, 97]. % This is a string "Ha Ha Ha" - there is no "string" as data type in Erlang

