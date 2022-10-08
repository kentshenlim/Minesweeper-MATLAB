classdef mlapptest < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        DifficultButton  matlab.ui.control.Button
        MediumButton     matlab.ui.control.Button
        EasyButton       matlab.ui.control.Button
    end

    
    properties (Access = private)
        GridLayout
        Button1
    end
    
    methods (Access = private)
        
        function [] = generateGrid(app)
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            r = 8;
            c = 8;
            count = 1;
            for i = 1:r
                for j = 1:c
                    ali = sprintf("app.Button%.0d", count);
                    tooltipText = sprintf('Fuck this button %d!', count);
                    count = count + 1;
                    abu = str2func(ali);
                    abu = uibutton(app.GridLayout, 'push');
                   abu.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
                    abu.Tooltip = {tooltipText};
                    abu.Layout.Row = i;
                    abu.Layout.Column = j;
                end
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: EasyButton
        function EasyButtonPushed(app, event)
            generateGrid(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create EasyButton
            app.EasyButton = uibutton(app.UIFigure, 'push');
            app.EasyButton.ButtonPushedFcn = createCallbackFcn(app, @EasyButtonPushed, true);
            app.EasyButton.Position = [33 429 100 22];
            app.EasyButton.Text = 'Easy';

            % Create MediumButton
            app.MediumButton = uibutton(app.UIFigure, 'push');
            app.MediumButton.Position = [271 429 100 22];
            app.MediumButton.Text = 'Medium';

            % Create DifficultButton
            app.DifficultButton = uibutton(app.UIFigure, 'push');
            app.DifficultButton.Position = [498 429 100 22];
            app.DifficultButton.Text = 'Difficult';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = mlapptest

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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