function [r, c, numMine] = setDifficulty(s)
% Decide the row and column of grids, the number of mines, of a game
% Input: Number, 1 means easy, 2 means medium, 3 means difficult
% Output: r = number of rows, c = number of columns, numMine = number of
% mines
% Format of call: setDifficulty(1) or setDifficulty(2) or setDifficulty(3)
if s == 1
    r = 8;
    c = 10;
    numMine = 10;
elseif s == 2
    r = 14;
    c = 18;
    numMine = 40;
else
    r = 20;
    c = 24;
    numMine = 99;
end
end