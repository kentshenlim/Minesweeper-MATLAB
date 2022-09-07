function mineCount = getAdjacentMineCount(mineMap)
% Compute a mine count map, entry showing number of adjacent mines
% Input: mine map, e.g. matrix showing distribution of mines
% Output: mine count map, each entry showing number of adjacent mines
[r, c] = size(mineMap);
mineCount = zeros(r,c);
for i = 1:r
    for j = 1:c
        lowR = i - 1; highR = i + 1; % Relevant row number for counting mines
        lowC = j - 1; highC = j + 1; % Relevant column number for counting mines
        if lowR == 0 % Limit control, so not out of range
            lowR = 1;
        end
        if highR > r
            highR = r;
        end
        if lowC == 0
            lowC = 1;
        end
        if highC > c
            highC = c;
        end
        fragment = mineMap(lowR:highR, lowC:highC);
        numberOfMine = sum(sum(fragment)) - mineMap(i,j);
        mineCount(i,j) = numberOfMine;
    end
end
end