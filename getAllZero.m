function rcCell = getAllZero(mineCount)
% Return a cell array containing r and c numbers of cell without adjacent
% mines
% Input: mine count, matrix showing the number of adjacent mines
% Output: cell array, one entry = one "coordinate"
[row, col] = find(mineCount == 0);
rcCell = {};
for i = 1:length(row)
    rcCell{end+1} = [row(i), col(i)]; % Append all into rcCell
end
end