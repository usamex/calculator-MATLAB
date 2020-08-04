function calculator()
%% Variables
    math_string = '';
    result = 0;
    screenSize = get(groot, 'ScreenSize');
    figSize = [400, 550];
    panelSize = [250, 275];
    figPosition = [(screenSize(3:4) - figSize)/2, figSize];
    panelPosition = [25, 100, panelSize];
%% Build GUI
    hFig = uifigure('Position', figPosition, 'Name', 'My Application', ...
       'Color', 0.8*ones(1, 3));
    % Panel
    hPanel = uipanel(hFig, 'Position', panelPosition, ...
        'BackgroundColor', [0.8 0.8 0.8]);
    
    hEditMath = uieditfield(hFig, 'Position', ...
        [25, 450, 350, 75], 'Editable', 'off', 'FontSize', 20);
    % Numbers inside Panel
    hButtN_1 = uibutton(hPanel, 'Text', '1', 'Position', ...
        [25, 225, 50, 50], 'FontSize', 30);
    hButtN_2 = uibutton(hPanel, 'Text', '2', 'Position', ...
        [100, 225, 50, 50], 'FontSize', 30);
    hButtN_3 = uibutton(hPanel, 'Text', '3', 'Position', ...
        [175, 225, 50, 50], 'FontSize', 30);
    hButtN_4 = uibutton(hPanel, 'Text', '4', 'Position', ...
        [25, 150, 50, 50], 'FontSize', 30);
    hButtN_5 = uibutton(hPanel, 'Text', '5', 'Position', ...
        [100, 150, 50, 50], 'FontSize', 30);
    hButtN_6 = uibutton(hPanel, 'Text', '6', 'Position', ...
        [175, 150, 50, 50], 'FontSize', 30);
    hButtN_7 = uibutton(hPanel, 'Text', '7', 'Position', ...
        [25, 75, 50, 50], 'FontSize', 30);
    hButtN_8 = uibutton(hPanel, 'Text', '8', 'Position', ...
        [100, 75, 50, 50], 'FontSize', 30);
    hButtN_9 = uibutton(hPanel, 'Text', '9', 'Position', ...
        [175, 75, 50, 50], 'FontSize', 30);
    hButtN_0 = uibutton(hPanel, 'Text', '0', 'Position', ...
        [100, 0, 50, 50], 'FontSize', 30);
    

    
    % Buttons
    hButtPlus = uibutton(hFig, 'Text', '+', 'Position', ...
        [325, 325, 50, 50], 'FontSize', 30);
    hButtMinus = uibutton(hFig, 'Text', '-', 'Position', ...
        [325, 250, 50, 50], 'FontSize', 20);
    hButtMult = uibutton(hFig, 'Text', '*', 'Position', ...
        [325, 175, 50, 50], 'FontSize', 20);
    hButtDivide = uibutton(hFig, 'Text', '/', 'Position', ...
        [325, 100, 50, 50], 'FontSize', 30);
    hButtEqual = uibutton(hFig, 'Text', '=', 'Position', ...
        [325, 25, 50, 50], 'FontSize', 30);
    % Other Buttons
    hButtSqrt = uibutton(hFig, 'Text', 'SQRT', 'Position', ...
        [250, 25, 50, 50], 'FontSize', 15);
    hButtSqr = uibutton(hFig, 'Text', '^', 'Position', ...
        [175, 25, 50, 50], 'FontSize', 20);
    hButtPar = uibutton(hFig, 'Text', ')', 'Position', ...
        [125, 25, 25, 50], 'FontSize', 20);
    hButtPar2 = uibutton(hFig, 'Text', '(', 'Position', ...
        [100, 25, 25, 50], 'FontSize', 20);
    hButtClr = uibutton(hFig, 'Text', 'CLR', 'Position', ...
        [25, 25, 50, 50], 'FontSize', 20);
    hButtDel = uibutton(hFig, 'Text', 'DEL', 'Position', ...
        [325, 400, 50, 25], 'FontSize', 15);

