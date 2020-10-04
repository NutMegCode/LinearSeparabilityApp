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
        label = "About App",
        onEvent = AboutAppButtonEvent
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
        onEvent = QuitButtonEvent
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
        onEvent = UploadFileButtonEvent
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
        onEvent = SubmitButtonEvent
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
AboutApp.x =  display.contentCenterX - 50
AboutApp.y = display.contentCenterY - 220

--Quit button placement
Quit.x =  display.contentCenterX +50
Quit.y = display.contentCenterY - 220

--AlgorithmLeft button placement
AlgorithmLeft.x =  display.contentCenterX -30 
AlgorithmLeft.y = display.contentHeight-30

--AlgorithmRight button placement
AlgorithmRight.x =  display.contentCenterX +30 
AlgorithmRight.y = display.contentHeight-30
