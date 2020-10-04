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


------------------------------------------------------------------------------------- buttons

--Create six buttons

--AboutApp
--Function to handle AboutApp button events
--this will need two different phases, one two open the about, and one to close it again
local function AboutAppButtonEvent(event)
  
    if ("ended" == event.phase) then
        print( "The AboutApp Button was pressed and released")
    end
end
 
-- Create the AboutApp button widget
local AboutApp = widget.newButton(
    {
        id = "AboutApp",
        label = "?",
        onEvent = AboutAppButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,0,1}, over={0,0.8,0,1} },
        strokeColor = { default={0,1,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)

--Quit
--Function to handle Quit button events
local function QuitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Quit Button was pressed and released")
    end
end
 
-- Create the Quit button widget
local Quit = widget.newButton(
    {
        id = "Quit",
        label = "X",
        onEvent = QuitButtonEvent,
        shape = "roundedRect",
        width = 50,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)
--UploadFile
--Function to handle UploadFile button events
--this will want to upload a file into the project resources, and read in the data
local function UploadFileButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The UploadFile Button was pressed and released")
    end
end
 
-- Create the UploadFile button widget
local UploadFile = widget.newButton(
    {
        id = "UploadFile",
        label = "UploadFile",
        onEvent = UploadFileButtonEvent,
        shape = "roundedRect",
        width = 70,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,1,1,1}, over={0,0.8,0.8,1} },
        strokeColor = { default={0,0,1,1}, over={0.8,0.8,1,1} },
        strokeWidth = 1
    }
)
--Submit
--Function to handle Submit button events
-- this will want to apply the desired algorithm to the supplies data, and display the results on screen
local function SubmitButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The Submit Button was pressed and released")
    end
end
 
-- Create the Submit button widget
local Submit = widget.newButton(
    {
        id = "Submit",
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
--AlgorithmLeft
--Function to handle AlgorithmLeft button events
--this will want to move to the previous algorithm option in a list
local function AlgorithmLeftButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmLeft Button was pressed and released")
    end
end
 
-- Create the AlgorithmLeft button widget
local AlgorithmLeft = widget.newButton(
    {
        id = "AlgorithmLeft",
        label = "<<",
        onEvent = AlgorithmLeftButtonEvent
    }
)
--AlgorithmRight
--Function to handle AlgorithmRight button events
--this will want to move to the next algorithm option in a list
local function AlgorithmRightButtonEvent(event)
 
    if ("ended" == event.phase) then
        print( "The AlgorithmRight Button was pressed and released")
    end
end
 
-- Create the AlgorithmRight button widget
local AlgorithmRight = widget.newButton(
    {
        id = "AlgorithmRight",
        label = ">>",
        onEvent = AlgorithmRightButtonEvent
    }
)


--AboutApp button placement 
AboutApp.x = display.contentCenterX -120
AboutApp.y = display.contentCenterY -460

--Quit button placement
Quit.x = display.contentCenterX +120
Quit.y = display.contentCenterY -460

--AlgorithmLeft button placement
AlgorithmLeft.x = display.contentCenterX -120 
AlgorithmLeft.y = display.contentHeight -60

--AlgorithmRight button placement
AlgorithmRight.x = display.contentCenterX +120 
AlgorithmRight.y = display.contentHeight -60

--UploadFile button placement
UploadFile.x = display.contentCenterX -115
UploadFile.y = display.contentHeight -15

--Submit button placement
Submit.x = display.contentCenterX +115
Submit.y = display.contentHeight -15
