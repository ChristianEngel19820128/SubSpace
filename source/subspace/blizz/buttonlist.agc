
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant DRAWMODELINE 0
#constant DRAWMODEROTATE 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TButtonList

	Enabled as integer

	Body as TBody[-1]
	BodyIndex as integer

	Color as TColor

	DrawMode as integer

	Max as integer
	Button as TButton[-1]
	ButtonType as integer

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListCreate(ButtonList ref as TButtonList,Body ref as TBody[],Color ref as TColor)

	ButtonList.Enabled = 1

	ButtonList.Button.Length = -1
	ButtonList.Body.Length = -1

	BodyAdd(ButtonList.Body,Body)
	ButtonList.BodyIndex = 0

	ButtonList.Color = Color

	ButtonList.ButtonType = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListAddButton(ButtonList ref as TButtonList,Button ref as TButton)

	local Body as TBody[]

	ButtonList.Body[ButtonList.BodyIndex].Size = Button.Body[Button.BodyIndex].Size	
	Button.BodyIndex = 0
	Button.Color = ButtonList.Color
	
	if ButtonList.Body[ButtonList.BodyIndex].Alignment.AlignmentType <> ALIGNMENTNONE
		BodyAdd(Body,ButtonList.Body)
		BodySetAlignment(Body,ButtonList.Body,ButtonList.Button.Length+1,ButtonList.Max)
		ButtonSetBody(Button,Body)
	endif

	ButtonList.Button.Insert(Button)

endfunction ButtonList.Button.Length

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListRefresh(ButtonList ref as TButtonList)

	local i as integer

	if ButtonList.Enabled = 1
		for i = 0 to ButtonList.Button.Length
			ButtonRefresh(ButtonList.Button[i])
		next i
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListSelect(ButtonList ref as TButtonList,Index as integer)

	local i as integer
	local Value as integer

	Value = -1

	if ButtonList.Button[Index].Selected = 1
		ButtonUnSelectedSet(ButtonList.Button[Index])
	else
		for i = 0 to ButtonList.Button.Length
			ButtonUnSelectedSet(ButtonList.Button[i])
		next i
		ButtonSelectedSet(ButtonList.Button[Index])
		Value = ButtonList.Button[Index].ButtonType
	endif

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListInput(ButtonList ref as TButtonList,Mouse ref as TMouse)

	local i as integer
	local Value as integer

	Value = 0

	for i = 0 to ButtonList.Button.Length
		if ButtonHit(Mouse,ButtonList.Button[i]) > 0
			ButtonList.ButtonType = ButtonListSelect(ButtonList,i)
			Value = 1
		endif
	next i
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListDraw(ButtonList ref as TButtonList,Mouse ref as TMouse)

	local i as integer

	if ButtonList.Enabled = 1
		for i = 0 to ButtonList.Button.Length
			ButtonDraw(ButtonList.Button[i],Mouse)
		next i
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





