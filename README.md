# Minesweeper-MATLAB
Minesweeper with GUI written to practice MATLAB.  

# Function Stubs Backend  
In expected order of execution  
- [x] setDifficulty: decide the r, c and number of mines to be passed to build functions (USED)   
- [x] buildMineMap: initiate mine locations as a matrix at the beginning of each game (USED)  
- [x] getAdjacentFragment: return a fragment matrix, for checking of adjacent cells, in getAdjacentMineCount and getZeroPool (USED)  
- [x] buildAdjacentMineCount: return a matrix, with entry showing number of adjacent mines, to be displayed to player (USED)  
- [x] buildInitialDisplay: initiate current display at the beginning, all 0, 0 means unrevealed, 1 means revealed (USED)  
- [x] getSafeSpotNum: return number of safe cell to be revealed before victory  
- [x] isProceed: return true if okay, return false if lose, executed every time the player make a choice  
- [x] getZeroPool: this will return a cell array containing the [r,c] of connected zeros of selected cell   
- [x] getUpdatedDisplay: return a matrix, 0 means closed, 1 means revealed, responding to user's choice, including lose  

# Function Stubs Frontend  
- [ ] buildGrid: initiate grid (UNUSED)  

# Upcoming Changes  
- [ ] The getSafeSpotNum could be phased out by simply writing a function that reduces an initial count by 1 after each move  
- [ ] Make grids with function, input number, depending on difficulty levels  
- [ ] Click events, including RC flag that disables clicking, and hover effect  
- [ ] Flags remaining, smiley/crying face, time  
- [ ] Use rand and pause to set irregular time interval between revealing of mines when lose  
