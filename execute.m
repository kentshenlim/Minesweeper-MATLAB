classdef execute < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        Toolbar       matlab.ui.container.Toolbar
        EasyChoice    matlab.ui.container.toolbar.PushTool
        MediumChoice  matlab.ui.container.toolbar.PushTool
        HardChoice    matlab.ui.container.toolbar.PushTool
        GridLayout    matlab.ui.container.GridLayout
    end

    
    properties (Access = private)
        gridRow % Total number of rows in game
        gridColumn % Total number of columns in game
        gridMine % Total number of mines in game
        mineMap % Location of mines; 1 means mine 0 means safe
        isFirstClick % Boolean to differentiate first and non-first click; first will generate mineMap
        mineCount % Showing number of adjacent mines of current entry
        currentDisplay % 0 means unrevealed, 1 means revealed
        clickToWin % When reach 0, user wins
    end
    
    methods (Access = private)
        function [] = initiateProperty(app)
            initiateGrid(app)
            app.isFirstClick = true;
            app.currentDisplay = buildInitialDisplay(app.gridRow, app.gridColumn);
        end
        
        function [] = initiateGrid(app)
            set(app.UIFigure, "visible", "off")
            disp("Running")
            r = app.gridRow;
            c = app.gridColumn;
            % Set up grid row and column width
            rowCell = [repmat({'1x'}, 1, r)];
            columnCell = [repmat({'1x'}, 1, c)];
            delete(app.GridLayout.Children)  % Must delete, if not going back to easy level the children will still be there
            app.GridLayout.RowHeight = rowCell;
            app.GridLayout.ColumnWidth = columnCell;
            % Create buttons for cells
            count = 1;
            for i = 1:r
                for j = 1:c
                    btnHandleStr = sprintf("app.Button%.0d", count);
                    count = count + 1;
                    btnHandle = str2func(btnHandleStr);
                    btnHandle = uibutton(app.GridLayout, 'push');
                    btnHandle.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
                    btnHandle.Text = "";
                    btnHandle.Layout.Row = i;
                    btnHandle.Layout.Column = j;
                end
            end
            disp("Done")
            app.UIFigure.Position = [100, 100, 30*c, 30*r]; % 30px per cell
            movegui(app.UIFigure, "center")
            set(app.UIFigure, "visible", "on")
        end

        function [] = ButtonPushed(app, event)
            rowChosen = event.Source.Layout.Row;
            columnChosen = event.Source.Layout.Column;
            if (app.isFirstClick)
                app.mineMap = buildMineMap(app.gridRow, app.gridColumn, app.gridMine, rowChosen, columnChosen);
                app.mineCount = buildAdjacentMineCount(app.mineMap);
                app.isFirstClick = false;
                app.clickToWin = app.gridRow*app.gridColumn;
            end
            updateResultAndDisplay(app, rowChosen, columnChosen)
        end
        
        function [] = updateResultAndDisplay(app, rowChosen, columnChosen)
            previousDisplay = app.currentDisplay;
            app.currentDisplay = getUpdatedDisplay(rowChosen, columnChosen, previousDisplay, app.mineMap, app.mineCount);
            app.clickToWin = getSafeSpotNum(app.mineMap, app.currentDisplay);
            if app.clickToWin == 0
                app.currentDisplay = ones(app.gridRow, app.gridColumn); % Show all mine location after victory
            end
            isDifferent = (previousDisplay ~= app.currentDisplay);
            for i = 1:app.gridRow
                for j = 1:app.gridColumn
                    if isDifferent(i, j)
                        number = (i - 1)*app.gridColumn + j; % Numbering of button in children array is rowwise
                        buttonHandle = app.GridLayout.Children(number);
                        flipCell(app, buttonHandle, i, j)
                    end
                end
            end

        end
        
        function [] = flipCell(app, handle, rowChosen, columnChosen)
            if app.mineMap(rowChosen, columnChosen) == 1 % If this is a mine
                set(handle, "enable", "off", "Icon", "img/voltorb.svg")
            else
                number = app.mineCount(rowChosen, columnChosen);
                if number == 0
                    set(handle, "enable", "off", "BackgroundColor", [0.90, 0.90, 0.90], "Icon", "img/pikachu.png")
                else
                    set(handle, "enable", "off", "BackgroundColor", [0.47, 0.67, 0.19], "Text", num2str(number), "FontWeight", "bold")
                end
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           [app.gridRow, app.gridColumn, app.gridMine] = setDifficulty(2); % Default difficulty is medium
           set(app.UIFigure, "Name", "Kent's Minesweeper MATLAB")
           initiateProperty(app)
        end

        % Clicked callback: EasyChoice
        function EasyChoiceClicked(app, event)
            [app.gridRow, app.gridColumn, app.gridMine] = setDifficulty(1);
            initiateProperty(app)
        end

        % Clicked callback: MediumChoice
        function MediumChoiceClicked(app, event)
            [app.gridRow, app.gridColumn, app.gridMine] = setDifficulty(2);
            initiateProperty(app)
        end

        % Clicked callback: HardChoice
        function HardChoiceClicked(app, event)
            [app.gridRow, app.gridColumn, app.gridMine] = setDifficulty(3);
            initiateProperty(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.902 0.902 0.902];
            app.UIFigure.Position = [100 100 300 240];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';
            app.UIFigure.Pointer = 'crosshair';

            % Create Toolbar
            app.Toolbar = uitoolbar(app.UIFigure);

            % Create EasyChoice
            app.EasyChoice = uipushtool(app.Toolbar);
            app.EasyChoice.Tooltip = {'Easy'};
            app.EasyChoice.ClickedCallback = createCallbackFcn(app, @EasyChoiceClicked, true);
            app.EasyChoice.Icon = fullfile(pathToMLAPP, 'img', 'easy.svg');

            % Create MediumChoice
            app.MediumChoice = uipushtool(app.Toolbar);
            app.MediumChoice.Tooltip = {'Medium'};
            app.MediumChoice.ClickedCallback = createCallbackFcn(app, @MediumChoiceClicked, true);
            app.MediumChoice.Icon = fullfile(pathToMLAPP, 'img', 'medium.svg');

            % Create HardChoice
            app.HardChoice = uipushtool(app.Toolbar);
            app.HardChoice.Tooltip = {'Hard'};
            app.HardChoice.ClickedCallback = createCallbackFcn(app, @HardChoiceClicked, true);
            app.HardChoice.Icon = fullfile(pathToMLAPP, 'img', 'hard.svg');

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = execute

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end