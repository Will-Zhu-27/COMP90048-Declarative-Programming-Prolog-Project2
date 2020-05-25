% load clpfd library
:- ensure_loaded(library(clpfd)).

puzzle_solution(Puzzle, WordList) :-
    get_puzzle_slots(Puzzle, Slots),
    fill_slots(Slots, WordList).

fill_slots(_, []).
fill_slots(Slots, [Word|Words]) :-
    length(Word, N),
    include(filter_slot(N), Slots, FilteredSlots),
    member(Word, FilteredSlots),
    select(Word, Slots, LastSlots),
    fill_slots(LastSlots, Words).

filter_slot(N, Word) :-
    length(Word, N).


get_puzzle_slots(Puzzle, AllSlots) :-
    Rows = Puzzle,
    get_all_slots(Rows, AllRowsSlots),
    transpose(Puzzle, Cols),
    get_all_slots(Cols, AllColsSlots),
    append(AllRowsSlots, AllColsSlots, AllSlots).


get_all_slots([], []).
get_all_slots([Row|Rows], AllSlots) :-
    get_slots(Row, Slots),
    get_all_slots(Rows, AllSlots1),
    append(Slots, AllSlots1, AllSlots).


get_slots(Row, Slots) :-
    get_slots(Row, [[]], Slots).

get_slots([], Slots0, Slots) :-
    % 去掉1和0个的slot
    delete(Slots0, [], Slots1),
    exclude(filter_slot(1), Slots1, Slots).
    
get_slots([A|Rs], Slots0, Slots) :-
    (   A == '#'
    ->  last(Slots0, LastSlot),
        (   LastSlot == []
        ->  get_slots(Rs, Slots0, Slots)
        ;   append(Slots0, [[]], Slots1),
            get_slots(Rs, Slots1, Slots)
        )
    ;   length(Slots0, N),
        nth1(N, Slots0, LastSlot, RestSlots),
        append(LastSlot, [A], NewSlot),
        append(RestSlots, [NewSlot], Slots1),
        get_slots(Rs, Slots1, Slots)
    ).