
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUTTONTYPEOPTION 0
#constant BUTTONTYPECLOSE 1
#constant BUTTONTYPESLIP 2
#constant BUTTONTYPESWITCH 3

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TFrame

	Body as TBody[-1]
	BlendColor as TColor

	BackImageList as TImage[-1]
	FrameImageList as TImage[-1]

	BodyIndex as integer
	BackImageIndex as integer
	FrameImageIndex as integer

	ButtonList as TButtonList

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameCreate(Frame ref as TFrame,BlendColor ref as TColor)

	Frame.BlendColor = BlendColor

	Frame.Body.Length = -1
	Frame.BackImageList.Length = -1
	Frame.FrameImageList.Length = -1

	Frame.BodyIndex = -1
	Frame.BackImageIndex = -1
	Frame.FrameImageIndex = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameIndexSet(Frame ref as TFrame,BodyIndex as integer,BackImageIndex as integer,FrameImageIndex as integer)

	Frame.BodyIndex = BodyIndex
	Frame.BackImageIndex = BackImageIndex
	Frame.FrameImageIndex = FrameImageIndex

	ButtonListRefresh(Frame.ButtonList)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAdd(Frame ref as TFrame,Body as TBody,ImageBack ref as TImage,ImageFrame ref as TImage)

	FrameAddBody(Frame,Body)
	FrameAddBackImage(Frame,ImageBack)
	FrameAddFrameImage(Frame,ImageFrame)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddBody(Frame ref as TFrame,Body ref as TBody)

	Frame.Body.Insert(Body)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddBackImage(Frame ref as TFrame,Image ref as TImage)

	Frame.BackImageList.Insert(Image)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddFrameImage(Frame ref as TFrame,Image ref as TImage)

	Frame.FrameImageList.Insert(Image)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameButtonListCreate(Frame ref as TFrame)

	local i as integer
	local Body as TBody[-1]

	BodyAdd(Body,Frame.Body)

	for i = 0 to Frame.Body.Length

		Body[i].RelativeCoordinate.X = Frame.Body[i].Size.Width * 0.5 - 10 - 16
		Body[i].RelativeCoordinate.Y = - Frame.Body[i].Size.Height * 0.5 + 10 + 16
	
		Body[i].AbsoluteCoordinate.X = Frame.Body[i].AbsoluteCoordinate.X + Body[i].RelativeCoordinate.X
		Body[i].AbsoluteCoordinate.Y = Frame.Body[i].AbsoluteCoordinate.Y + Body[i].RelativeCoordinate.Y

	next i

	ButtonListCreate(Frame.ButtonList,Body,ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddButton(Frame ref as TFrame,Button ref as TButton)

	local i as integer

	for i = 0 to Frame.ButtonList.Body.Length

		Button.Body[i].RelativeCoordinate.X = - ((Button.Body[i].Size.Width + 5) * (Frame.ButtonList.Button.Length+1))
		Button.Body[i].RelativeCoordinate.Y = 0
	
		Button.Body[i].AbsoluteCoordinate.X = Frame.ButtonList.Body[i].AbsoluteCoordinate.X + Button.Body[i].RelativeCoordinate.X
		Button.Body[i].AbsoluteCoordinate.Y = Frame.ButtonList.Body[i].AbsoluteCoordinate.Y + Button.Body[i].RelativeCoordinate.Y

	next i

	ButtonListAddButton(Frame.ButtonList,Button)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameRefresh(Frame ref as TFrame,ImageIndex as integer)

	local i as integer
	local Coordinate as TCoordinate

	Frame.FrameImageIndex = ImageIndex
	Frame.BackImageIndex = ImageIndex
	Frame.BodyIndex = ImageIndex

	ButtonListRefresh(Frame.ButtonList)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameDraw(Frame ref as TFrame,Mouse ref as TMouse)

	local i as integer

	if Frame.BackImageList.Length >= 0
		if Frame.BackImageList.Length >= Frame.BackImageIndex
			ImageDraw(Frame.BackImageList[Frame.BackImageIndex])
		endif
	endif

	if Frame.FrameImageList.Length >= 0
		if Frame.FrameImageList.Length >= Frame.FrameImageIndex
			ImageDraw(Frame.FrameImageList[Frame.FrameImageIndex])
		endif
	endif

	ButtonListDraw(Frame.ButtonList,Mouse)


endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





