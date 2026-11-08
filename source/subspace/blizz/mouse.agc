
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant MOUSECURSORSTANDARD 0
#constant MOUSECURSORSELECT 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TMouse
	
	Pressed as integer
	Hit as integer
	Coordinate as TCoordinate
	Time as integer
	
	Cursor as integer
	
	CursorSelectImageID as integer
	CursorSelectSpriteID as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function MouseLoadImages(Mouse ref as TMouse)
	
	Mouse.CursorSelectImageID = LoadImage("select.png")
	Mouse.CursorSelectSpriteID = CreateSprite(Mouse.CursorSelectImageID)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function MouseRefresh(Mouse ref as TMouse)
	
	//Mouse.Time = GetMilliseconds()
	Mouse.Pressed = 0
	Mouse.Hit = 0
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function MouseOver(Mouse ref as TMouse,Coordinate ref as TCoordinate,Size ref as TSize)
	
	local Value as integer
	
	Mouse.Coordinate.X = GetRawMouseX()
	Mouse.Coordinate.Y = GetRawMousey()
		
	Value = 0
	if Mouse.Coordinate.X > Coordinate.X - Size.Width*0.5 and Mouse.Coordinate.X < Coordinate.X + Size.Width*0.5 and Mouse.Coordinate.Y > Coordinate.Y - Size.Height*0.5 and Mouse.Coordinate.Y < Coordinate.Y + Size.Height*0.5
		Value = 1
	endif
		
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function MouseClick(Mouse ref as TMouse)
	
	if Mouse.Pressed = 1 and Mouse.Hit = 0 and GetRawMouseLeftReleased() = 1
		Mouse.Hit = 1
	endif
	
	if Mouse.Pressed = 0 and GetRawMouseLeftState() = 1
		Mouse.Coordinate.X = GetRawMouseX()
		Mouse.Coordinate.Y = GetRawMousey()
		Mouse.Pressed = 1
	endif
	
endfunction Mouse.Hit

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function MouseDraw(Mouse ref as TMouse)
	
	if GetRawMouseY() < 1
		SetRawMouseVisible(1)
	else
	
		select Mouse.Cursor
			case MOUSECURSORSTANDARD
				SetRawMouseVisible(1)
			endcase
			case default
				SetRawMouseVisible(0)
			endcase
		endselect
		
		select Mouse.Cursor
			case MOUSECURSORSTANDARD
				SetRawMouseVisible(1)
			endcase
			case MOUSECURSORSELECT
				SetSpritePositionByOffset(Mouse.CursorSelectSpriteID,GetRawMouseX(),GetRawMouseY())
				DrawSprite(Mouse.CursorSelectSpriteID)
			endcase
		endselect
	
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------
