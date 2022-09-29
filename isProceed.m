function result = isProceed(mineMap, r, c)
% Decide if player proceeds
% Input: mineMap = mine map, r = row number chosen, c = column number chosen
% Output: true means proceed, false means lose
% Format of call: getWinOrLose(mineMap, r, c)
result = true;
if mineMap(r, c) == 1
    result = false;
end
end