
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TImageList

	Enabled as integer

	Body as TBody[-1]
	BodyIndex as integer

	Color as TColor
	
	Image as TImage[-1]
	Index as integer

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListRefresh(ImageList ref as TImageList)

	local i as integer

	for i = 0 to ImageList.Image.Length
		ImageRefresh(ImageList.Image[i])
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListDelete(ImageList ref as TImageList)

	local i as integer

	for i = 0 to ImageList.Image.Length
		ImageDelete(ImageList.Image[i])
	next i

	ImageList.Image.Length = -1
	ImageList.Index = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListCreate(ImageList ref as TImageList,Body ref as TBody[],Color ref as TColor)

	ImageList.Enabled = 0

	ImageList.Body.Length = -1

	BodyAdd(ImageList.Body,Body)
	ImageList.BodyIndex = 0

	ImageList.Color = Color

	ImageListDelete(ImageList)
	ImageList.Index = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListAddImage(ImageList ref as TImageList,Image ref as TImage,Color ref as TColor)

	local NewImage as TImage

	ImageList.Enabled = 1

	ImageSet(NewImage,Image,ImageList.Body,Color)

	ImageList.Image.Insert(NewImage)
	ImageList.Index = ImageList.Image.Length

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListSetBody(ImageList ref as TImageList,Body ref as TBody[])

	local i as integer

	ImageList.Body.Length = -1
	BodyAdd(ImageList.Body,Body)

	for i = 0 to ImageList.Image.Length
		ImageSetBody(ImageList.Image[i],Body)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


