-----------------------------------------------------------------------------------------
-- main.lua
--Group Name: The Mob Squad
-- Samiollah Ranjbar - 10482589
-- Megan Dwyer - 
----------------------------------------------------------------------------------------- Initialise things
-- require things
local widget = require( "widget" ) -- require widget

-- hide status bar
display.setStatusBar( display.HiddenStatusBar)

-- make groups
local helpGroup = display.newGroup()

-- Make the Y axis -- Make Graph _H -- Make third_H
local _H = display.screenOriginY + 50; local second_H = _H  + 50; local third_H = _H +640

-- Make the X axis  -- Make second_W  
local _W = display.screenOriginX + 65; graph_W = _W -40; local second_W = _W + 370; --exit_W = _W +250

-- Create empty table
local CapturedLine = {}

-- Create background
local backGround = display.newRect(display.contentCenterX, display.contentCenterY,display.actualContentWidth+200,display.actualContentHeight+400, 0.1); 
backGround.alpha = 1

-- info here will go into help text box
local HelpTextInfo = ("This is some text\nThis is some more text\nWhat the hell is this fucking assignment ")
------------------------------------------------------------------------------------------- The Algorithms
local algorithmList = {"Algorithm 1", "Algorithm 2", "Algorithm 3"}
choice = 0

------------------------------------------------------------------------------------------- display algorithm name

local scrollRect = display.newRect( display.contentCenterX, third_H, 400, 70); scrollRect:setFillColor(0.8);
algorithmDisplay = display.newText("Select Algorithm",display.contentCenterX ,third_H ,"Arial", 28); algorithmDisplay: setFillColor(0,0,0,1)

------------------------------------------------------------------------------------------- graph
-- create graph
local WidthCounter = 11
local YnumberCounter = 13
-- Y line
local YLineLocation = 0
_HEnd = _H +590
for num = 1, WidthCounter do
    if num == 6 then
        boxLines = display.newLine(graph_W+ (YLineLocation), second_H ,graph_W +(YLineLocation),_HEnd);
        boxLines:setStrokeColor( 1, 0, 0, 1 ); boxLines.strokeWidth = 3
    end
    boxLines = display.newLine(graph_W + (YLineLocation), second_H , graph_W +(YLineLocation), _HEnd);
    boxLines:setStrokeColor( 0, 0, 0, 0.3 ); boxLines.strokeWidth = 2
    YLineLocation = YLineLocation + 45
end

-- X line
local XLineLocation = 0
_WEnd = _W + 410
for num = 1, YnumberCounter do
    if num == 7 then
        boxLines = display.newLine(graph_W, second_H + (XLineLocation),_WEnd, second_H + (XLineLocation));
        boxLines:setStrokeColor( 1, 0, 0, 1 ); boxLines.strokeWidth = 3
    end
    boxLines = display.newLine(graph_W, second_H + (XLineLocation),_WEnd, second_H + (XLineLocation));
    boxLines:setStrokeColor( 0, 0, 0, 0.3 ); boxLines.strokeWidth = 2
    XLineLocation = XLineLocation + 45
end

-- numbers -- place numbers code here

------------------------------------------------------------------------------------------- dot on graph
-- palce dot plot code here


------------------------------------------------------------------------------------------- Make Group
-- make groups
local helpGroup = display.newGroup()
------------------------------------------------------------------------------------------- help text box info
second_H = second_H +25
local DisplayHelpText = display.newText(HelpTextInfo, _W + 190, second_H +25, native.systemFont, 25);
DisplayHelpText:setFillColor(1,0,0)
second_H = second_H +165

-- create text box
local helptextBox = display.newRect(display.contentCenterX, second_H + 80,display.contentWidth-30,display.contentHeight*1.08);
helptextBox:setFillColor(1,1,1,1)

helpGroup:insert(helptextBox); helpGroup:insert(DisplayHelpText); 
helpGroup.alpha = 1

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
function UploadFileButtonEvent(event)
    
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
                algorithmDisplay.text = "Data Uploaded"
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
            --call the logX function
        elseif (choice == 2) then
            print( algorithmList[choice].." algorithm applied")
            --call the logY function
        elseif (choice == 3) then
            print( algorithmList[choice].." algorithm applied")
            --call the other function
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
        id = "bupload",
        label = "Upload",
        font = "Arial",
        fontSize = 30,
        onEvent =  UploadFileButtonEvent,
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
buttonAbout.x = _W ; buttonAbout.y = _H

-- Exit button placement
buttonExit.x = second_W; buttonExit.y = _H

-- Left button placement
buttonLeft.x =  _W ; buttonLeft.y = third_H

-- Right button placement
buttonRight.x = second_W; buttonRight.y = third_H

-- Make lower button _H location
third_H = third_H +85

-- Upload button placement
buttonUpload.x =  _W ; buttonUpload.y = third_H

-- apply button placement
buttonApply.x = second_W; buttonApply.y = third_H
