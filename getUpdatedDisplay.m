function updatedDisplay = getUpdatedDisplay(r, c, currentDisplay, mineMap, mineCount)
% Decide what to reveal after the player chooses a cell
% Input: chosen row then column number, current display, mine map and mine
% count
% Output: if lose say so, else latest map, 0 means closed, 1 means revealed
if getWinOrLose(mineMap, r, c) == 0
    disp("You lose!")
    updatedDisplay = ones(size(mineMap)); % Reveal out
    return; % Stop here
else
    adjacentMine = mineCount(r, c);
    if adjacentMine ~= 0
        currentDisplay(r,c) = 1; % Reveal only that location
    else
        toBeRevealed = getZeroPool(mineCount, r, c);
        for i = 1:length(toBeRevealed)
            coordinate = toBeRevealed{i};
            currentDisplay(coordinate(1), coordinate(2)) = 1; % Reveal all zeros in same pool
        end
    end
    updatedDisplay = currentDisplay; % Output the modified display
end
end