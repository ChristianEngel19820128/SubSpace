
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGameTime
	
	Day as integer
	Time as integer
	DayTime as integer

	TimeText as TText
	ButtonSkip as TButton

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeCreate(GameTime ref as TGameTime)
	
	local Body as TBody[0]

	GameTime.Day = 1
	GameTime.Time = GetMilliseconds()
	GameTime.DayTime = 30000
	
	Body[0].AbsoluteCoordinate.X = cx
	Body[0].AbsoluteCoordinate.Y = 55

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	TextCreate(GameTime.TimeText,Body,34,ColorWhite)
	TextAddTextString(GameTime.TimeText,str(GameTime.Day))

	Body[0].AbsoluteCoordinate.X = cx
	Body[0].AbsoluteCoordinate.Y = 55+45

	ButtonCreate(GameTime.ButtonSkip,0,Body,ColorWhite)
	ButtonImageCreate(GameTime.ButtonSkip,BUTTONIMAGEBACK,"time/skipday.png",Body,ColorLightBlue)
	ButtonTextCreate(GameTime.ButtonSkip,"SKIP",Body,34,ColorBlack)

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
		TextSetTextString(GameTime.TimeText,str(GameTime.Day))
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

function GameTimeDraw(GameTime ref as TGameTime,Mouse ref as TMouse)

	TextDraw(GameTime.TimeText)
	ButtonDraw(GameTime.ButtonSkip,Mouse)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameTimeCheckSkipDay(GameTime ref as TGameTime,Mouse ref as TMouse)
	
	if ButtonHit(Mouse,GameTime.ButtonSkip) = 1
		GameTimeSkipDay(GameTime)
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


