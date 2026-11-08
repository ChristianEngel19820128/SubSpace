
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TText

	Enabled as integer
	
	TextString as string[]
	LanguageCode as integer
	
	TextSize as integer
	
	Coordinate as TCoordinate
	Size as TSize
	Color as TColor
	
	TextID as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextCreate(Text ref as TText,Coordinate ref as TCoordinate,TextSize as integer,Color ref as TColor)
	
	Text.Enabled = 0
	
	Text.TextString[0] = ""
	
	Text.LanguageCode = 0
	Text.TextID = CreateText(Text.TextString[0])
	SetTextVisible(Text.TextID,0)
	SetTextAlignment(Text.TextID,1)
	
	Text.TextSize = TextSize
	Text.Coordinate = Coordinate
	Text.Color = Color
	
	TextRefresh(Text)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextRefresh(Text ref as TText)

	SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
	
	SetTextSize(Text.TextID,Text.TextSize)
	
	Text.Size.Width = GetTextTotalWidth(Text.TextID)
	Text.Size.Height = GetTextTotalHeight(Text.TextID)

	SetTextColor(Text.TextID,Text.Color.Red,Text.Color.Green,Text.Color.Blue,Text.Color.Alpha)

	SetTextPosition(Text.TextID,Text.Coordinate.X,Text.Coordinate.Y)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetCoordinate(Text ref as TText,Coordinate ref as TCoordinate)

	Text.Coordinate = Coordinate

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetString(Text ref as TText,TextString as string,LanguageCode as integer)
	
	Text.Enabled = 1
	
	Text.LanguageCode = LanguageCode
	Text.TextString[Text.LanguageCode] = TextString
	
	SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
	
	Text.Size.Width = GetTextTotalWidth(Text.TextID)
	Text.Size.Height = GetTextTotalHeight(Text.TextID)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetLanguage(Text ref as TText,LanguageCode as integer)
	
	local Value as integer
	Value = 0
	
	Text.LanguageCode = LanguageCode
	if Text.LanguageCode <= Text.TextString.Length
		SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetLanguageStrings(Text ref as TText,TextString ref as string[],LanguageMax as integer,LanguageCode as integer)
	
	local i as integer
	local Value as integer
	
	Value = 0

	Text.TextString.Length = LanguageMax
	
	for i = 0 to Text.TextString.Length
		Text.TextString[i] = TextString[i]
	next	i
	
	if Text.LanguageCode <= Text.TextString.Length
		Value = 1
		SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
	endif
		
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextCollide(Text ref as TText,Coordinate ref as TCoordinate,Size ref as TSize)
	
	local Value as integer
	
	Value = ObjectsCollide(Text.Coordinate,Text.Size,Coordinate,Size)
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextDraw(Text ref as TText)
	
	DrawText(Text.TextID)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





