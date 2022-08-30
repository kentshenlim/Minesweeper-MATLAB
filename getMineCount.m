function mineCount = getMineCount(mineMap)
% Compute a mine count map, entry showing number of adjacent mines
% Input: mine map, output from getMineMap()
% Output: mine count map
[r, c] = size(mineMap);
mineCount = zeros(r,c);
for i = 1:r
    for j = 1:c
        lowR = i - 1; highR = i + 1; % Relevant row number for counting mines
        lowC = j - 1; highC = j + 1; % Relevant column number for counting mines
        if lowR < 0 % Limit control, so not out of range
            lowR = 0;
        end
        if highR > r
            highR = r;
        end
        if lowC < 0
            lowC = 0;
        end
        if highC > c
            highC = c;
        end
        fragment = mineMap(lowR:highR, lowC:highC);
        numberOfMine = sum(fragment) - mineMap(i,j);
        mineCount(i,j) = numberOfMine;
    end
end
end

        
