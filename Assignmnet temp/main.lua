-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- requrie things
local widget = require( "widget" ) -- require widget

-- hide status bar
display.setStatusBar( display.HiddenStatusBar)

------------------------------------------------------------------------------------------- box
local scrollRect = display.newRect( 0, 0, display.contentWidth-30, 40)
scrollRect:setFillColor( 1, 1, 1 )
scrollRect.x = display.contentCenterX; scrollRect.y = display.contentHeight-60


------------------------------------------------------------------------------------- button
-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end
 
-- Create the widget
local buttonRight = widget.newButton(
    {
        id = "button1",
        label = ">>",
        onEvent = handleButtonEvent,
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
        onEvent = handleButtonEvent,
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
        onEvent = handleButtonEvent,
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
        onEvent = handleButtonEvent,
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
        onEvent = handleButtonEvent,
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
        onEvent = handleButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={0.8,0,0,1} },
        strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)
buttonExit.x =  display.contentCenterX +120; buttonExit.y = display.contentHeight -460

buttonAbout.x =  display.contentCenterX -120; buttonAbout.y = display.contentHeight -460

buttonUpload.x =  display.contentCenterX -115; buttonUpload.y = display.contentHeight -15

buttonSubmit.x =  display.contentCenterX +115; buttonSubmit.y = display.contentHeight-15

buttonRight.x =  display.contentCenterX +115; buttonRight.y = display.contentHeight-60

ButtonLeft.x =  display.contentCenterX -115; ButtonLeft.y = display.contentHeight-60








