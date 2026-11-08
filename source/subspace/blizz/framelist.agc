
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUTTONTYPECLOSET 0
#constant BUTTONTYPESLIP 1
#constant BUTTONTYPESWITCH 2

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TFrameButton

	ButtonType as integer
	Body as TBody
	Button as TButton

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TFrame

	Body as TBody
	BackImage as TImage
	ImageList as TImage[-1]
	ButtonList as TFrameButton[-1]

	ImageIndex as integer

	ColorWhite as TColor

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameCreate(Frame ref as TFrame,ImageName ref as string[],ImageIndex as integer,Body ref as TBody,Galaxy ref as TGalaxy)

	local i as integer
	local Image as TImage

	Frame.Body = Body

	ColorSet(Frame.ColorWhite,255,255,255,255)

	Frame.ImageList.Length = -1
	
	ImageCreate(Frame.BackImage,"sector_back.png",Body,Frame.ColorWhite)

	for i = 0 to ImageName.Length
		ImageCreate(Image,ImageName[i],Body,Galaxy.PlayerColorList[FACTIONPLAYER])
		Frame.ImageList.Insert(Image)
	next i

	Frame.ImageIndex = ImageIndex

	Frame.ButtonList.Length = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddButton(Frame ref as TFrame,ButtonType as integer)

	local FrameButton as TFrameButton

	select ButtonType
		case BUTTONTYPECLOSET
			FrameAddButtonCloset(Frame,FrameButton,ButtonType)
		endcase
		case BUTTONTYPESLIP
			FrameAddButtonSlip(Frame,FrameButton,ButtonType)
		endcase
		case BUTTONTYPESWITCH
			FrameAddButtonSwitch(Frame,FrameButton,ButtonType)
		endcase
	endselect

	Frame.ButtonList.Insert(FrameButton)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddButtonCloset(Frame ref as TFrame,FrameButton ref as TFrameButton,ButtonType as integer)

	local Body as TBody

	FrameButton.ButtonType = ButtonType

	FrameButton.Body.Coordinate.X = Frame.Body.Size.Width * 0.5 - 10 - (32 + 5) * ButtonType
	FrameButton.Body.Coordinate.Y = - Frame.Body.Size.Height * 0.5 + 10

	Body = Frame.Body

	Body.Coordinate.X = Frame.Body.Coordinate.X + FrameButton.Body.Coordinate.X
	Body.Coordinate.Y = Frame.Body.Coordinate.Y + FrameButton.Body.Coordinate.Y

	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEBACK,"gui_galaxy_button_face_metalic.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEFRONT,"gui_galaxy_button_close.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,Frame.ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddButtonSlip(Frame ref as TFrame,FrameButton ref as TFrameButton,ButtonType as integer)

	local Body as TBody

	FrameButton.ButtonType = ButtonType

	FrameButton.Body.Coordinate.X = Frame.Body.Size.Width * 0.5 - 10 - (32 + 5) * ButtonType
	FrameButton.Body.Coordinate.Y = - Frame.Body.Size.Height * 0.5 + 10

	Body = Frame.Body

	Body.Coordinate.X = Frame.Body.Coordinate.X + FrameButton.Body.Coordinate.X
	Body.Coordinate.Y = Frame.Body.Coordinate.Y + FrameButton.Body.Coordinate.Y

	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEBACK,"gui_galaxy_button_face_metalic.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEFRONT,"gui_galaxy_button_slip.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,Frame.ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameAddButtonSwitch(Frame ref as TFrame,FrameButton ref as TFrameButton,ButtonType as integer)

	local Body as TBody

	FrameButton.ButtonType = ButtonType

	FrameButton.Body.Coordinate.X = Frame.Body.Size.Width * 0.5 - 10 - (32 + 5) * ButtonType
	FrameButton.Body.Coordinate.Y = - Frame.Body.Size.Height * 0.5 + 10

	Body = Frame.Body

	Body.Coordinate.X = Frame.Body.Coordinate.X + FrameButton.Body.Coordinate.X
	Body.Coordinate.Y = Frame.Body.Coordinate.Y + FrameButton.Body.Coordinate.Y

	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEBACK,"gui_galaxy_button_face_metalic.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEFRONT,"gui_galaxy_button_switch.png",Body,Frame.ColorWhite)
	ButtonImageCreate(FrameButton.Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,Frame.ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameRefresh(Frame ref as TFrame,ImageIndex as integer)

	local i as integer
	local Coordinate as TCoordinate

	// coord berechnen

	ImageSetCoordinate(Frame.BackImage,Coordinate)

	Frame.ImageIndex = ImageIndex

	for i = 0 to Frame.ButtonList.Length
		Coordinate.X = Frame.Body.Coordinate.X + Frame.ButtonList[i].Body.Coordinate.X
		Coordinate.Y = Frame.Body.Coordinate.Y + Frame.ButtonList[i].Body.Coordinate.Y
		ButtonRefreshCoordinate(Frame.ButtonList[i].Button,Coordinate)
	next i


endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameDraw(Frame ref as TFrame)

	local i as integer

	ImageDraw(Frame.BackImage)

	ImageDraw(Frame.ImageList[Frame.ImageIndex])

	for i = 0 to Frame.ButtonList.Length
		ButtonDraw(Frame.ButtonList[i].Button)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





