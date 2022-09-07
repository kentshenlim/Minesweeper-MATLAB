function mineCount = getAdjacentMineCount(mineMap)
% Compute a mine count map, entry showing number of adjacent mines
% Input: mine map, e.g. matrix showing distribution of mines
% Output: mine count map, each entry showing number of adjacent mines
[r, c] = size(mineMap);
mineCount = zeros(r,c);
for i = 1:r
    for j = 1:c
        fragment = getAdjacentFragment(mineMap, i, j);
        numberOfMine = sum(sum(fragment)) - mineMap(i,j);
        mineCount(i,j) = numberOfMine;
    end
end
end