% ZADANIE 1
func_call(Fun/Arg/I,Argumenty,Wynik):-
    !,
    List=[Fun|Argumenty],
    nth0(I,List2,Wynik,List),
    Zapytanie =.. List2,
    Zapytanie.

% ZADANIE 2
func_call(Fun/Arg,Argumenty,Wynik):-
    !,
    func_call(Fun/Arg/Arg,Argumenty,Wynik).

func_call(Fun,Argumenty,Wynik):-
    !,
    current_predicate(Fun/Arg),
    func_call(Fun/Arg/Arg,Argumenty,Wynik).

% ZADANIE 3

% :- op(500, xfx, <#).
% :- op(400, xfx, #).

% Result <# Function # ArgsChain :- 
%     func_call(Function,ArgsChain,Result).


% krok2


 :- op(600, xfx, <#).
 :- op(500, xfy, #).

 Result <# Function # ArgsChain :- 
 	  parse_args_chain(ArgsChain, Args),
     current_predicate(Fun/IleArg),

 parse_args_chain(H # T, [ H | TArgs]) :- 
     !,
 	% to jeszcze nie koniec listy argumentów
     parse_args_chain(T,TArgs).
	
 parse_args_chain(H, [H]).


% ZADANIE 4 

curry_call(function(Fun/Arg/I,X),Dodaj,Wynik):-
    append(X,[Dodaj],Y),
    ArgsWithoutResult is Arg-1,
    (length(Y,ArgsWithoutResult) -> 
        func_call(Fun/Arg/I,Y,Wynik);
        Wynik=function(Fun/Arg/I,Y)).

curry_call(function(Fun/Arg,X),Dodaj,Wynik):-
    !,
    curry_call(function(Fun/Arg/Arg,X),Dodaj,Wynik).

curry_call(function(Fun,X),Dodaj,Wynik):-
    !,
    current_predicate(Fun/Arg),
    curry_call(function(Fun/Arg/Arg,X),Dodaj,Wynik).

% ZADANIE 5

:- op(800, xfx, <#).
:- op(700, xfy, #).

Result <# Function # ArgsChain :-
    initial_function(Function, IF),
    curry(IF, ArgsChain, Result).

initial_function(function(F,A), function(F,A)) :-
    !.
initial_function(F, function(F, [])).
                    
 %curry(F, A # T, Result) :-
%     !,
%     curry_call(F,A,X),
%     curry(X,T,Result).
     % przypadek, gdy jeszcze nie doszliœmy do koñca argumentów

% curry(F, A, Result):-
%     curry_call(F,A,Result).
     % przypadek, gdy ju¿ doszliœmy do koñca argumentów


% ZADANIE 6

:- op(400, fy, #).

curry(F, A # T, Result) :-
    !,
    curry_unpack(A, UA),
    curry_call(F, UA, Res),
    curry(Res, T, Result).
   
curry(F, A, Result) :-
    curry_unpack(A, UA),
    curry_call(F, UA, Result).
   
curry_unpack(#(F # Args), AU) :-
    !,
    initial_function(F, IF),
    curry(IF, Args, AU).
curry_unpack(A, A).

