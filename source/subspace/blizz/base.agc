
#constant BLENDMODENONE 0
#constant BLENDMODEADD 1
#constant BLENDMODEMULTIPLY 2
#constant BLENDMODELIGHT 3

#constant ALIGNMENTNONE 0
#constant ALIGNMENTCENTER 1
#constant ALIGNMENTLEFT 2
#constant ALIGNMENTTOP 3
#constant ALIGNMENTRIGHT 4
#constant ALIGNMENTBOTTOM 5

#constant ROTATENONE 0
#constant ROTATELEFT 1
#constant ROTATERIGHT 2

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TColor
	Red as integer
	Green as integer
	Blue as integer
	Alpha as integer
	BlendMode as integer
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorSet(Color ref as TColor,Red as integer,Green as integer,Blue as integer,Alpha as integer,BlendMode as integer)
	Color.Red   = Red
	Color.Green = Green
	Color.Blue  = Blue
	Color.Alpha = Alpha
	Color.BlendMode = BlendMode
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorBlend(Color ref as TColor,BlendColor ref as TColor)

	select BlendColor.BlendMode
		case BLENDMODEADD
			ColorBlendAdd(Color,BlendColor)
		endcase
		case BLENDMODEMULTIPLY
			ColorBlendMultiply(Color,BlendColor)
		endcase
		case BLENDMODELIGHT
			ColorBlendLight(Color,BlendColor)
		endcase
	endselect

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorBlendAdd(Color ref as TColor,BlendColor ref as TColor)
	Color.Red   = (Color.Red   + BlendColor.Red)   / 2
	Color.Green = (Color.Green + BlendColor.Green) / 2
	Color.Blue  = (Color.Blue  + BlendColor.Blue)  / 2
	Color.Alpha = (Color.Alpha + BlendColor.Alpha) / 2
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorBlendMultiply(Color ref as TColor,BlendColor ref as TColor)
	Color.Red   = (Color.Red   * BlendColor.Red)   / 255
	Color.Green = (Color.Green * BlendColor.Green) / 255
	Color.Blue  = (Color.Blue  * BlendColor.Blue)  / 255
	Color.Alpha = (Color.Alpha * BlendColor.Alpha) / 255
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ColorBlendLight(Color ref as TColor,BlendColor ref as TColor)
	Color.Red   = 255-((255-Color.Red) * (255-BlendColor.Red)) / 255
	Color.Green = 255-((255-Color.Green) * (255-BlendColor.Green)) / 255
	Color.Blue  = 255-((255-Color.Blue) * (255-BlendColor.Blue)) / 255
	Color.Alpha = 255-((255-Color.Alpha) * (255-BlendColor.Alpha)) / 255
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

type TPosition
	X1 as float
	X2 as float
	Y1 as float
	Y2 as float
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
	AlignmentType as integer
	Horizontal as integer
	Vertical as integer
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function BodySetAlignment(Body ref as TBody[],NewBody ref as TBody[],Index as integer,IndexMax as integer)

	local i as integer

	for i = 0 to NewBody.Length

		select Body[i].Alignment.AlignmentType
			case ALIGNMENTCENTER
				Body[i].RelativeCoordinate.X = -((Body[i].Size.Width + Body[i].Alignment.Horizontal) * IndexMax) * 0.5 + ((Body[i].Size.Width + Body[i].Alignment.Horizontal) * Index)
				Body[i].AbsoluteCoordinate.X = NewBody[i].AbsoluteCoordinate.X + Body[i].RelativeCoordinate.X
			endcase
			case ALIGNMENTLEFT
				Body[i].RelativeCoordinate.X = -((Body[i].Size.Width + Body[i].Alignment.Horizontal) * Index)
				Body[i].AbsoluteCoordinate.X = NewBody[i].AbsoluteCoordinate.X + Body[i].RelativeCoordinate.X
			endcase
			case ALIGNMENTRIGHT
				Body[i].RelativeCoordinate.X = ((Body[i].Size.Width + Body[i].Alignment.Horizontal) * Index)
				Body[i].AbsoluteCoordinate.X = NewBody[i].AbsoluteCoordinate.X + Body[i].RelativeCoordinate.X
			endcase
			case ALIGNMENTTOP
				Body[i].RelativeCoordinate.Y = -((Body[i].Size.Height + Body[i].Alignment.Vertical) * Index)
				Body[i].AbsoluteCoordinate.Y = NewBody[i].AbsoluteCoordinate.Y + Body[i].RelativeCoordinate.Y
			endcase
			case ALIGNMENTBOTTOM
				Body[i].RelativeCoordinate.Y = ((Body[i].Size.Height + Body[i].Alignment.Vertical) * Index)
				Body[i].AbsoluteCoordinate.Y = NewBody[i].AbsoluteCoordinate.Y + Body[i].RelativeCoordinate.Y
			endcase
		endselect

	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TRotation
	RotationType as integer
	Radius as integer
	Angle as integer
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TBody
	AbsoluteCoordinate as TCoordinate
	RelativeCoordinate as TCoordinate
	Size as TSize
	Position as TPosition
	Scale as TScale
	Alignment as TAlignment
	Rotation as TRotation
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function BodyAdd(BodyList ref as TBody[],Body ref as TBody[])

	local i as integer

	for i = 0 to Body.Length
		BodyList.Insert(Body[i])
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function CalcRelativeCoordinate(RelativeCoordinate ref as TCoordinate,AbsoluteCoordinate ref as TCoordinate,CenterCoordinate ref as TCoordinate)

	RelativeCoordinate.X = AbsoluteCoordinate.X - CenterCoordinate.X
	RelativeCoordinate.Y = AbsoluteCoordinate.Y - CenterCoordinate.Y

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function CalcAbsoluteCoordinate(AbsoluteCoordinate ref as TCoordinate,RelativeCoordinate ref as TCoordinate,BaseCoordinate ref as TCoordinate)

	AbsoluteCoordinate.X = BaseCoordinate.X + RelativeCoordinate.X
	AbsoluteCoordinate.Y = BaseCoordinate.Y + RelativeCoordinate.Y

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function CalcPosition(Position ref as TPosition,AbsoluteCoordinate ref as TCoordinate,Size ref as TSize)

	Position.X1 = AbsoluteCoordinate.X - Size.Width  * 0.5
	Position.X2 = AbsoluteCoordinate.X + Size.Width  * 0.5
	Position.Y1 = AbsoluteCoordinate.Y - Size.Height * 0.5
	Position.Y2 = AbsoluteCoordinate.Y + Size.Height * 0.5

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



