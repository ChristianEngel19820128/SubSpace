
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TText

	Enabled as integer
	
	TextString as string[-1]
	LanguageCode as integer
	TextSize as integer
	
	Body as TBody[-1]
	BodyIndex as integer
	Color as TColor
	
	TextID as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextDelete(Text ref as TText)

	Text.Enabled = 0
	
	if Text.TextID > 0
		if GetTextExists(Text.TextID) = 1
			DeleteText(Text.TextID)
		endif
	endif

	Text.TextID = 0
	
	Text.TextString.Length = -1
	Text.LanguageCode = -1

	Text.Body.Length = -1
	Text.BodyIndex = -1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextCreate(Text ref as TText,Body ref as TBody[],TextSize as integer,Color ref as TColor)
	
	local i as integer
	
	TextDelete(Text)
	
	Text.Enabled = 0
	
	Text.TextString.Length = -1
	Text.LanguageCode = -1
	
	Text.TextID = CreateText("")
	SetTextVisible(Text.TextID,1)
	SetTextAlignment(Text.TextID,1)
	
	BodyAdd(Text.Body,Body)
	Text.BodyIndex = 0
	
	Text.TextSize = TextSize

	Text.Color = Color
	
	TextRefresh(Text)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextCalcSize(Text ref as TText)

	local i as integer

	for i = 0 to Text.Body.Length
		Text.Body[i].Size.Width = GetTextTotalWidth(Text.TextID)
		Text.Body[i].Size.Height = GetTextTotalHeight(Text.TextID)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextAddTextString(Text ref as TText,TextString as string)

	Text.Enabled = 1

	Text.TextString.Insert(TextString)
	Text.LanguageCode = Text.TextString.Length
	SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
	TextCalcSize(Text)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetTextString(Text ref as TText,TextString as string)

	if Text.LanguageCode >= 0
		if Text.TextString.Length >= 0 and Text.TextString.Length >= Text.LanguageCode
			Text.TextString[Text.LanguageCode] = TextString
			SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
			TextCalcSize(Text)
		endif
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextRefresh(Text ref as TText)

	local Value as integer

	Value = 0

	if Text.TextID > 0
		if GetTextExists(Text.TextID) = 1

			if Text.LanguageCode >= 0
				if Text.TextString.Length >= 0 and Text.TextString.Length >= Text.LanguageCode
					SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
					TextCalcSize(Text)
				endif
			endif
			
			SetTextSize(Text.TextID,Text.TextSize)
			SetTextColor(Text.TextID,Text.Color.Red,Text.Color.Green,Text.Color.Blue,Text.Color.Alpha)
			SetTextPosition(Text.TextID,Text.Body[Text.BodyIndex].AbsoluteCoordinate.X,Text.Body[Text.BodyIndex].AbsoluteCoordinate.Y-Text.Body[Text.BodyIndex].Size.Height*0.5)

			Value = 1
			Text.Enabled = 1

		endif
	endif

endfunction Value


//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetTextSize(Text ref as TText,TextSize as integer)

	Text.TextSize = TextSize

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetColor(Text ref as TText,Color ref as TColor)

	Text.Color = Color

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetBody(Text ref as TText,Body ref as TBody[])

	BodyAdd(Text.Body,Body)
	Text.BodyIndex = 0

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextAddBody(Text ref as TText,Body ref as TBody)

	Text.Body.Insert(Body)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetLanguage(Text ref as TText,LanguageCode as integer)
	
	local Value as integer
	
	Value = 0
	
	if LanguageCode >= 0
		if Text.TextString.Length >= 0 and Text.TextString.Length >= LanguageCode
			Text.LanguageCode = LanguageCode
			SetTextString(Text.TextID,Text.TextString[Text.LanguageCode])
		endif
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextSetLanguageStrings(Text ref as TText,TextString ref as string[])
	
	local i as integer
	
	Text.TextString.Length = -1
	
	for i = 0 to TextString.Length
		Text.TextString.Insert(TextString[i])
	next i
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextCollide(Text ref as TText,Coordinate ref as TCoordinate)
	
	local Value as integer
	
	Value = 0
	
	if Text.BodyIndex >= 0
		if Text.Body.Length >= 0 and Text.Body.Length >= Text.BodyIndex
			Value = ObjectCollide(Text.Body[Text.BodyIndex].AbsoluteCoordinate,Text.Body[Text.BodyIndex].Size,Coordinate)
		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextDraw(Text ref as TText)
	
	local Value as integer
	
	Value = 0
	
	if Text.Enabled = 1
		if Text.TextID > 0
			if GetTextExists(Text.TextID) = 1
				TextRefresh(Text)
				DrawText(Text.TextID)
				Value = 1
			endif
		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------





