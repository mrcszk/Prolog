% Dynamiczny predykat służący
% przechowywaniu imion znajomych
:- dynamic jest_znajomym/1.

% Główna pętla programu:
% - wczytuje komendę
% - przetwarza komendę
% - zapętla się ;)
main :- 
    read_command(Command),
    process_command(Command),
    main.

% Predykat pobierający komendą ze standardowego wejścia
% Dostępne komendy:
% - "add" - dodaj znajomego
% - "del" - usuń znajomego
% - "list" - wypisz znajomych
% - "help" - wyświetl listę komend
% - "exit" - wyjdź z programu
read_command(Command) :- read(Command).

% Predykat realizujący komendę 'help'
% Potrzeba jeszcze czterech innych komend,
% W przypadku nierozpoznoznanej komendy, program powinien
% wypisać informacje, że nie zna podanej komendy i kontynuować 
process_command(help) :- 
    writeln("Lista komend:"),
    writeln("- 'add' - dodaj znajomego"),
    writeln("- 'del' - usuń znajomego"),
    writeln("- 'list' - wypisz wszystkich znajomych"),
    writeln("- 'help' - wyświetl listę komend"),
    writeln("- 'exit' - zakończ program").    
process_command(add) :-
writeln("Podaj znajomego: "),
read(X),
assert(jest_znajomym(X)).
process_command(del) :-
writeln("Podaj znajomego do usunięcia: "),
read(X),
retract(jest_znajomym(X)).
process_command(list) :-
jest_znajomym(X),
writeln(X),
fail.
process_command(list).
process_command(exit) :-
writeln("Do widzenia!"),
fail.
% Misja: napisz kod realizujący brakujące komendy!




