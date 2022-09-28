# Minesweeper-MATLAB
Minesweeper GUI written to practice MATLAB. Slow project.  

# Function stubs  
In expected order of execution  
- [x] getMineMap: initiate mine locations as a matrix at the beginning of each game  
- [x] getAdjacentFragment: return a fragment matrix, for checking of adjacent cells, in getAdjacentMineCount and getZeroPool  
- [x] getAdjacentMineCount: return a matrix, with entry showing number of adjacent mines, to be displayed to player  
- [x] getSafeSpotNum: return number of cell to be revealed before victory  
- [x] getWinOrLose: return 1 if okay, return 0 if lose, executed every time the player make a choice  
- [x] getAllZero: return a cell aray containing coordinates of cell with no adjacent mine  
- [x] getZeroPool: this will return a cell array containing the [r,c] of connected zeros of selected cell   
- [ ] getUpdatedDisplay: return a matrix, 0 means closed, 1 means flipped, responding to user's choice  


# Upcoming Features
- [ ] Make grids with function, input number, depending on difficulty levels  
- [ ] Randomize location of mines, also input depending on difficulty levels  
- [ ] Counter function, to count the number of adjacent mines  
- [ ] Click events, including RC flag  
- [ ] Flags remaining, smiley/crying face, time  
