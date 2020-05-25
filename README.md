# COMP90048-Declarative-Programming-Prolog-Project2
A fill-in puzzle (sometimes called a fill-it-in) is like a crossword puzzle, except that instead of being given obscure clues telling us which words go where, you are given a list of all the words to place in the puzzle, but not told where they go.

The puzzle consists of a grid of squares, most of which are empty, into which letters or digits are to be written, but some of which are filled in solid, and are not to be written in. You are also given a list of words to place in the puzzle.
You must place each word in the word list exactly once in the puzzle, either left-to-right or top-to-bottom, filling a maximal sequence of empty squares. Also, every maximal sequence of non-solid squares that is more than one square long must have one word from the word list written in it. Many words cross one another, so many of the letters in a horizontal word will also be a letter in a vertical word. For a properly constructed fill-in puzzle, there will be only one way to fill in the words (in some cases, the puzzle is symmetrical around a diagonal axis, in which case there will be two symmetrical solutions).

Here is an example 7 by 7 fill-in puzzle, together with its solution, taken from https://en.wikipedia.org/wiki/Fill-In_(puzzle). In this example, one word is already written into the puzzle, but this is not required.

![Image text](https://raw.githubusercontent.com/Will-Zhu-27/COMP90048-Declarative-Programming-Prolog-Project2/master/fill_in_example.png?token=AJJLRBD4KBK3NYCXZBKF2IS6ZMJR4)
