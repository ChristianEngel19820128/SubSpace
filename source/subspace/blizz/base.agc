
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TColor
	Red as integer
	Green as integer
	Blue as integer
	Alpha as integer
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorSet(Color ref as TColor,Red as integer,Green as integer,Blue as integer,Alpha as integer)
	Color.Red   = Red
	Color.Green = Green
	Color.Blue  = Blue
	Color.Alpha = Alpha
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorBlend(Color ref as TColor,BlendColor ref as TColor)
	Color.Red   = (Color.Red   * BlendColor.Red)   / 255
	Color.Green = (Color.Green * BlendColor.Green) / 255
	Color.Blue  = (Color.Blue  * BlendColor.Blue)  / 255
	Color.Alpha = (Color.Alpha * BlendColor.Alpha) / 255
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TCoordinate
	X as float
	Y as float
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSize
	Width as float
	Height as float
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TScale
	X as float
	Y as float
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TAlignment
	horizontal as integer
	vertical as integer
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TBody
	Coordinate as TCoordinate
	Size as TSize
	Scale as TScale
	Alignment as TAlignment
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------
