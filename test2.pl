Puzzle = [['#',h,'#'],
            [_,_,_],
            ['#',_,'#']], 
        WordList = [[h,a,t], 
                    [b,a,g]], 
        puzzle_solution(Puzzle, WordList).

Puzzle = [[#, h, #], [b, a, g], [#, t, #]],
WordList = [[h, a, t], [b, a, g]] ;
false.

get_puzzle_slots([['#','#','e', 'v', 'e','#','#'],
            ['#','#','d', 'e', 'n','s','#'],
            ['d','a','i', 's', '#','i','o'],
            ['a','r','t', 'i', 'c','l','e'],
            ['g','i','#', 'c', 'l','o','d'],
            ['#','d','o', 'l', 'e','#','#'],
            ['#','#','r', 'e', 'f','#','#']], WorldList). 


setof(get_puzzle_slots([['#', _, '#'], [_, _, _], ['#', _, '#']], Slots), filter_list(3, Slots, Result))
Puzzle = [['#',h,'#'],[_,_,_],['#',_,'#']], WordList = [[h,a,t], [b,a,g]], puzzle_solution(Puzzle, WordList).

Puzzle = [['#','#', _, _, _,'#','#'],
            ['#','#', _, _, _, _,'#'],
            ['d', _, _, _, '#', _, _],
            ['a', _, _, _, _, _, _],
            ['g', _,'#', _, _, _, _],
            ['#', _, _, _, _,'#','#'],
            ['#','#', _, _, _,'#','#']],
WordList = [[g, i], [i, o], [o, n], [o, r], [d,a,g], [e,v,o], [o,e,d],[r,e,f],[a,r,i,d],[c,l,e,f],[c,l,o,d],[d,a,i,s], [d,e,n,s],[d,o,l,e], [e,d,i,t],[s,i,l,o], [a,r,t,i,c,l,e], [v,e,s,i,c,l,e]],
puzzle_solution(Puzzle, WordList).


Slots = [[_, a, _, _], [k, _]], WordList = [[b, a, g, e], [a,c], [c,a,g,e], [k, g]],get_all_pairs(WordList, Slots, Pairs).

Pairs = [1-[[_,a], [[k, a]]], 2-[[b, a, _], [[b, j, k], [b, a, a]]]], update_pairs(Pairs, UpdatedPairs), write(UpdatedPairs).