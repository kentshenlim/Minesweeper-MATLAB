function zeroPoolSurrounding = getZeroPoolFirstLayer(zeroPool, r, c)
% Cell array containing the layer surrounding zero pool.
% Input: cell array output from getZeroPool, r number of rows, c number of
% columns
% Output: a cell array with row and column number of entry surrounding zero
% pool
% Format of call: getZeroPoolFirstLayer(zeroPool) => {[r1, c1], [r2, c2], ...}
zeroPoolSurrounding = {};
isVisited = false(r, c);
for k = 1:length(zeroPool)
    currentZero = zeroPool{k};
    currentR = currentZero(1);
    currentC = currentZero(2);
    isVisited(currentR, currentC) = true;
    rLow = currentR - 1;
    rHigh = currentR + 1;
    cLow = currentC - 1;
    cHigh = currentC + 1;
    if rLow == 0 
        rLow = 1;
    end
    if rHigh > r
        rHigh = r;
    end
    if cLow == 0
        cLow = 1;
    end
    if cHigh > c
        cHigh = c;
    end
    for i = rLow:rHigh
        for j = cLow:cHigh
            if (~isVisited(i, j))
                isVisited(i, j) = true;
                zeroPoolSurrounding{end + 1} = [i, j];
            end
        end
    end
end
end