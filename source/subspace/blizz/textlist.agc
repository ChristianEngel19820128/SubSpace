
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TTextList

	Enabled as integer
	
	Text as TText[-1]
	Max as integer
	LanguageCode as integer
	TextSize as integer	
	Body as TBody[-1]
	BodyIndex as integer
	Color as TColor
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListDelete(TextList ref as TTextList)

	local i as integer
	
	TextList.Enabled = 0
	
	for i = 0 to TextList.Text.Length
		TextDelete(TextList.Text[i])
	next i
	
	TextList.Text.Length = -1
	TextList.LanguageCode = -1
	TextList.Body.Length = -1
	TextList.BodyIndex = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListCreate(TextList ref as TTextList,Body ref as TBody[],TextSize as integer,Color ref as TColor)
	
	TextListDelete(TextList)
	
	TextList.Enabled = 1
	BodyAdd(TextList.Body,Body)
	TextList.BodyIndex = 0
	TextList.TextSize = TextSize
	TextList.Color = Color

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListAddText(TextList ref as TTextList,TextString as string)

	local Text as TText
	local Body as TBody[]

	BodyAdd(Body,TextList.Body)
	BodySetAlignment(Body,TextList.Body,TextList.Text.Length+1,TextList.Max)

	TextCreate(Text,Body,TextList.TextSize,TextList.Color)
	TextAddTextString(Text,TextString)

	
	TextList.Text.Insert(Text)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListSetTextString(TextList ref as TTextList,TextString ref as string[])

	local i as integer

	for i = 0 to TextList.Text.Length
		TextSetTextString(TextList.Text[i],TextString[i])
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListSetLanguage(TextList ref as TTextList,LanguageCode as integer)
	
	local i as integer
	
	TextList.LanguageCode = LanguageCode
	
	if TextList.Enabled = 1
		for i = 0 to TextList.Text.Length
			TextSetLanguage(TextList.Text[i],TextList.LanguageCode)
		next i
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListRefresh(TextList ref as TTextList)

	local i as integer
	
	if TextList.Enabled = 1
		for i = 0 to TextList.Text.Length
			TextRefresh(TextList.Text[i])
		next i
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function TextListDraw(TextList ref as TTextList)

	local i as integer
	
	if TextList.Enabled = 1
		for i = 0 to TextList.Text.Length
			TextDraw(TextList.Text[i])
		next i
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

