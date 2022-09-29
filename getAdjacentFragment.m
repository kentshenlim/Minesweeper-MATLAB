function fragMat = getAdjacentFragment(mat, r, c)
% Return 3 by 3 fragment matrix, surrounding targetted spot (r, c)
% Input: mat = the big matrix, r = row number of target, c = column number
% of target
% Output: a 3 by 3 matrix, adjacent of the targetted spot
% Format of call: getAdjacentFragment(mat, 2, 3) => 3 by 3 matrix
% fragmented from mat, with center = (2, 3)
[rowMax, colMax] = size(mat);
rowLow = r - 1; rowHigh = r + 1; % Relevant row number for fragmenting
colLow = c - 1; colHigh = c + 1; % Relevant column number for fragmenting
if rowLow == 0 % Limit control, so not out of range
    rowLow = 1;
end
if rowHigh > rowMax
    rowHigh = rowMax;
end
if colLow == 0
    colLow = 1;
end
if colHigh > colMax
    colHigh = colMax;
end
fragMat = mat(rowLow:rowHigh, colLow:colHigh);
end