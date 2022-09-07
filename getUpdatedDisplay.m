function updatedDisplay = getUpdatedDisplay(r, c, currentDisplay, mineMap, mineCount)
% Compute and return displayed map after player choose a slot
% Input: chosen row then column number, current display, mine map and mine
% and mine count
% Output: latest map, 0 means closed, 1 means flipped
% Space out, bounded by non-zero mine count
isMine = mineMap(r,c);
adjacentMine = mineCount(r,c);
if isMine == 1
    currentDisplay(mineCount~=0) = 1; % Reveal all mine locations
    disp('You Lose!')
else
    if adjacentMine ~= 0
        currentDisplay(r,c) = 1; % Reveal only that location
    else
        % Do something to find pools of zero adjacent mine!
    end
end
updatedDisplay = currentDisplay;
end


