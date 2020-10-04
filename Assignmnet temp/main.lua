-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- requrie things
local widget = require( "widget" ) -- require widget

-- hide status bar
display.setStatusBar( display.HiddenStatusBar)
------------------------------------------------------------------------------------- events
-- template
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

--Function to handle AboutApp button events
--this will need two different phases, one two open the about, and one to close it again
local function AboutAppButtonEvent(event)
  
    if ("ended" == event.phase) then
        print( "The AboutApp Button was pressed")
    end
end
 
--Function to handle Quit button events
local function QuitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Quit Button was pressed and released")
    end
end

--UploadFile 
--Function to handle UploadFile button events
--this will want to upload a file into the project resources, and read in the data
local function UploadFileButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The UploadFile Button was pressed and released")
    end
end

--Submit
--Function to handle Submit button events
-- this will want to apply the desired algorithm to the supplies data, and display the results on screen
local function SubmitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Submit Button was pressed and released")
    end
end

--AlgorithmLeft
--Function to handle AlgorithmLeft button events
--this will want to move to the previous algorithm option in a list
local function AlgorithmLeftButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmLeft Button was pressed and released")
    end
end

--AlgorithmRight
--Function to handle AlgorithmRight button events
--this will want to move to the next algorithm option in a list
local function AlgorithmRightButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmRight Button was pressed and released")
    end
end
------------------------------------------------------------------------------------------- create Algorithm name
local scrollRect = display.newRect( 0, 0, display.contentWidth-30, 40)
scrollRect:setFillColor( 1, 1, 1 )
scrollRect.x = display.contentCenterX; scrollRect.y = display.contentHeight-60
algorithmDisplay = display.newText("Algorithm",display.contentCenterX ,display.contentHeight-60 ,"Arial", 20)
algorithmDisplay: setFillColor(0,0,0,1)
------------------------------------------------------------------------------------- create button
-- Create the widget
local buttonRight = widget.newButton(
    {
        id = "button1",
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

-- Create the widget
local ButtonLeft = widget.newButton(
    {
        id = "button1",
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

-- Create the widget
local buttonUpload = widget.newButton(
    {
        id = "button1",
        label = "Upload",
        onEvent =  UploadFileButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the widget
local buttonSubmit = widget.newButton(
    {
        id = "button1",
        label = "Submit",
        onEvent = SubmitButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the widget
local buttonAbout = widget.newButton(
    {

        id = "button1",
        label = "?",
        onEvent = AboutAppButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = {  default={0,1,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

-- Create the widget
local buttonExit = widget.newButton(
    {
        id = "button1",
        label = "X",
        onEvent = QuitButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={0.8,0,0,1} },
        strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)
------------------------------------------------------------------------------------- button placement
buttonExit.x =  display.contentCenterX +120; buttonExit.y = display.contentHeight -460

buttonAbout.x =  display.contentCenterX -120; buttonAbout.y = display.contentHeight -460

buttonUpload.x =  display.contentCenterX -115; buttonUpload.y = display.contentHeight -15

buttonSubmit.x =  display.contentCenterX +115; buttonSubmit.y = display.contentHeight-15

buttonRight.x =  display.contentCenterX +115; buttonRight.y = display.contentHeight-60

ButtonLeft.x =  display.contentCenterX -115; ButtonLeft.y = display.contentHeight-60






