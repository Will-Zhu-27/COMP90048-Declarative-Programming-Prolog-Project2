% load library
:- ensure_loaded(library(clpfd)).
:- ensure_loaded(library(pairs)).

puzzle_solution(Puzzle, WordList) :-
    get_puzzle_slots(Puzzle, Slots),
    get_all_pairs(WordList, Slots, Pairs),
    sort(Pairs, SortedPairs),
    fill_slots(SortedPairs, WordList).

fill_slots([], []).
fill_slots([(_-[Slot, Options])|Pairs], WordList) :-
    member(Slot, Options),
    update_pairs(Pairs, UpdatedPairs, Slot),
    sort(UpdatedPairs, SortedPairs),
    select(Slot, WordList, RestWordList),
    fill_slots(SortedPairs, RestWordList).

update_pairs(Pairs, UpdatedPairs, RemoveWord) :-
    update_pairs(Pairs, [], UpdatedPairs, RemoveWord).

update_pairs([], UpdatedPairs, UpdatedPairs, _).
update_pairs([(_-[Slot, Options])|Pairs], UpdatedPairs0, UpdatedPairs, RemoveWord) :-
    delete(Options, RemoveWord, RestOptions),
    get_pair(RestOptions, Slot, Pair),
    append(UpdatedPairs0, Pair, UpdatedPairs1),
    update_pairs(Pairs, UpdatedPairs1, UpdatedPairs, RemoveWord).

get_all_pairs(WordList, Slots, Pairs) :-
    get_all_pairs(WordList, Slots, [], Pairs).

get_all_pairs(_, [], Pairs, Pairs).
get_all_pairs(WordList, [Slot|Slots], Pairs0, Pairs) :-
    get_pair(WordList, Slot, Pair),
    append(Pairs0, Pair, Pairs1),
    get_all_pairs(WordList, Slots, Pairs1, Pairs).

get_pair(WordList, Slot, Pair):-
    filter_words(WordList, Slot, [], FilteredWords),
    length(FilteredWords, N),
    Pair = [N-[Slot, FilteredWords]].

filter_words([], _, Result, Result).
filter_words([Word|Words], Slot, Result0, Result) :-
    (   Slot \= Word   
    ->  filter_words(Words, Slot, Result0, Result)
    ;  append(Result0, [Word], Result1),
        filter_words(Words, Slot, Result1, Result)
    ).

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