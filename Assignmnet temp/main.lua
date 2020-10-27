-----------------------------------------------------------------------------------------
-- main.lua
-- Group Name: The Mob Squad
-- Samiollah Ranjbar - 10482589
-- Megan Dwyer - 10389010
----------------------------------------------------------------------------------------- Initialise things
local path = system.pathForFile("data.csv", system.ResorceDirectory)
    -- Create empty table
    local CapturedLine = {}
    -- Open the file handle
    local file, errorString = io.open( path, "r")

    if not file then
        -- Error occured; output cause
        print("Error: " .. errorString)
    else
        -- Else capture every element seperately in each line
        local counter = 1
        for line in file:lines() do
            local yAxisChar, xAxisChar, groupTypeChar = line:match("([^Y]*),([^X]*),([^G]*)")
            CapturedLine[counter] = {groupType = groupTypeChar, yAxisNum = tonumber(yAxisChar), xAxisNum = tonumber(xAxisChar), }
            counter = counter+1
        end
        -- Close the file handle
        io.close( file )
    end
    file = nil
    -- Make total variable max of CapturedLine table
    local total = table.maxn(CapturedLine)
    local counter = 1
    -- Make loop that prints each element in all lines of CapturedLine table
    for num = 1, total, 1 do
        print(CapturedLine[counter].groupType..','..CapturedLine[counter].yAxisNum ..', '..CapturedLine[counter].xAxisNum)
        counter = counter + 1
    end

-- require things
local widget = require( "widget" ) -- require widget

-- hide status bar
display.setStatusBar( display.HiddenStatusBar)

-- make groups
local helpGroup = display.newGroup()

-- Make the Y axis -- Make Graph _H -- Make third_H
local _H = display.screenOriginY + 50; local second_H = _H  + 50; local third_H = _H +660

-- Make the X axis  -- Make second_W  
local _W = display.screenOriginX + 65; graph_W = _W -40; local second_W = _W + 370; --exit_W = _W +250

-- Create background
local backGround = display.newRect(display.contentCenterX, display.contentCenterY,display.actualContentWidth+200,display.actualContentHeight+400, 0.1); 
backGround.alpha = 1;

-- info here will go into help text box
local HelpTextInfo = ("This is some text\nThis is some more text\nWhat the hell is this fucking assignment ")

------------------------------------------------------------------------------------------- The Algorithms
algorithmList = {"powerUp", "lessMore", "logit"}
local choice = 0;

function powerUpAlgorithm(item)
    item = math.floor(math.log(item ^2));
    if (item > 0) then
        item = item - 3
    else 
        item = item + 3
    end
    return item;
end
--highest value = 2, lowest value = -7

function lessMoreAlgorithm(item)
    if (item >0) then
        item = math.floor(item + item^2);
        if (item > 0) then
            item = item - 3
        else 
            item = item + 3
        end
        return item;
    else
        item = math.floor(item - item^2);
        if (item > 0) then
            item = item - 3
        else 
            item = item + 3
        end
        return item;
    end
end
--highest value = 5, lowest value = -4

function logitAlgorithm(item)
    item = math.floor((item + math.mod(item,2)) * math.log(item^2))
    if (item > 0) then
        item = item - 3
    else 
        item = item + 3
    end
    return item;
end
--highest value = 8, lowest value -8



------------------------------------------------------------------------------------------- display algorithm name

local scrollRect = display.newRect( display.contentCenterX, third_H, 400, 68); scrollRect:setFillColor(0.8);
algorithmDisplay = display.newText("Select Algorithm",display.contentCenterX ,third_H ,"Arial", 28); algorithmDisplay: setFillColor(0,0,0,1)

------------------------------------------------------------------------------------------- graph
-- create graph
local XnumberCounter = 11;
local YnumberCounter = 17;
local XnubmerLine = XnumberCounter/2;
local YnubmerLine = YnumberCounter/2;
-- Y line
local YLineLocation = 0;
_HEnd = _H +590;
for num = 1, XnumberCounter do
    if num == 1 then
        boxLines = display.newLine(graph_W, second_H ,graph_W, _HEnd);
        boxLines:setStrokeColor( 1, 0, 0, 1 ); boxLines.strokeWidth = 3;
    end
    boxLines = display.newLine(graph_W + (YLineLocation), second_H , graph_W +(YLineLocation), _HEnd);
    boxLines:setStrokeColor( 0, 0, 0, 0.3 ); boxLines.strokeWidth = 2;
    YLineLocation = YLineLocation + 45
end

-- X line
local XLineLocation = 0;

_WEnd = _W + 410;
for num = 1, YnumberCounter do
    if num == 9 then
        boxLines = display.newLine(graph_W, second_H + (XLineLocation),_WEnd, second_H + (XLineLocation));
        boxLines:setStrokeColor( 1, 0, 0, 1 ); boxLines.strokeWidth = 3;
        
    elseif num == YnumberCounter then
        bottomBoxLines = display.newLine(graph_W, _HEnd,_WEnd, _HEnd);
        bottomBoxLines:setStrokeColor( 1, 0, 0, 1 ); bottomBoxLines.strokeWidth = 3;
    end
    boxLines = display.newLine(graph_W, second_H + (XLineLocation),_WEnd, second_H + (XLineLocation));
    boxLines:setStrokeColor( 0, 0, 0, 0.3 ); boxLines.strokeWidth = 2;
    XLineLocation = XLineLocation + 33.8
