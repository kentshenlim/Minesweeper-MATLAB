function safeSpotNum = getSafeSpotNum(mineMap, currentDisplay)
% Return number of spots to be revealed before victory
% Input: mineMap = mine map, currentDisplay = a matrix showing each grid
% has been revealed or not, 1 means revealed
% Output: integer, number of unrevealed safe spots
% Format of call: getSafeSpotNum(mineMap, currentDisplay)
safeSpotNum = sum(sum((currentDisplay==0) & (mineMap == 0)));
end