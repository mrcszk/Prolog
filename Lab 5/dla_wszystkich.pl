dla_wszystkich(Warunek, Akcja) :-
    call((Warunek, Akcja)),
    fail.
dla_wszystkich(_, _).