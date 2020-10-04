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
local scrollRect = display.newRect( 0, 0, display.contentWidth, 40)
scrollRect:setFillColor( 1, 1, 1 )
scrollRect.x = display.contentCenterX; scrollRect.y = display.contentHeight-60

------------------------------------------------------------------------------------------- create Algorithm name
local scrollRect = display.newRect( 0, 0, display.contentWidth-30, 40)
scrollRect:setFillColor( 1, 1, 1 )
scrollRect.x = display.contentCenterX; scrollRect.y = display.contentHeight-60
algorithmDisplay = display.newText("Algorithm",display.contentCenterX ,display.contentHeight-60 ,"Arial", 20)
algorithmDisplay: setFillColor(0,0,0,1)

------------------------------------------------------------------------------------- button
--rightButton
--Function to handle rightButton button events
--this will want to move to the next algorithm option in a list
local function rightButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The rightButton Button was pressed and released")
    end
end
 
-- Create the widget
local rightButton = widget.newButton(
    {
        id = "rightButton",
        label = ">>",
        onEvent = rightButtonEvent,
        
    }
)

--leftButton
--Function to handle leftButton button events
--this will want to move to the next algorithm option in a list
local function leftButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The leftButton Button was pressed and released")
    end
end
-- Create the widget
local leftButton = widget.newButton(
    {
        id = "leftButton",
        label = "<<",
        onEvent = leftButtonEvent
    }
)

--UploadFileButton
--Function to handle UploadFile button events
--this will want to upload a file into the project resources, and read in the data
local function uploadButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The UploadFile Button was pressed and released")
    end
end
-- Create the widget
local uploadButton = widget.newButton(
    {
        id = "uploadButton",
        label = "Upload",
        onEvent = uploadButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = { default={0,0,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

--submitButton
--Function to handle submitButton button events
-- this will want to apply the desired algorithm to the supplies data, and display the results on screen
local function submitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Submit Button was pressed and released")
    end
end
-- Create the widget
local submitButton = widget.newButton(
    {
        id = "submitButton",
        label = "Submit",
        onEvent = submitButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

--aboutButton
--Function to handle AboutApp button events
--this will need two different phases, one two open the about, and one to close it again
local function aboutButtonEvent(event)
  
    if ("ended" == event.phase) then
        print( "The AboutApp Button was pressed and released")
    end
end
-- Create the widget
local aboutButton = widget.newButton(
    {

        id = "aboutButton",
        label = "?",
        onEvent = aboutButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

--QuitButton
--Function to handle Quit button events
local function quitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Quit Button was pressed and released")
    end
end

-- Create the widget
local quitButton = widget.newButton(
    {
        id = "quitButton",
        label = "X",
        onEvent = quitButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

------------------------------------------------------------------------------------------- designate locations
quitButton.x =  display.contentCenterX +120
quitButton.y = display.contentHeight -460

aboutButton.x =  display.contentCenterX -120
aboutButton.y = display.contentHeight -460

uploadButton.x =  display.contentCenterX -115
uploadButton.y = display.contentHeight -15

submitButton.x = display.contentCenterX +115
submitButton.y = display.contentHeight -15

rightButton.x = display.contentCenterX +120
rightButton.y = display.contentHeight -60

leftButton.x = display.contentCenterX -120
leftButton.y = display.contentHeight -60