end

-- numbers text -- place numbers code here
--X line
local XNumberLocation = 0;
for textnum = 8, -8, -1 do
    XNumDisplay = display.newText(textnum,  graph_W-10 ,second_H + (XNumberLocation),"Arial", 18): setFillColor(0)
    XNumberLocation = XNumberLocation + 33.8
end
-- Y line
local YNumberLocation = 0;
for textnum = 0, 10, 1 do
    XNumDisplay = display.newText(textnum, graph_W + (YNumberLocation), third_H- 50,"Arial", 18): setFillColor(0)
    YNumberLocation = YNumberLocation + 45
end
------------------------------------------------------------------------------------------- Make Group
-- make groups
local helpGroup = display.newGroup()

-- for default graph dot
local defaultGraphGroup = display.newGroup()
-- for powerUp graph dot
local powerUpGraphGroup = display.newGroup()
-- for lessMore graph dot
local lessMoreGraphGroup = display.newGroup()
-- for logit graph dot
local logitGraphGroup = display.newGroup()
------------------------------------------------------------------------------------------- dot on graph
-- palce dot plot code here
-- creaet zero poin  for x and y
local bZeroX = graph_W+45;
local mZeroX = graph_W+45;
local zZeroX = graph_W+45;
local bZeroY = (_HEnd+1);
local mZeroY = (_HEnd+1);
local zZeroY = (_HEnd+1);

pointCounter = 1
if (choice == 0) then
    for num = 1,#CapturedLine do
        if CapturedLine[pointCounter].groupType == 'M' then
            mPoint = display.newCircle((mZeroX) + CapturedLine[pointCounter].yAxisNum,(mZeroY -33.8 *8) + ( 33.8 * -CapturedLine[pointCounter].xAxisNum), 5)
            mPoint:setFillColor(1,0,0,1)
            mZeroX = mZeroX + 44

        elseif CapturedLine[pointCounter].groupType == 'Z' then
            zPoint = display.newCircle((zZeroX) + CapturedLine[pointCounter].yAxisNum,(zZeroY -33.8 *8) + ( 33.8 * -CapturedLine[pointCounter].xAxisNum), 5)
            zPoint:setFillColor(0,1,0,1)
            zZeroX = zZeroX + 44
        
        elseif CapturedLine[pointCounter].groupType =='B' then
            bPoint = display.newCircle((bZeroX) + CapturedLine[pointCounter].yAxisNum,(bZeroY -33.8 *8) + ( 33.8 * -CapturedLine[pointCounter].xAxisNum), 5)
            bPoint:setFillColor(0,0,1,1)
            bZeroX = bZeroX + 44
            print(pointCounter..' '..CapturedLine[pointCounter].xAxisNum)
        end
        pointCounter = pointCounter + 1
    end
    print(choice)
end

defaultGraphGroup:insert(mPoint); defaultGraphGroup:insert(zPoint); defaultGraphGroup:insert(bPoint);
helpGroup.alpha = 0;
------------------------------------------------------------------------------------------- help text box info
second_H = second_H +25;
local DisplayHelpText = display.newText(HelpTextInfo, _W + 190, second_H +25, native.systemFont, 25);
DisplayHelpText:setFillColor(1,0,0)
second_H = second_H +165;

-- create text box
local helptextBox = display.newRect(display.contentCenterX, second_H + 80,display.contentWidth-10,display.contentHeight+100)
helptextBox:setFillColor(1,1,1,1)

helpGroup:insert(helptextBox); helpGroup:insert(DisplayHelpText); 
helpGroup.alpha = 0;

------------------------------------------------------------------------------------------- create buttons
--------------- Change Algorithm left
--Function to handle AlgorithmLeft button events, this will want to move to the previous algorithm option in a list
function AlgorithmLeftButtonEvent(event)
 
    if ("ended" == event.phase) then
        choice = choice - 1
        if (choice <= 0) then
            choice = #algorithmList
        end        
        print(algorithmList[choice].." selected") -- used as a test
        algorithmDisplay.text = algorithmList[choice]
    end
end

