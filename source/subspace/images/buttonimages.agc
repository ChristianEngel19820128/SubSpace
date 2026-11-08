
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUTTONIMAGEFACE 0
#constant BUTTONIMAGEFACEMETALIC 1

#constant BUTTONIMAGEFABRIK 0
#constant BUTTONIMAGEKASERNE 1
#constant BUTTONIMAGECRYSTAL 2
#constant BUTTONIMAGESHIP 3

#constant BUTTONIMAGEFRAMESWITCH 0
#constant BUTTONIMAGEFRAMESLIP 1
#constant BUTTONIMAGEFRAMECLOSE 2
#constant BUTTONIMAGEFRAMEOPTION 3

#constant BUTTONIMAGEPLANETICONTINY 0
#constant BUTTONIMAGEPLANETICONSMALL 1
#constant BUTTONIMAGEPLANETICONMEDIUM 2
#constant BUTTONIMAGEPLANETICONBIG 3

#constant BUTTONIMAGEBUTTONOVERLAY 0
#constant BUTTONIMAGEPLANETOVERLAY 1
#constant BUTTONIMAGESECTOROVERLAY 2

#constant BUTTONIMAGEBUTTONSELECTED 0
#constant BUTTONIMAGEPLANETSELECTED 1
#constant BUTTONIMAGESECTORSELECTED 2
#constant BUTTONIMAGEPLANETICONSELECTED 3

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TButtonImages

	ImageListBack as TImage[-1]
	ImageListFrontButton as TImage[-1]
	ImageListFrontFrame as TImage[-1]
	ImageListFrontPlanet as TImage[-1]
	ImageListOverlay as TImage[-1]
	ImageListSelected as TImage[-1]
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImagesLoad(ButtonImages ref as TButtonImages)

	local Image as TImage
	local Body as TBody[0]
	local Color as TColor

	Body[0].AbsoluteCoordinate.X = 300
	Body[0].AbsoluteCoordinate.Y = 300

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Color = ColorWhite

	// back

	ImageCreateProto(Image,"button/button_face.png",Body,Color)
	ButtonImages.ImageListBack.Insert(Image)

	ImageCreateProto(Image,"button/button_face_metalic.png",Body,Color)
	ButtonImages.ImageListBack.Insert(Image)

	// front button

	ImageCreateProto(Image,"button/button_icon_fabrik.png",Body,Color)
	ButtonImages.ImageListFrontButton.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_kaserne.png",Body,Color)
	ButtonImages.ImageListFrontButton.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_crystal.png",Body,Color)
	ButtonImages.ImageListFrontButton.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_ship.png",Body,Color)
	ButtonImages.ImageListFrontButton.Insert(Image)

	// front frame

	ImageCreateProto(Image,"button/button_icon_switch.png",Body,Color)
	ButtonImages.ImageListFrontFrame.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_slip.png",Body,Color)
	ButtonImages.ImageListFrontFrame.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_close.png",Body,Color)
	ButtonImages.ImageListFrontFrame.Insert(Image)

	ImageCreateProto(Image,"button/button_icon_option.png",Body,Color)
	ButtonImages.ImageListFrontFrame.Insert(Image)

	// front planet

	ImageCreateProto(Image,"button/icon_planet_tiny.png",Body,Color)
	ButtonImages.ImageListFrontPlanet.Insert(Image)

	ImageCreateProto(Image,"button/icon_planet_small.png",Body,Color)
	ButtonImages.ImageListFrontPlanet.Insert(Image)

	ImageCreateProto(Image,"button/icon_planet_medium.png",Body,Color)
	ButtonImages.ImageListFrontPlanet.Insert(Image)

	ImageCreateProto(Image,"button/icon_planet_big.png",Body,Color)
	ButtonImages.ImageListFrontPlanet.Insert(Image)

	// overlay

	ImageCreateProto(Image,"button/button_overlay.png",Body,Color)
	ButtonImages.ImageListOverlay.Insert(Image)

	ImageCreateProto(Image,"button/planet_overlay.png",Body,Color)
	ButtonImages.ImageListOverlay.Insert(Image)

	ImageCreateProto(Image,"button/sector_overlay.png",Body,Color)
	ButtonImages.ImageListOverlay.Insert(Image)

	// selected

	ImageCreateProto(Image,"button/button_selected.png",Body,Color)
	ButtonImages.ImageListSelected.Insert(Image)

	ImageCreateProto(Image,"button/planet_selected.png",Body,Color)
	ButtonImages.ImageListSelected.Insert(Image)

	ImageCreateProto(Image,"button/sector_selected.png",Body,Color)
	ButtonImages.ImageListSelected.Insert(Image)

	ImageCreateProto(Image,"button/icon_planet_big_selected.png",Body,Color)
	ButtonImages.ImageListSelected.Insert(Image)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------





