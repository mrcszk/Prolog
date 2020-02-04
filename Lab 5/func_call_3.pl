% Na potrzeby zada�

% Mo�e si� przyda� predykat wk�adaj�cy elementy do 
% listy na wskazanym indeksie
insert(Element, 0, Lista, [Element|Lista]).
insert(Element, I, [H|T], [H|NT]) :-
    I > 0,
    NI is I - 1,
    insert(Element, NI, T, NT).

func_call(Predicate, Index, Result) :-
    Predicate =.. List,
    insert(Result, Index, List, ListWithResult),
    Query =.. ListWithResult,
    call(Query), !.