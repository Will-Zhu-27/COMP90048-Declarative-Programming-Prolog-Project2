% load clpfd library
:- ensure_loaded(library(clpfd)).

get_puzzle_slots(Puzzle, WorldList) :-
    % maplist(same_length(Puzzle), Puzzle),
    Rows = Puzzle,
    get_all_slots(Rows, AllRowsSlots),
    transpose(Puzzle, Cols),
    get_all_slots(Cols, AllColsSlots),
    append(AllRowsSlots, AllColsSlots, WorldList).


get_all_slots([], []).
get_all_slots([Row|Rows], AllSlots) :-
    get_slots(Row, Slots),
    get_all_slots(Rows, AllSlots1),
    append(Slots, AllSlots1, AllSlots).


get_slots(Row, Slots) :-
    get_slots(Row, [[]], Slots).

get_slots([], Slots0, Slots) :-
    delete(Slots0, [], Slots).

get_slots(['#'|Rs], Slots0, Slots) :-
    last(Slots0, LastSlot), 
    (   LastSlot == []
    ->  get_slots(Rs, Slots0, Slots)
    ;   append(Slots0, [[]], Slots1),
        get_slots(Rs, Slots1, Slots)
    ).


get_slots([A|Rs], Slots0, Slots) :-
    A \== '#',
    length(Slots0, N),
    nth1(N, Slots0, LastSlot, RestSlots),
    append(LastSlot, [A], NewSlot),
    append(RestSlots, [NewSlot], Slots1),
    get_slots(Rs, Slots1, Slots).