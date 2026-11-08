
// Project: stars 
// Created: 26-01-23

// show all errors

SetErrorMode(2)

global wx as float
global wy as float
global vx as float
global vy as float
global sx as float
global sy as float
global cx as float
global cy as float

wx = 1600
wy = 900
vx = 1920
vy = 1080

sx = 1.0*vx/wx
sy = 1.0*vy/wy

cx = vx*0.5
cy = vy*0.5

// set window properties
SetWindowTitle("stars")
SetWindowSize(wx,wy,0)
SetWindowAllowResize(1) // allow the user to resize the window

// set display properties
SetVirtualResolution(vx,vy) // doesn't have to match the window
SetOrientationAllowed(0,0,1,1) // allow both portrait and landscape on mobile devices
SetSyncRate(60,0) // 30fps instead of 60 to save battery
SetScissor(0,0,0,0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(1)
SetRawMouseVisible(0)

#option_explicit

#include "inc.agc"

SetDefaultColors()

local Game as TGame
GameLoadData(Game)
OptionSetData(Game.Option)
Game.Option.Enabled = 1

repeat
	if Game.Option.Enabled = 1
		OptionInput(Game.Option,Game.Mouse)
		OptionDraw(Game.Option)
		MouseDraw(Game.Mouse)
		if OptionStartGame(Game.Option) = 1
			Game.Option.Enabled = 0
			GameInit(Game)
		endif
	else
		GameInput(Game)
		GameDo(Game)
		GameDraw(Game)
	endif
	//render()
	Swap()
until GetESCPressed() = 1
