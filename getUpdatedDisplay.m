function updatedDisplay = getUpdatedDisplay(r, c, currentDisplay, mineCount)
% Compute and return displayed map after player choose a slot
% Input: number of row then number of column then currentDisplay then mineCount
% Output: latest map, 0 means closed, 1 means flipped
% Space out, bounded by non-zero mine count
currentMineCount = mineCount(r,c);
if currentMineCount != 0
    currentDisplay(mineCount!=0) = 1; % Reveal mine location
    disp('You Lose!')
else
    
