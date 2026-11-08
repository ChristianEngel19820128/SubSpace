
//--------------------------------------------------------------
//
//--------------------------------------------------------------

global ColorWhite as TColor
global ColorBlack as TColor

global ColorRed as TColor
global ColorLightRed as TColor

global ColorDarkGreen as TColor
global ColorGreen as TColor
global ColorLightGreen as TColor

global ColorBlue as TColor
global ColorLightBlue as TColor

global ColorYellow as TColor
global ColorLightYellow as TColor

global ColorOrange as TColor
global ColorLightOrange as TColor

global ColorWhiteLight as TColor

global ColorSelected as TColor
global ColorFilterBack as TColor
global ColorFilterFront as TColor
global ColorFilterOverlay as TColor
global ColorFilterSelected as TColor

global ColorPlayer as TColor
global ColorEnemy as TColor
global ColorNeutral as TColor

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetDefaultColors()

	ColorSet(ColorWhite,255,255,255,255,0)
	ColorSet(ColorBlack,0,0,0,255,0)

	ColorSet(ColorDarkGreen,0,155,0,255,255)
	ColorSet(ColorGreen,0,255,0,255,255)
	ColorSet(ColorLightGreen,155,255,222,255,0)

	ColorSet(ColorBlue,0,0,255,255,0)
	ColorSet(ColorLightBlue,155,222,255,255,0)

	ColorSet(ColorYellow,55,255,55,255,0)

	ColorSet(ColorWhiteLight,255,255,255,255,3)
	
	ColorSet(ColorSelected,255,200,50,200,0)
	ColorSet(ColorFilterBack,0,155,0,200,0)
	ColorSet(ColorFilterFront,255,255,255,200,0)
	ColorSet(ColorFilterOverlay,200,255,200,200,0)
	ColorSet(ColorFilterSelected,55,255,55,200,0)
	
	ColorSet(ColorPlayer,0,127,255,255,0)
	ColorSet(ColorEnemy,255,0,127,255,0)
	ColorSet(ColorNeutral,255,255,200,255,0)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





