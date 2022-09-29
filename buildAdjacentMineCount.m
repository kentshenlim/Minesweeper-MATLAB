function mineCount = buildAdjacentMineCount(mineMap)
% Compute a mine count map, current entry showing number of adjacent mines
% at current position
% Input: mineMap = mine map, i.e. matrix showing distribution of mines
% Output: mine count map, each entry showing number of adjacent mines at
% current position
% Format of call: buildAdjacentMineCount(mineMap)
[r, c] = size(mineMap);
mineCount = zeros(r, c);
for i = 1:r
    for j = 1:c
        fragment = getAdjacentFragment(mineMap, i, j);
        numberOfMine = sum(sum(fragment)) - mineMap(i, j);
        mineCount(i, j) = numberOfMine;
    end
end
end