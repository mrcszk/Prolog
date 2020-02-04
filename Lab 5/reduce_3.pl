dodaj(X,Y,Z) :- Z is X + Y.

reduce(_, [], X, X).
reduce(Predicate, [H | T], Accumulator, Result) :-
    Query =.. [Predicate, H, Accumulator, NewAccumulator],
    call( Query ),
    reduce(Predicate, T, NewAccumulator, Result).