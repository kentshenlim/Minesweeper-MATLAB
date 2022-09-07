function mineMap = getMineMap(x,y)
% Build a mine map of x rows and y columns, 10 mines
% Input: number of rows, then number of columns
% Output: mine map, 0 means no mine 1 means with mine
mat = zeros(x,y);
numberOfMine = 10; % Adjust later according to difficulty level
count = 0;
while (count < numberOfMine)
    r = randi([1,x]);
    c = randi([1,y]);
    if (mat(r,c) == 0)
        mat(r,c) = 1;
        count = count + 1;
    end
end
mineMap = mat;
end