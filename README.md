# Minesweeper-MATLAB
Minesweeper GUI written to practice MATLAB.  

# Function Stubs  
In expected order of execution  
- [x] buildMineMap: initiate mine locations as a matrix at the beginning of each game  
- [x] getAdjacentFragment: return a fragment matrix, for checking of adjacent cells, in getAdjacentMineCount and getZeroPool  
- [x] buildAdjacentMineCount: return a matrix, with entry showing number of adjacent mines, to be displayed to player  
- [x] getSafeSpotNum: return number of safe cell to be revealed before victory  
- [x] isProceed: return true if okay, return false if lose, executed every time the player make a choice  
- [x] getZeroPool: this will return a cell array containing the [r,c] of connected zeros of selected cell   
- [x] getUpdatedDisplay: return a matrix, 0 means closed, 1 means revealed, responding to user's choice, including lose  

# Upcoming Changes  
- [ ] Make a difficulty function. Three difficult, this function will pass to buildMineMap and buildGrid  
- [ ] The getSafeSpotNum could be phased out by simply writing a function that reduces an initial count by 1 after each move  
- [ ] Make grids with function, input number, depending on difficulty levels  
- [ ] Click events, including RC flag  
- [ ] Flags remaining, smiley/crying face, time  
