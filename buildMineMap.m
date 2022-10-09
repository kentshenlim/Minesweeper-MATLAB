function mineMap = buildMineMap(r, c, numberOfMine, firstR, firstC)
% Build a mine map of r rows and c columns, 10 mines
% firstR firstC prevent first cell chosen is mine
% Input: r = number of rows, c = number of columns, number of mine, firstR
% firstC
% Output: mine map, 0 means no mine, 1 means with mine
% Format of call: buildMineMap(8, 10, 10, 1, 2) => a 8 by 10 mine map, with
% 10 mines, surely (1, 2) will not be mine
mat = zeros(r, c);
count = 0;
while (count < numberOfMine)
    currentR = randi([1, r]);
    currentC = randi([1, c]);
    if (mat(currentR, currentC) == 0 && ~(firstR == currentR && firstC == currentC)) 
        mat(currentR, currentC) = 1;
        count = count + 1;
    end
end
mineMap = mat;
end