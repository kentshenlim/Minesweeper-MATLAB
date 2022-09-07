function zeroCellArray = getZeroPool(mineCount, r, c)
% Zero here means a cell without any adjacent mines, i.e. the cell which is
% zero in the matrix output from the function getAdjacentMineCount
% This is needed because when a user chooses a cell which is zero, all
% adjacent zeroes will be revealed automatically.
% Input: Adjacent mine count matrix, selected row then column number
% Output: a cell array with row and column number of entry which is zero
% and adjacent to targetted r, c
zeroCellArray = {};
candidate = {[r,c]};
while length(candidate) > 0
    item = candidate{1};
    candidate(1) = []; % Remove after use
    zeroCellArray{end+1} = item; % Only adjacent zero will ever into candidate. Append to cell array.
    frag = getAdjacentFragment(mineCount, item(1), item(2));
    

end