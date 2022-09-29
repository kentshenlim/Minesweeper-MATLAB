function [] = buildGrid(r, c)
% Build the grid!
% Input: r = row number, c = column number
% Output: none
% Format of call: buildGrid(r, c)
close all
%% Main figure
f = figure("Name", "Minesweeper-MATLAB", "Units", "normalized", ...
    "Visible", "off", "Color", [.8, .8 ,.8]);
movegui(f, "center")
set(f, "Visible", "on")

%% Grid cell dimension calculation
widthCanva = 0.8;
widthPerCell = widthCanva/c; % Also equal to height per cell
heightCanva = widthPerCell*r;
panel = uipanel(f, "Title", "Test")

