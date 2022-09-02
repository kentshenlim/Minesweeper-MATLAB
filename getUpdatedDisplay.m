function updatedDisplay = getUpdatedDisplay(r, c, currentDisplay, mineMap, mineCount)
% Compute and return displayed map after player choose a slot
% Input: number of row then number of column then currentDisplay then mineCount
% Output: latest map, 0 means closed, 1 means flipped
% Space out, bounded by non-zero mine count
isMine = mineMap(r,c);
adjacentMine = mineCount(r,c);
if isMine == 1
    currentDisplay(mineCount~=0) = 1; % Reveal mine location
    disp('You Lose!')
else
    if adjacentMine ~= 0
        currentDisplay(r,c) = 1; % Reveal only that location
    else
        % Do something
    end
end
updatedDisplay = currentDisplay;
end


