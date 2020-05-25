% load clpfd library
:- ensure_loaded(library(clpfd)).

% puzzle_solution(Puzzle, WorldList) :-
%     maplist(same_length(Puzzle), Puzzle),
%     Rows = Puzzle,
%     transpose(Puzzle, Cols)


get_slots(Row, Slots) :-
    get_slots(Row, [[]], Slots).

get_slots([], Slots0, Slots0).

get_slots(['#'|Rs], Slots0, Slots) :-
    last(Slots0, LastSlot), 
    (   LastSlot == []
    ->  get_slots(Rs, Slots0, Slots)
    ;   append(Slots0, [[]], Slots1),
        get_slots(Rs, Slots1, Slots)
    ).


get_slots([A|Rs], Slots0, Slots) :-
    % var(A),
    length(Slots0, N),
    nth1(N, Slots0, LastSlot, RestSlots),
    append(LastSlot, [A], NewSlot),
    append(RestSlots, [NewSlot], Slots1),
    get_slots(Rs, Slots1, Slots).