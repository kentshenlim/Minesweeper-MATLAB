function [xCoordinate, yCoordinate] = getZeroPool(r, c, mineCount)
% Zero here means a cell without any adjacent mines, i.e. the cell which is
% zero in the matrix output from the function getAdjacentMineCount
% This is needed because when a user chooses a cell which is zero, all
% adjacent zeroes will be revealed.
% Input: row then column number chosen, adjacent mine count matrix
% Output: a vector with row numbers of adjacent zeroes, a vector with
% column numbers of adjacent zeroes
end