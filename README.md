# Minesweeper-MATLAB
Minesweeper GUI written to practice MATLAB. Slow project.  

# Function stubs
- [x] getMineMap: initiate mine locations as a matrix  
- [x] getAdjacentMineCount: return a matrix, with entry showing number of adjacent mines  
- [x] getSafeSpotNum: return number of cell to be revealed before victory  
- [ ] getUpdatedDisplay: return a matrix, 0 means closed, 1 means flipped, responding to user's choice  
- [x] getAdjacentFragment: return a fragment matrix, for checking of adjacent cells, in getAdjacentMineCount and getZeroPool  
- [x] getAllZero: return a cell aray containing the r and c of cell with no adjacent mine  
- [ ] getZeroPool: with the r and c of all zeroes known, group adjacent ones into group, only need to compute once at the
beginning, when zero picked, unlocked all located within the same group  

# Upcoming Features
- [ ] Make grids with function, input number, depending on difficulty levels  
- [ ] Randomize location of mines, also input depending on difficulty levels  
- [ ] Counter function, to count the number of adjacent mines  
- [ ] Click events, including RC flag  
- [ ] Flags remaining, smiley/crying face, time  
