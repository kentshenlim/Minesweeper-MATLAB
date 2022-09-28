function result = getWinOrLose(mineMap, r, c)
% Input: mine map, row number chosen, column number chosen
% Output: 1 means proceed, 0 means lose
result = 1;
if mineMap(r,c) == 1
    result = 0;
end
end