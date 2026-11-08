
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGameTime
	
	Day as integer
	Time as integer
	DayTime as integer

	TextID as integer
	ButtonSkip as TButton

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeCreate(GameTime ref as TGameTime)
	
	local Body as TBody

	GameTime.Day = 1
	GameTime.Time = GetMilliseconds()
	GameTime.DayTime = 30000
	
	GameTime.TextID = CreateText(str(GameTime.Day))
	SetTextPosition(GameTime.TextID,cx,55)
	SetTextAlignment(GameTime.TextID,1)
	SetTextSize(GameTime.TextID,34)
	SetTextBold(GameTime.TextID,1)
	
	Body.Coordinate.X = cx
	Body.Coordinate.Y = 55+65

	ButtonImageCreate(GameTime.ButtonSkip,BUTTONIMAGEBACK,"skipday.png",Body,ColorWhite)
	ButtonTextCreate(GameTime.ButtonSkip,"SKIP",Body.Coordinate,34,ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeInit(GameTime ref as TGameTime)

	GameTime.Day = 1
	GameTime.Time = GetMilliseconds()

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeCheck(GameTime ref as TGameTime)
	
	local Value as integer
	
	Value = 0
	if GameTime.Time + GameTime.DayTime < GetMilliseconds()
		GameTime.Time = GetMilliseconds()
		inc GameTime.Day
		SetTextString(GameTime.TextID,str(GameTime.Day))
		Value = 1
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeSkipDay(GameTime ref as TGameTime)

	GameTime.Time = GetMilliseconds()-GameTime.DayTime
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeDraw(GameTime ref as TGameTime)

	DrawText(GameTime.TextID)
	ButtonDraw(GameTime.ButtonSkip)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeCheckSkipDay(GameTime ref as TGameTime,Mouse ref as TMouse)
	
	if ButtonClick(Mouse,GameTime.SkipCoordinate,GameTime.SkipSize) = 1
		MouseRefresh(Mouse)
		GameTimeSkipDay(GameTime)
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


