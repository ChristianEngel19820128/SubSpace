
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUTTONIMAGEBACK 0
#constant BUTTONIMAGEFRONT 1
#constant BUTTONIMAGEOVERLAY 2
#constant BUTTONIMAGESELECTED 3

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TButton

	Enabeld as integer
	Selected as integer

	Body as TBody
	Color as TColor
	
	ImageList as TImageList[3]
	Text as TText

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonRefreshColor(Button ref as TButton,ImageType as integer,Color ref as TColor)
	
	if ImageType <= Button.ImageList.Length
		if Button.ImageList[ImageType].Image.Length >= Button.ImageList[ImageType].Index
			ImageSetColor(Button.ImageList[ImageType].Image[Button.ImageList[ImageType].Index],Color)
		endif
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonRefreshCoordinate(Button ref as TButton,Coordinate ref as TCoordinate)
	
	local i as integer
	local k as integer

	Button.Body.Coordinate = Coordinate

	for i = 0 to Button.ImageList.Length
		for k = 0 to Button.ImageList[i].Image.Length
			ImageSetCoordinate(Button.ImageList[i].Image[k],Button.Body.Coordinate)
		next k
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonRefresh(Button ref as TButton,ImageType as integer,Coordinate ref as TCoordinate,Color ref as TColor)
	
	ButtonRefreshColor(Button,ImageType,Color)
	ButtonRefreshCoordinate(Button,Coordinate)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSelectedSet(Button ref as TButton)

	Button.Selected = 1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonUnSelectedSet(Button ref as TButton)

	Button.Selected = 0

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonCreate(Button ref as TButton,Body ref as TBody,Color ref as TColor)

	Button.Enabeld = 0
	Button.Selected = 0

	Button.Body = Body
	Button.Color = Color

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImageSet(Button ref as TButton,ImageType as integer,ImageIndex as integer)

	if Button.ImageList.Length >= ImageType
		if Button.ImageList[ImageType].Image.Length >= ImageIndex
			Button.ImageList[ImageType].Index = ImageIndex
		endif
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImageCreate(Button ref as TButton,ImageType as integer,ImageName as string,Body ref as TBody,Color ref as TColor)

	local Image as TImage
	
	ImageCreate(Image,ImageName,Body,Color)
	Button.ImageList[ImageType].Image.Insert(Image)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonTextCreate(Button ref as TButton,TextString as string,Coordinate ref as TCoordinate,TextSize as integer,Color ref as TColor)

	TextCreate(Button.Text,Coordinate,TextSize,Color)
	TextSetString(Button.Text,TextString,0)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonHit(Mouse ref as TMouse,Button ref as TButton)
	
	local Value as integer

	Value = 0

	if MouseClick(Mouse) = 1
		Value = ObjectCollide(Button.Body.Coordinate,Button.Body.Size,Mouse.Coordinate)
	endif

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonDraw(Button ref as TButton)
	
	local i as integer
	
	for i = 0 to Button.ImageList.Length
		if Button.ImageList[i].Image.Length >= 0
			ImageDraw(Button.ImageList[i].Image[Button.ImageList[i].Index])
		endif
	next i
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



