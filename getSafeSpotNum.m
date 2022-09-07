function safeSpotNum = getSafeSpotNum(mineMap, currentDisplay)
% Return number of spots to be revealed before victory
% Input: mine map then current display
% Output: integer, number of unrevealed safe spots
safeSpotNum = sum(sum((currentDisplay==0) & (mineMap == 0)));
end