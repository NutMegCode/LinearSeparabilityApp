-----------------------------------------------------------------------------------------
-- main.lua
--Group Name: The Mob Squad
-- Samiollah Ranjbar - 10482589
-- Megan Dwyer - 
-----------------------------------------------------------------------------------------
-- require things
local widget = require( "widget" ) -- require widget

-- hide status bar
display.setStatusBar( display.HiddenStatusBar)

-- Create empty table
local CapturedLine = {}
------------------------------------------------------------------------------------------- Make Group
-- make groups
local helpGroup = display.newGroup()
local graphGroup = display.newGroup()

------------------------------------------------------------------------------------------- The Algorithms
local algorithmList = {"Algorithm 1", "Algorithm 2", "Algorithm 3"}
choice = 0

------------------------------------------------------------------------------------------- create Algorithm name
local scrollRect = display.newRect( 0, 0, display.contentWidth-30, 40)
scrollRect:setFillColor( 1, 1, 1 )
scrollRect.x = display.contentCenterX; scrollRect.y = display.screenOriginY +  450
algorithmDisplay = display.newText("Select Algorithm",display.contentCenterX ,display.screenOriginY +  450 ,"Arial", 14)
algorithmDisplay: setFillColor(0,0,0,1)
------------------------------------------------------------------------------------------- help text box info
-- info here will go into help text box
local HelpTextInfo = ("This is some text\nThis is some more text\nWhat the hell is this fucking assignment ")

-- create text box
local helptextBox = display.newRect(display.contentCenterX, display.contentCenterY-40,display.contentWidth-18,display.contentHeight-120);-- helptextBox.alpha = 0
local DisplayHelpText = display.newText(HelpTextInfo, display.contentCenterX - 10, display.contentCenterY-190, native.systemFont, 15);-- DisplayHelpText.alpha = 0
DisplayHelpText:setFillColor(1,0,0)

--peroblem with making the graph
--[[
-- create graph
local graphBox = display.newRect(display.contentCenterX, display.contentCenterY-40,320,620); -- graphBox.alpha = 1
local graphYLine = display.newLine(display.contentCenterX-150, display.contentCenterY-190,display.contentCenterX-150, display.contentCenterY+110); -- graphYLine.alpha = 1
local graphXLine = display.newLine(display.contentCenterX+150, display.contentCenterY+110,display.contentCenterX-150, display.contentCenterY+110); -- graphXLine.alpha = 1
graphYLine:setStrokeColor( 1, 0, 0, 1 ); graphYLine.strokeWidth = 2
graphXLine:setStrokeColor( 1, 0, 0, 1 ); graphXLine.strokeWidth = 2
]]

helpGroup:insert(helptextBox); helpGroup:insert(DisplayHelpText); 
helpGroup.alpha = 0
--graphGroup:insert(graphBox);graphGroup:insert(graphYLine);graphGroup:insert(graphXLine);
--graphGroup.alpha = 1
------------------------------------------------------------------------------------------- create Algorithm functions
--------------- Change Algorithm left
--Function to handle AlgorithmLeft button events, this will want to move to the previous algorithm option in a list
function AlgorithmLeftButtonEvent(event)
 
    if ("ended" == event.phase) then
        choice = choice - 1
        if (choice <= 0) then
            choice = #algorithmList
        end        
        --print(choice)
        print(algorithmList[choice].." selected")
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
        print(choice)
        print(algorithmList[choice].." selected")
        algorithmDisplay.text = algorithmList[choice]
        --apply the actual algorithm
    end
end

--------------- About program
--Function to handle AboutApp button events, this will need two different phases, one two open the about, and one to close it again
function AboutAppButtonEvent(event)
    if ( event.numTaps == 1 ) then
        graphGroup.alpha = 0; helpGroup.alpha = 1
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
            -- Display Graph
            --graphGroup.alpha = 1
            -- Else capture every element seperately in each line
            local counter = 1
            for line in file:lines() do
                local yAxisChar, xAxisChar, groupTypeChar = line:match("([^Y]*),([^X]*),([^G]*)")
                CapturedLine[counter] = {yAxisNum = tonumber(yAxisChar), xAxisNum = tonumber(xAxisChar), groupType = groupTypeChar}
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
            print(CapturedLine[counter].yAxisNum ..', '..CapturedLine[counter].xAxisNum..','..CapturedLine[counter].groupType)
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
        onEvent = AlgorithmLeftButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
    
)

-- Create the right button widget
local buttonRight = widget.newButton(
    {
        id = "bright",
        label = ">>",
        onEvent = AlgorithmRightButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = { default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
        
    }
)

-- Create the about button widget
local buttonAbout = widget.newButton(
    {
        id = "babout",
        label = "?",
        onEvent = AboutAppButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the upload button widget
local buttonUpload = widget.newButton(
    {
        id = "bupload",
        label = "Upload",
        onEvent =  UploadFileButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the submit button widget
local buttonApply = widget.newButton(
    {
        id = "bapply",
        label = "Apply",
        onEvent = ApplyButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the exit button widget
local buttonExit = widget.newButton(
    {
        id = "bexit",
        label = "X",
        onEvent = QuitButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 38,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={0.8,0,0,1} },
        strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

------------------------------------------------------------------------------------------- button placement
-- Left button placement
--buttonLeft.x =  display.contentCenterX -115; buttonLeft.y = display.contentHeight-60
buttonLeft.x = display.screenOriginX + 43; buttonLeft.y = display.screenOriginY +  450

-- Right button placement
--buttonRight.x =  display.contentCenterX +115.5; buttonRight.y = display.contentHeight-60
buttonRight.x = display.screenOriginX + 276; buttonRight.y = display.screenOriginY +  450

-- About button placement and listener
buttonAbout:addEventListener( "tap", AboutAppButtonEvent )
--buttonAbout.x =  display.contentCenterX -125; buttonAbout.y = display.contentHeight -460
buttonAbout.x = display.screenOriginX + 34; buttonAbout.y = display.screenOriginY + 40

-- Upload button placement
--buttonUpload.x =  display.contentCenterX -115; buttonUpload.y = display.contentHeight -15
buttonUpload.x = display.screenOriginX + 43; buttonUpload.y = display.screenOriginY + 500

-- apply button placement
--buttonApply.x =  display.contentCenterX +115.5; buttonApply.y = display.contentHeight-15
buttonApply.x = display.screenOriginX + 276; buttonApply.y = display.screenOriginY + 500

-- Exit button placement
--buttonExit.x =  display.contentCenterX +125; buttonExit.y = display.contentHeight -460
buttonExit.x = display.screenOriginX + 285; buttonExit.y = display.screenOriginY + 40
