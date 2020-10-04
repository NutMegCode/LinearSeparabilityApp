-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar)

local widget = require( "widget" ) -- require widget we gonna use this for buttons

--Create six buttons

--AboutApp
--Function to handle AboutApp button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AboutApp Button was pressed and released")
    end
end
 
-- Create the AboutApp button widget
local AboutApp = widget.newButton(
    {
        id = "AboutApp",
        label = "About App",
        onEvent = handleButtonEvent
    }
)

--Quit
--Function to handle Quit button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Quit Button was pressed and released")
    end
end
 
-- Create the Quit button widget
local Quit = widget.newButton(
    {
        id = "Quit",
        label = "X",
        onEvent = handleButtonEvent
    }
)
--UploadFile
--Function to handle UploadFile button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The UploadFile Button was pressed and released")
    end
end
 
-- Create the UploadFile button widget
local UploadFile = widget.newButton(
    {
        id = "UploadFile",
        label = "UploadFile",
        onEvent = handleButtonEvent
    }
)
--Submit
--Function to handle Submit button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Submit Button was pressed and released")
    end
end
 
-- Create the Submit button widget
local Submit = widget.newButton(
    {
        id = "Submit",
        label = "Submit",
        onEvent = handleButtonEvent
    }
)
--AlgorithmLeft
--Function to handle AlgorithmLeft button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmLeft Button was pressed and released")
    end
end
 
-- Create the AlgorithmLeft button widget
local AlgorithmLeft = widget.newButton(
    {
        id = "AlgorithmLeft",
        label = "<<",
        onEvent = handleButtonEvent
    }
)
--AlgorithmRight
--Function to handle AlgorithmRight button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmRight Button was pressed and released")
    end
end
 
-- Create the AlgorithmRight button widget
local AlgorithmRight = widget.newButton(
    {
        id = "AlgorithmRight",
        label = ">>",
        onEvent = handleButtonEvent
    }
)

-- Default Function to handle button events
local function handleButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "Button was pressed and released")
    end
end
 
-- Create the widget
local button1 = widget.newButton(
    {
        left = 100,
        top = 200,
        id = "button1",
        label = "Click Me",
        onEvent = handleButtonEvent
    }
)

--About app button placement 
AboutApp.x =  display.contentCenterX - 50
AboutApp.y = display.contentCenterY - 220

--About exit button placement
Quit.x =  display.contentCenterX +50
Quit.y = display.contentCenterY - 220

--About scroll left button placement
AlgorithmLeft.x =  display.contentCenterX -30 
AlgorithmLeft.y = display.contentHeight-30

--About scroll right button placement
AlgorithmRight.x =  display.contentCenterX +30 
AlgorithmRight.y = display.contentHeight-30