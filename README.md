# Minesweeper-MATLAB
Minesweeper GUI written to practice MATLAB. Slow project.  

# Function stubs
- [x] getMineMap: initiate mine locations as a matrix  
- [x] getAdjacentMineCount: return a matrix, with entry showing number of adjacent mines  
- [x] getSafeSpotNum: return number of cell to be revealed before victory  
- [ ] getUpdatedDisplay: return a matrix, 0 means closed, 1 means flipped, responding to user's choice  
- [ ] getZeroPool: return two vectors to know which spots to be revealed when a user pick a spot without adjacent mine  
- [x] getAdjacentFragment: return a fragment matrix, for checking of adjacent cells, in getAdjacentMineCount and getZeroPool  

# Upcoming Features
- [ ] Make grids with function, input number, depending on difficulty levels  
- [ ] Randomize location of mines, also input depending on difficulty levels  
- [ ] Counter function, to count the number of adjacent mines  
- [ ] Click events, including RC flag  
- [ ] Flags remaining, smiley/crying face, time  
