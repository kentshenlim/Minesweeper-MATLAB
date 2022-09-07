function fragMat = getAdjacentFragment(mat, r, c)
% Return fragment matrix, adjacent of targetted spot
% Input: the big matrix, then the row and column number of targetted spot
% Output: adjacent of the targetted spot
[rowMax, colMax] = size(mat);
rowLow = r - 1; rowHigh = r + 1;
colLow = c - 1; colHigh = c + 1;
if rowLow == 0
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