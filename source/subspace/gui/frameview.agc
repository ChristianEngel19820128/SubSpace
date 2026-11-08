
//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameViewCreate(Frame ref as TFrame,FrameBody ref as TBody[],Game ref as TGame)

	local Button as TButton
	local Body as TBody[1]

	FrameBody[0].RelativeCoordinate.X = vx * 0.25
	FrameBody[0].RelativeCoordinate.Y = 0
	FrameBody[0].AbsoluteCoordinate.X = cx + FrameBody[0].RelativeCoordinate.X
	FrameBody[0].AbsoluteCoordinate.Y = cy + FrameBody[0].RelativeCoordinate.Y 

	FrameBody[0].Size.Width = 750
	FrameBody[0].Size.Height = 818

	FrameBody[0].Scale.X = 1
	FrameBody[0].Scale.Y = 1

	FrameBody[1].RelativeCoordinate.X = - (vx * 0.25)
	FrameBody[1].RelativeCoordinate.Y = 0
	FrameBody[1].AbsoluteCoordinate.X = cx + FrameBody[1].RelativeCoordinate.X
	FrameBody[1].AbsoluteCoordinate.Y = cy + FrameBody[1].RelativeCoordinate.Y 

	FrameBody[1].Size.Width = 750
	FrameBody[1].Size.Height = 818

	FrameBody[1].Scale.X = 1
	FrameBody[1].Scale.Y = 1

	FrameCreate(Frame,ColorWhite)
	FrameAdd(Frame,FrameBody[0],Game.FrameImages.ImageFrameBack,Game.FrameImages.ImageFrameNull)
	FrameAdd(Frame,FrameBody[1],Game.FrameImages.ImageFrameBack,Game.FrameImages.ImageFrameOne)

	Body[0].RelativeCoordinate.X = 375 - 30
	Body[0].RelativeCoordinate.Y = - 375 - 15
	Body[0].AbsoluteCoordinate.X = FrameBody[0].AbsoluteCoordinate.X + Body[0].RelativeCoordinate.X
	Body[0].AbsoluteCoordinate.Y = FrameBody[0].AbsoluteCoordinate.Y + Body[0].RelativeCoordinate.Y

	Body[1].RelativeCoordinate.X = Body[0].RelativeCoordinate.X
	Body[1].RelativeCoordinate.Y = Body[0].RelativeCoordinate.Y
	Body[1].AbsoluteCoordinate.X = FrameBody[1].AbsoluteCoordinate.X = Body[1].RelativeCoordinate.X
	Body[1].AbsoluteCoordinate.Y = FrameBody[1].AbsoluteCoordinate.Y = Body[1].RelativeCoordinate.Y
	
	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Body[1].Scale.X = 1
	Body[1].Scale.Y = 1

	ButtonCreate(Button,BUTTONTYPECLOSE,Body,ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACEMETALIC],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEFRAMECLOSE],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorYellow)
	FrameAddButton(Frame,Button)

	ButtonCreate(Button,BUTTONTYPESLIP,Body,ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACEMETALIC],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEFRAMECLOSE],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorYellow)
	FrameAddButton(Frame,Button)

	ButtonCreate(Button,BUTTONTYPESWITCH,Body,ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACEMETALIC],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEFRAMECLOSE],ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorYellow)
	FrameAddButton(Frame,Button)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------