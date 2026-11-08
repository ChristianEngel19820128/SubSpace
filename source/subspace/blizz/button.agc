
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

	Enabled as integer
	ButtonType as integer
	Selected as integer

	SpecialValue as integer[-1]

	Body as TBody[-1]
	BodyIndex as integer

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

function ButtonRefreshRelativeCoordinate(Button ref as TButton,RelativeCoordinate ref as TCoordinate)
	
	local i as integer
	local k as integer

	if Button.Body.Length > -1 and Button.Body.Length >= Button.BodyIndex

		Button.Body[Button.BodyIndex].RelativeCoordinate = RelativeCoordinate
	
		for i = 0 to Button.ImageList.Length
			for k = 0 to Button.ImageList[i].Image.Length
				ImageSetRelativeCoordinate(Button.ImageList[i].Image[k],Button.Body[Button.BodyIndex].RelativeCoordinate)
			next k
		next i

	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonRefreshAbsoluteCoordinate(Button ref as TButton,AbsoluteCoordinate ref as TCoordinate)
	
	local i as integer
	local k as integer

	if Button.Body.Length > -1 and Button.Body.Length >= Button.BodyIndex

		Button.Body[Button.BodyIndex].AbsoluteCoordinate = AbsoluteCoordinate
	
		for i = 0 to Button.ImageList.Length
			for k = 0 to Button.ImageList[i].Image.Length
				ImageSetAbsoluteCoordinate(Button.ImageList[i].Image[k],Button.Body[Button.BodyIndex].AbsoluteCoordinate)
			next k
		next i

	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSet(Button ref as TButton,ImageType as integer,Body ref as TBody,Color ref as TColor)
	
	ButtonRefreshColor(Button,ImageType,Color)
	ButtonRefreshAbsoluteCoordinate(Button,Body.AbsoluteCoordinate)
	ButtonRefreshRelativeCoordinate(Button,Body.RelativeCoordinate)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonRefresh(Button ref as TButton)
	
	local i as integer

	for i = 0 to Button.ImageList.Length
		ImageListRefresh(Button.ImageList[i])
	next i

	TextRefresh(Button.Text)

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

function ButtonDelete(Button ref as TButton)

	local i as integer

	Button.Enabled = 0
	
	for i = 0 to Button.ImageList.Length
		ImageListDelete(Button.ImageList[i])
	next i

	TextDelete(Button.Text)

	Button.Body.Length = -1
	Button.BodyIndex = -1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonCreate(Button ref as TButton,ButtonType as integer,Body ref as TBody[],Color ref as TColor)

	local i as integer

	ButtonDelete(Button)

	Button.Enabled = 1
	Button.Selected = 0
	Button.ButtonType = ButtonType
	BodyAdd(Button.Body,Body)
	Button.BodyIndex = 0
	Button.Color = Color

	for i = 0 to Button.ImageList.Length
		ImageListCreate(Button.ImageList[i],Button.Body,Button.Color)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSetSpecialValue(Button ref as TButton,SpecialValue as integer[])

	local i as integer

	Button.SpecialValue.Length = -1

	for i = 0 to SpecialValue.Length
		Button.SpecialValue.Insert(SpecialValue[i])
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSetBody(Button ref as TButton,Body ref as TBody[])

	local i as integer

	Button.Body.Length = -1
	BodyAdd(Button.Body,Body)

	for i = 0 to Button.ImageList.Length
		ImageListSetBody(Button.ImageList[i],Body)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonAddBody(Button ref as TButton,Body ref as TBody)

	Button.Body.Insert(Body)
	Button.BodyIndex = Button.Body.Length

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSetBodyIndex(Button ref as TButton,BodyIndex as integer)

	Button.BodyIndex = BodyIndex

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonSetBodySize(Button ref as TButton,Size ref as TSize)

	local i as integer

	for i = 0 to Button.Body.Length
		Button.Body[i].Size = Size
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImageSet(Button ref as TButton,ImageType as integer,ImageIndex as integer)

	if Button.ImageList.Length >= ImageType
		if ImageIndex >= 0
			if Button.ImageList[ImageType].Image.Length >= 0 and Button.ImageList[ImageType].Image.Length >= ImageIndex
				Button.ImageList[ImageType].Index = ImageIndex
			endif
		endif
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImageSetImage(Button ref as TButton,ImageType as integer,Image ref as TImage,Color ref as TColor)
	
	ImageListAddImage(Button.ImageList[ImageType],Image,Color)
	ButtonSetBodySize(Button,Image.Body[Image.BodyIndex].Size)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonImageCreate(Button ref as TButton,ImageType as integer,ImageName as string,Body ref as TBody[],Color ref as TColor)

	local Image as TImage
	local ImageIndex as integer

	ImageCreate(Image,ImageName,Body,Color)
	ImageListAddImage(Button.ImageList[ImageType],Image,Color)
	ImageIndex = Button.ImageList[ImageType].Index
	
	ButtonImageSet(Button,ImageType,ImageIndex)
	ButtonSetBodySize(Button,Image.Body[Image.BodyIndex].Size)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonTextCreate(Button ref as TButton,TextString as string,Body ref as TBody[],TextSize as integer,Color ref as TColor)

	TextCreate(Button.Text,Body,TextSize,Color)
	TextAddTextString(Button.Text,TextString)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonHit(Mouse ref as TMouse,Button ref as TButton)
	
	local Value as integer

	Value = 0

	if Button.Enabled = 1
		if MouseClick(Mouse) = 1
			if Button.BodyIndex >= 0
				if Button.Body.Length >= 0 and Button.Body.Length >= Button.BodyIndex
					Value = ObjectCollide(Button.Body[Button.BodyIndex].AbsoluteCoordinate,Button.Body[Button.BodyIndex].Size,Mouse.Coordinate)
					//MouseRefresh(Mouse)
				endif
			endif
		endif
	endif

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ButtonDraw(Button ref as TButton,Mouse ref as TMouse)
	
	local i as integer
	local Coordinate as TCoordinate
	local Size as TSize
	
	if Button.Enabled = 1
		for i = 0 to Button.ImageList.Length
			if Button.ImageList[i].Image.Length >= 0
				select i
					case BUTTONIMAGEBACK
						ImageDraw(Button.ImageList[i].Image[Button.ImageList[i].Index])
					endcase
					case BUTTONIMAGEFRONT
						ImageDraw(Button.ImageList[i].Image[Button.ImageList[i].Index])
					endcase
					case BUTTONIMAGEOVERLAY
						Coordinate = Button.Body[Button.BodyIndex].AbsoluteCoordinate
						Size = Button.Body[Button.BodyIndex].Size
						if Mouseover(Mouse,Coordinate,Size) = 1
							ImageDraw(Button.ImageList[i].Image[Button.ImageList[i].Index])
						endif
					endcase
					case BUTTONIMAGESELECTED
						if Button.Selected = 1
							ImageDraw(Button.ImageList[i].Image[Button.ImageList[i].Index])
						endif
					endcase
				endselect
			endif
		next i
		TextDraw(Button.Text)
	endif
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