%% Callbacks
  % Operator callbacks
    hButtMinus.ButtonPushedFcn = @(a, b)minusBtnPushed();
    hButtPlus.ButtonPushedFcn = @(a, b)plusBtnPushed();
    hButtDivide.ButtonPushedFcn = @(a, b)divideBtnPushed();
    hButtMult.ButtonPushedFcn = @(a, b)multBtnPushed();
    hButtEqual.ButtonPushedFcn = @(a, b)eqBtnPushed();
    hButtSqr.ButtonPushedFcn = @(a, b)sqrBtnPushed();
    hButtSqrt.ButtonPushedFcn = @(a, b)sqrtBtnPushed();
    hButtPar.ButtonPushedFcn = @(a, b)parBtnPushed();
    hButtPar2.ButtonPushedFcn = @(a, b)par2BtnPushed();
    hButtClr.ButtonPushedFcn = @(a, b)ClrBtnPushed();
    hButtDel.ButtonPushedFcn = @(a, b)DelBtnPushed();
    
  % Number callbacks
    hButtN_0.ButtonPushedFcn = @(a, b)zeroBtnPushed();
    hButtN_1.ButtonPushedFcn = @(a, b)oneBtnPushed();
    hButtN_2.ButtonPushedFcn = @(a, b)twoBtnPushed();
    hButtN_3.ButtonPushedFcn = @(a, b)threeBtnPushed();
    hButtN_4.ButtonPushedFcn = @(a, b)fourBtnPushed();
    hButtN_5.ButtonPushedFcn = @(a, b)fiveBtnPushed();
    hButtN_6.ButtonPushedFcn = @(a, b)sixBtnPushed();
    hButtN_7.ButtonPushedFcn = @(a, b)sevenBtnPushed();
    hButtN_8.ButtonPushedFcn = @(a, b)eightBtnPushed();
    hButtN_9.ButtonPushedFcn = @(a, b)nineBtnPushed();

  % Close window callback
    hFig.WindowKeyPressFcn = @(src, eventData)keyListener(eventData);

%% Save data to GUI
    setappdata(hEditMath, 'result', math_string);
    
%% Callback Functions

    function plusBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
        if ~isempty(new_math_string) && ...
                ismember(new_math_string(end), '0123456789)i')
            new_math_string = append(old_math_string, ' + ');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function minusBtnPushed()        
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
         if ~isempty(new_math_string) && ...
         ismember(new_math_string(end), '0123456789)i')
     
            new_math_string = append(old_math_string, ' - ');
         
         elseif isempty(new_math_string) || ...
                 ismember(new_math_string(end), ' (^')
             new_math_string = append(old_math_string, '-');
         
         end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function divideBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
         if ~isempty(new_math_string) && ...
                ismember(new_math_string(end), '0123456789)i')
            new_math_string = append(old_math_string, ' / ');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);    
    end

    function multBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
         if ~isempty(new_math_string) && ...
                ismember(new_math_string(end), '0123456789)i')
            new_math_string = append(old_math_string, ' * ');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function eqBtnPushed()
        math_string = getappdata(hEditMath, 'result');
        try
            result = eval(str2sym(math_string));
            str_result = char(string(result));
            hEditMath.Value = str_result;
            setappdata(hEditMath, 'result', str_result);
        catch
            errordlg('There is something wrong with the equation.','Math Error');
        end
    end

    function sqrtBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;

        if isempty(new_math_string) || ...
                ismember(new_math_string(end), ' (-^')
            new_math_string = append(new_math_string, 'sqrt(');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function sqrBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
        if ~isempty(new_math_string) && ...
                ismember(new_math_string(end), '0123456789)i')
            new_math_string = append(old_math_string, ' ^');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function par2BtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
        if isempty(new_math_string) || ...
                ismember(new_math_string(end), ' ^(-t')
            new_math_string = append(new_math_string, '(');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function parBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
        
        if ~isempty(new_math_string) && ...
            ismember(new_math_string(end), '0123456789)')
            new_math_string = append(new_math_string, ')');
        end
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function ClrBtnPushed()
        hEditMath.Value = '';
        setappdata(hEditMath, 'result', '');
    end

    function DelBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = old_math_string;
        
        if ~isempty(old_math_string) && ...
                ismember(old_math_string(end), ' ') && ...
                ~strcmp(old_math_string, 'Inf')
            new_math_string = old_math_string(1:end-3);
        elseif ~isempty(old_math_string) && ~strcmp(old_math_string, 'Inf')
            new_math_string = old_math_string(1:end-1);
        end
        
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function oneBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '1');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function twoBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '2');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function threeBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '3');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function fourBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '4');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function fiveBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '5');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function sixBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '6');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function sevenBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '7');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function eightBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '8');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);    
    end

    function nineBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '9');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end

    function zeroBtnPushed()
        old_math_string = getappdata(hEditMath, 'result');
        new_math_string = append(old_math_string, '0');
        hEditMath.Value = new_math_string;
        setappdata(hEditMath, 'result', new_math_string);
    end



    function keyListener(eventData)
        if strcmp(eventData.Key, 'escape')
            closeWindow(hFig);
        end
    end

end

function closeWindow(hFig)
hFig.delete();
end