--------------- Change Algorithm right
--Function to handle AlgorithmRight button events, this will want to move to the next algorithm option in a list
function AlgorithmRightButtonEvent(event)
 
    if ("ended" == event.phase) then
        choice = choice + 1
        if (choice > #algorithmList) then
            choice = 1
        end        
        print(algorithmList[choice].." selected")  -- used as a test
        algorithmDisplay.text = algorithmList[choice]
        --apply the actual algorithm
    end
end

--------------- About program
--Function to handle AboutApp button events, this will need two different phases, one two open the about, and one to close it again
function AboutAppButtonEvent(event)
    if ( event.numTaps == 1 ) then
        helpGroup.alpha = 1
    elseif ( event.numTaps == 2 ) then
        helpGroup.alpha = 0
    end  
end

--------------- Upload data
--Function to handle UploadFile button events, this will want to upload a file into the project resources, and read in the data
function ResetButtonEvent(event)
    
    if ("ended" == event.phase) then
        local path = system.pathForFile("data.csv", system.ResorceDirectory)
        -- Create empty table
        local CapturedLine = {}
        -- Open the file handle
        local file, errorString = io.open( path, "r")

        if not file then
            -- Error occured; output cause
            print("Error: " .. errorString)
        else
            -- Else capture every element seperately in each line
            local counter = 1
            for line in file:lines() do
                local yAxisChar, xAxisChar, groupTypeChar = line:match("([^Y]*),([^X]*),([^G]*)")
                CapturedLine[counter] = {groupType = groupTypeChar, yAxisNum = tonumber(yAxisChar), xAxisNum = tonumber(xAxisChar), }
                counter = counter+1
                algorithmDisplay.text = "Data Reset"
            end
            -- Close the file handle
            io.close( file )
        end

        file = nil
        -- Make total variable max of CapturedLine table
        local total = table.maxn(CapturedLine)
        local counter = 1
        -- Make loop that prints each element in all lines of CapturedLine table
        for num = 1, total, 1 do
            print(CapturedLine[counter].groupType..','..CapturedLine[counter].yAxisNum ..', '..CapturedLine[counter].xAxisNum)
            counter = counter + 1
        end
    end
end

--------------- Apply alogrithm on data
--Function to handle Submit button events,  this will want to apply the desired algorithm to the supplies data, and display the results on screen
function ApplyButtonEvent(event)
 
    if ("ended" == event.phase) then
        if (choice == 1) then
            print( algorithmList[choice].." algorithm applied")
            print("------------------------------")
            for index = 1, #CapturedLine do
                print(CapturedLine[index].groupType..','..CapturedLine[index].yAxisNum ..', '..powerUpAlgorithm(CapturedLine[index].xAxisNum))
            end
        elseif (choice == 2) then
            print( algorithmList[choice].." algorithm applied")
            print("------------------------------")
            for index = 1, #CapturedLine do
                print(CapturedLine[index].groupType..','..CapturedLine[index].yAxisNum ..', '..lessMoreAlgorithm(CapturedLine[index].xAxisNum))
            end
        elseif (choice == 3) then
            print( algorithmList[choice].." algorithm applied")
            print("------------------------------")
            for index = 1, #CapturedLine do
                print(CapturedLine[index].groupType..','..CapturedLine[index].yAxisNum ..', '..logitAlgorithm(CapturedLine[index].xAxisNum))
            end
        end
    end
end

--------------- Exit program
function QuitButtonEvent(event)
 
    if ("ended" == event.phase) then
        native.requestExit()
        print( "The Quit Button was pressed")
    end
end

------------------------------------------------------------------------------------------- create button
-- Create the left button widget
local buttonLeft = widget.newButton(
    {
        id = "bleft",
        label = "<<",
        font = "Arial",
        fontSize = 30,
        onEvent = AlgorithmLeftButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
    
)

-- Create the right button widget
local buttonRight = widget.newButton(
    {
        id = "bright",
        label = ">>",
        font = "Arial",
        fontSize = 30,
        onEvent = AlgorithmRightButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = { default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
        
    }
)

-- Create the about button widget
local buttonAbout = widget.newButton(
    {
        id = "babout",
        label = "?",
        font = "Arial",
        fontSize = 30,
        onEvent = AboutAppButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

-- Create the upload button widget
local buttonUpload = widget.newButton(
    {
        id = "breset",
        label = "Reset",
        font = "Arial",
        fontSize = 30,
        onEvent =  ResetButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

-- Create the submit button widget
local buttonApply = widget.newButton(
    {
        id = "bapply",
        label = "Apply",
        font = "Arial",
        fontSize = 30,
        onEvent = ApplyButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

-- Create the exit button widget
local buttonExit = widget.newButton(
    {
        id = "bexit",
        label = "X",
        font = "Arial",
        fontSize = 30,
        onEvent = QuitButtonEvent,
        shape = "roundedRect",
        width = 100,
        height = 65,
        cornerRadius = 4,
        fillColor = { default={1,0,0,1}, over={0.8,0,0,1} },
        strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

------------------------------------------------------------------------------------------- button placement
-- About button placement and listener
buttonAbout:addEventListener( "tap", AboutAppButtonEvent )
buttonAbout.x = _W ; buttonAbout.y = _H;

-- Exit button placement
buttonExit.x = second_W; buttonExit.y = _H;

-- Left button placement
buttonLeft.x =  _W ; buttonLeft.y = third_H;

-- Right button placement
buttonRight.x = second_W; buttonRight.y = third_H;

-- Make lower button _H location
third_H = third_H +85;

-- Upload button placement
buttonUpload.x =  _W ; buttonUpload.y = third_H;

-- apply button placement
buttonApply.x = second_W; buttonApply.y = third_H;
