function zeroCellArray = getZeroPool(mineCount, r, c)
% Zero here means a cell without any adjacent mines, i.e. the cell which is
% zero in the matrix output from the function buildAdjacentMineCount
% Input: mineCount = mine count, r = row number targeted, c = column number
% targeted
% Output: a cell array with row and column number of entry which is zero
% and adjacent to targetted r, c
% Format of call: getZeroPool(mineCount, r, c) => {[r1, c1], [r2, c2], ...}
zeroCellArray = {};
[s1, s2] = size(mineCount);
isVisited = false(s1, s2); % To store visited cell
candidate = {[r,c]};
while ~isempty(candidate)
    currentCell = candidate{end};
    candidate(end) = []; % Cell indexing, not content indexing
    currentR = currentCell(1);
    currentC = currentCell(2);
    if isVisited(currentR, currentC)
        continue % Do nothing
    end
    isVisited(currentR, currentC) = true;
    if mineCount(currentR, currentC) == 0
        zeroCellArray{end+1} = [currentR, currentC];
        rLow = currentR - 1;
        rHigh = currentR + 1;
        cLow = currentC - 1;
        cHigh = currentC + 1;
        if rLow == 0
            rLow = 1;
        end
        if rHigh > s1
            rHigh = s1;
        end
        if cLow == 0
            cLow = 1;
        end
        if cHigh > s2
            cHigh = s2;
        end
        for firstInd = rLow:rHigh
            for secondInd = cLow:cHigh
                candidate{end+1} = [firstInd, secondInd];
            end
        end
    end % Else if the value is not 0, the coordinate will be removed without doing anything
end