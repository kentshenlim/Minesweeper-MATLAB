function mineMap = buildMineMap(r, c, numberOfMine)
% Build a mine map of r rows and c columns, 10 mines
% Input: r = number of rows, c = number of columns
% Output: mine map, 0 means no mine, 1 means with mine
% Format of call: buildMineMap(8, 10, 10) => a 8 by 10 mine map, with 10
% mines
mat = zeros(r, c);
count = 0;
while (count < numberOfMine)
    currentR = randi([1, r]);
    currentC = randi([1, c]);
    if (mat(currentR, currentC) == 0)
        mat(currentR, currentC) = 1;
        count = count + 1;
    end
end
mineMap = mat;
end