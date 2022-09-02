function safeSpotNum = getSafeSpotNum(mineMap, currentDisplay)
% Return number of spot to be revealed before victory
% Input: mine map then current display
% Output: integer, number of unrevealed safe spot
safeSpotNum = sum(sum((currentDisplay==0) & (mineMap == 0)));
end