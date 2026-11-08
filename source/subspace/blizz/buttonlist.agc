
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TButtonList

	Enabled as integer

	Body as TBody
	Color as TColor

	Button as TButton[-1]

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListCreate(ButtonList ref as TButtonList,Body ref as TBody,Color ref as TColor)

	ButtonList.Enabled = 0

	ButtonList.Body = Body
	ButtonList.Color = Color

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListAddButton(ButtonList ref as TButtonList,Button ref as TButton,Body ref as TBody,Color ref as TColor)

	ButtonList.Enabled = 1

	ButtonCreate(Button,Body,Color)
	ButtonList.Button.Insert(Button)

endfunction ButtonList.Button.Length

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonListDraw(ButtonList ref as TButtonList,Body ref as TBody,Color ref as TColor)

	local i as integer

	if ButtonList.Enabled = 1
		for i = 0 to ButtonList.Button.Length
			ButtonDraw(ButtonList.Button[i])
		next i
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





